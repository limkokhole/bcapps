#!/bin/perl

# attempts to convert http://fullhouse.wikia.com to family tree using XML dl

require "/usr/local/lib/bclib.pl";

# TODO: this is only 4M so I can read it into memory, not generally true
my($all) = join("", `bzcat fullhouse_pages_current.xml.bz2`);

# TODO: could print one off?
# where to store data
my(@hashes);

# the hash converting wiki field names to gramps field names
# TODO: make this more sophisticated
my(%convert) = (
 # TODO: process name into pieces
 "Firstname" => "Firstname",
 "Lastname" => "Lastname",
 "Birth" => "Birthdate",
 "Portrayer" => "Note",
 "Gender" => "Gender",
 "Death" => "Deathdate"
);

# TODO: might be better to use gramps field names?
# wiki names for fields I want
my(@fields) = ("Firstname", "Lastname", "Birth", "Portrayer", "Gender",
	      "Death");

my(@header) = @fields;
map($_=$convert{$_}, @header);
print join(",", @header),"\n";

# NOTE: The "character" template is specific to this wiki

# TODO: this is imperfect and catches tests/examples but ok for now
while ($all=~s/{{Character(.*?)}}//s) {

  my($data) = $1;
  my(@csv);
  my(%hash);

  my(@data) = split(/\|/, $data);

  debug("DAT", @data);

  next; ###### TESTING!
  while ($data=~s/\s*\|(.*?)\s*\=\s*(.*?)\s*$//) {$hash{$1} = $2;}

  # NOTE: see which keys are most freq used
  for $i (keys %hash) {debug("KEY: $i, VAL: $hash{$i}");}

  # process hash

  # first word is first name
  if ($hash{Name}=~s/^(\S+)\s*//) {
    $hash{Firstname} = $1;
  } else {
    $hash{Firstname} = "?";
  }

  # last word is last name
  if ($hash{Name}=~s/(\S+)$//) {
    $hash{Lastname} = $1;
  } else {
    $hash{Lastname} = "?";
  }

  # TODO: middle name is remainder?

  for $i (@fields) {
    # get rid of links
    $hash{$i}=~s/[\[\]]//g;
    # must quote since dates can have embedded commas
    push(@csv, qq%"$hash{$i}"%);
  }

  print join(",", @csv),"\n";

}

# debug("ALL: $all");
