#!/bin/perl

# draws a latitude/longtiude grid that's modified in some way (part of
# larger attempt to create mercator maps w/ arbitrary 'north pole' and
# otherwise 'zoomed' maps); future idea is to use slippy tiles (OSM)
# and not try to recreate everything myself
# --gridonly: only draw the grid (useful for testing)

# TODO: adaptive zooming (zoom more where needed)

require "/usr/local/lib/bclib.pl";

latlonrot(0,0,0,"x");



die "TESTING";

# spacing in degrees
$latspace = 15;
$lonspace = 20;

# x/y of image
$xsize = 800;
$ysize = 600;

# the function
# $f = \&img_idtest;
# $f = \&sinusoidal;
# $f = \&polar;

# test of "pre" function
sub pre {
  my($lat,$lon) = @_;
  $lon= fmod($lon-+106.5,360);
  return $lat,$lon;
}

$proj = "ortho";
$div = 6378137;
$pre = \&pre;

open(A,">/tmp/bdg2.fly");

print A << "MARK";
new
size $xsize,$ysize
setpixel 0,0,255,255,255
MARK
;

for ($lat=90; $lat>=-90; $lat-=$latspace) {
  for ($lon=180; $lon>=-180; $lon-=$lonspace) {
#    ($x,$y) = &$f($lat, $lon);
    my($x,$y) = proj4($lat, $lon, $proj, $div, $xsize, $ysize, $pre);
    if ($x == -1) {next;}

    # position string a little "SE" of dot
    my($sx,$sy) = ($x+5, $y+5);
    print A "string 0,0,0,$sx,$sy,tiny,$lat,$lon\n";

    # line to next east longitude
#    my($xe,$ye) = &$f($lat, $lon+20);
    my($xe,$ye) = proj4($lat, $lon+20, $proj, $div, $xsize, $ysize, $pre);
    if ($xe == -1) {next;}
    print A "line $x,$y,$xe,$ye,255,0,0\n";

    # line to next south latitude
#    my($xs,$ys) = &$f($lat-15, $lon);
    my($xs,$ys) = proj4($lat-15, $lon, $proj, $div, $xsize, $ysize, $pre);
    if ($xs == -1) {next;}
    print A "line $x,$y,$xs,$ys,0,0,255\n";

    # fcircle must come last to avoid being overwritten by lines
    print A "circle $x,$y,5,0,0,0\n";

  }
}

close(A);

system("fly -i /tmp/bdg2.fly -o /tmp/bdg2.gif");

if ($globopts{gridonly}) {exit;}

# TODO: better temp file naming
open(A,">/tmp/bdg.fly")||die("Can't open /tmp/bdg.fly, $!");
print A << "MARK";
new
size $xsize,$ysize
MARK
;

# loop through all level 4 slippy tiles
for $x (0..15) {
  # TODO: not sure why y can't be 0 or 15?
  for $y (2..14) {
    debug("XY: $x $y");

    if ($taint{$x}{$y}) {
      debug("SKIPPING $x/$y, TAINTED");
      next;
    }

    # TODO: better temp file naming (but do cache stuff like this)
    # TODO: consider caching more carefully in future
#    if (-f "/tmp/bcdg-$x-$y.gif") {
#      warn("Using existing /tmp/bcdg-$x-$y.gif");
#      next;
# }

    # reset border and distortion parameters
    %border = ();
    @params = ();

    # below is sheer laziness, could've written out 4 statements
    for $px (0,255) {
      for $py (0,255) {
	# the borders of this slippy tile
	($lat,$lon) = slippy2latlon($x,$y,4,$px,$py);
	# how we would map this border
#	($myx, $myy) = &$f($lat,$lon);
	($myx, $myy) = proj4($lat,$lon,$proj,$div,$xsize,$ysize,$pre);

	if ($myx==-1 || $myy==-1) {
	  # can't use 'last' here, too deeply nested
	  $taint{$x}{$y} = 1;
	  debug("$x $y TAINTED");
	  last;
	}

	# the distortion parameter for convert (imagemagick)
	push(@params, "$px,$py,$myx,$myy");

      }
    }

    # skip if tainted
    if ($taint{$x}{$y}) {next;}

    print A "copy 0,0,0,0,$xsize,$ysize,/tmp/bcdg-$x-$y.gif\n";

    # build up the convert command
    $distort = join(" ",@params);
    $distort = "'$distort'";

    # and convert..
    $cmd = "convert -mattecolor transparent -extent ${xsize}x$ysize -background transparent -matte -virtual-pixel transparent -distort Perspective $distort /var/cache/OSM/4,$x,$y.png /tmp/bcdg-$x-$y.gif";
    system($cmd);
  }
}

close(A);

system("fly -i /tmp/bdg.fly -o /tmp/bdg1.gif");

# equiangular
sub img_idtest {
  my($lat,$lon) = @_;

  # using 800x600 hardcoded here = bad?
  my($y) = (90-$lat)*600/180;
  my($x) = ($lon+180)*800/360;

  return round($x),round($y);
}

# sinusoidal?

sub sinusoidal {
  my($lat,$lon) = @_;

  my($x) = 400 + ($lon/180)*400*cos($lat*$DEGRAD);
  my($y) = (90-$lat)*600/180;

  return round($x),round($y);
}

# polar

sub polar {
  my($lat,$lon) = @_;
  my($r) = (90-$lat)/180*300;
  my($x) = 400+$r*cos(-$lon*$DEGRAD);
  my($y) = 300+$r*sin(-$lon*$DEGRAD);
  return round($x),round($y);
}

# grab all level 4? OSM maps (this isn't as hideous as it looks thanks
# to caching) [only needed to do this once]
sub grab_osm_maps {
  for $lat (-82..82) {
    for $lon (-180..180) {
      debug(osm_map($lat,$lon,4));
    }
  }
}

=item proj4($lat, $lon, $proj, $div, $xsize=800, $ysize=600, &pre=NULL)

Given a cs2cs projection $proj, return the x/y coordinates of $lat,
$lon under $projection scaled by $div, assuming $xsize x $ysize image.

If given, apply pre() to latitude/longitude before peformring transformation

Return -1,-1 if coordinates are off-image.

TODO: calling cs2cs on each coordinate separately is hideously inefficient

=cut

sub proj4 {
  my($lat, $lon, $proj, $div, $xsize, $ysize, $pre) = @_;
  unless ($xsize) {$xsize=800;}
  unless ($ysize) {$ysize=600;}

#  debug("PRE: $pre");
#  debug("PRE PRE: $lat, $lon");
  if ($pre) {
    ($lat, $lon) = &$pre($lat,$lon);
  }
#  debug("POST PRE: $lat, $lon");

  # echoing back $lat/$lon is pointless here, but may be useful later
  # NOTE: +proj=latlon still requires lon/lat order
  my($lt, $lo, $x, $y) = split(/\s+/, `echo $lon $lat | cs2cs -E -e 'ERR ERR' +proj=latlon +to +proj=$proj 2> /dev/null`);

#  debug("RES: $lt $lo $x $y");

  # off image?
  if (abs($x)>$div || abs($y)>$div || $x eq "ERR") {return -1,-1;}

  # scale
#  debug("X: $x, XSIZE: $xsize, DIV: $div");
#  debug("Y: $y, YSIZE: $xsize, DIV: $div");
  $x = $xsize/2*(1+$x/$div);
  $y = $ysize/2*(1-$y/$div);

#  debug("XY: $x $y");
  return round($x),round($y);
}

=item latlonrot($lat, $lon, $th, $ax="x|y|z")

Given a latitude/longitude, rotate it $th degrees around the $ax axis.

z-axis: center of earth to north pole
x-axis: center of earth to intersection of prime meridian and equator
y-axis: center of earth to longitude +90, latitude 0 (right hand rule)

NOTE: this inefficiently uses rotdeg() which is sometimes unnecessary;
for example, rotation around the z axis simply adds to longitude and
preservers latitude.

NOT YET WRITTEN

=cut

sub latlonrot {
  my($lat, $lon, $th, $ax) = @_;

  # convert lat/lon to xyz coords (on sphere of radius 1)
  my($x,$y,$z) = sph2xyz($lon, $lat, 1);
  debug("OLD XYZ: $x, $y, $z");

  # perform the rotation
  my(@matrix) = rotdeg($th, $ax);
  debug("MATRIX",@matrix);
  my($nx,$ny,$nz) = matrixmult(\@matrix, [$x, $y, $z]);

  debug("NEW XYZ: $nx, $ny, $nz");

}
