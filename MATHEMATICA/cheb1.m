(* Below is the result of:

f1[x_] = Sum[a[n]*ChebyshevT[n,x],{n,0,14}]
f2[x_] = Sum[b[n]*ChebyshevT[n,x],{n,0,14}]

coeff[n_] := coeff[n] = 2/Pi*(
 Integrate[f1[x*2+1]/Sqrt[1-x^2]*ChebyshevT[n,x],{x,-1,0}] +
 Integrate[f2[x*2-1]/Sqrt[1-x^2]*ChebyshevT[n,x],{x,0,1}]
)

Table[coeff[n],{n,0,30}]

(with coeff[0] halved)

(takes a long time to compute this by hand)

*)

cheb1[a_,b_] := {(2*((Pi*(a[[1]] + a[[2]] + 5*a[[3]] + 25*a[[4]] +
129*a[[5]] + 681*a[[6]] + 3653*a[[7]] + 19825*a[[8]] + 108545*a[[9]] +
598417*a[[10]] + 3317445*a[[11]] + 18474633*a[[12]] +
103274625*a[[13]] + 579168825*a[[14]] + 3256957317*a[[15]]))/2 -
(2*(45045*a[[2]] + 180180*a[[3]] + 885885*a[[4]] + 4564560*a[[5]] +
24093069*a[[6]] + 129237108*a[[7]] + 701374245*a[[8]] +
3840133440*a[[9]] + 21170952517*a[[10]] + 117365432756*a[[11]] +
653600374765*a[[12]] + 3653676562640*a[[13]] + 20489985431325*a[[14]]
+ 115225483649940*a[[15]]))/45045 + 2*b[[2]] - 8*b[[3]] +
(2*(885885*b[[4]] - 4564560*b[[5]] + 24093069*b[[6]] -
129237108*b[[7]] + 701374245*b[[8]] - 3840133440*b[[9]] +
21170952517*b[[10]] - 117365432756*b[[11]] + 653600374765*b[[12]] -
3653676562640*b[[13]] + 20489985431325*b[[14]] -
115225483649940*b[[15]]))/45045 + (Pi*(b[[1]] - b[[2]] + 5*b[[3]] -
25*b[[4]] + 129*b[[5]] - 681*b[[6]] + 3653*b[[7]] - 19825*b[[8]] +
108545*b[[9]] - 598417*b[[10]] + 3317445*b[[11]] - 18474633*b[[12]] +
103274625*b[[13]] - 579168825*b[[14]] + 3256957317*b[[15]]))/2))/Pi/2,
(2*(-a[[1]] - (19*a[[3]])/3 - 33*a[[4]] - (2639*a[[5]])/15 -
(2851*a[[6]])/3 - (181427*a[[7]])/35 - (427343*a[[8]])/15 -
(7088941*a[[9]])/45 - (30638563*a[[10]])/35 - (483560947*a[[11]])/99 -
(1230689933*a[[12]])/45 - (461207756027*a[[13]])/3003 -
(599224533461*a[[14]])/693 - (31396995487283*a[[15]])/6435 + ((-2 +
Pi)*a[[2]] + Pi*(4*a[[3]] + 21*a[[4]] + 112*a[[5]] + 605*a[[6]] +
3300*a[[7]] + 18137*a[[8]] + 100288*a[[9]] + 557289*a[[10]] +
3109540*a[[11]] + 17410701*a[[12]] + 97773552*a[[13]] +
550473573*a[[14]] + 3106130244*a[[15]]))/2 + b[[1]] + (19*b[[3]])/3 -
33*b[[4]] + (2639*b[[5]])/15 - (2851*b[[6]])/3 + (181427*b[[7]])/35 -
(427343*b[[8]])/15 + (7088941*b[[9]])/45 - (30638563*b[[10]])/35 +
(483560947*b[[11]])/99 - (1230689933*b[[12]])/45 +
(461207756027*b[[13]])/3003 - (599224533461*b[[14]])/693 + ((-2 +
Pi)*b[[2]] + Pi*(-4*b[[3]] + 21*b[[4]] - 112*b[[5]] + 605*b[[6]] -
3300*b[[7]] + 18137*b[[8]] - 100288*b[[9]] + 557289*b[[10]] -
3109540*b[[11]] + 17410701*b[[12]] - 97773552*b[[13]] +
550473573*b[[14]] - 3106130244*b[[15]]))/2 +
(31396995487283*b[[15]])/6435))/Pi, (2*((-2*a[[2]])/3 + (-8/3 +
Pi)*a[[3]] + (-94/5 + 6*Pi)*a[[4]] + Pi*(36*a[[5]] + 210*a[[6]] +
1209*a[[7]] + 6916*a[[8]] + 39440*a[[9]] + 224604*a[[10]] +
1278505*a[[11]] + 7278106*a[[12]] + 41446980*a[[13]] +
236154750*a[[14]] + 1346377809*a[[15]]) - (2*(2546544*a[[5]] +
14858415*a[[6]] + 85544316*a[[7]] + 489351863*a[[8]] +
2790636992*a[[9]] + 15892197399*a[[10]] + 90462565180*a[[11]] +
514973456591*a[[12]] + 2932644091632*a[[13]] + 16709488419039*a[[14]]
+ 95265009097692*a[[15]]))/45045 + (2*b[[2]])/3 + (-8/3 + Pi)*b[[3]] +
(94/5 - 6*Pi)*b[[4]] + Pi*(36*b[[5]] - 210*b[[6]] + 1209*b[[7]] -
6916*b[[8]] + 39440*b[[9]] - 224604*b[[10]] + 1278505*b[[11]] -
7278106*b[[12]] + 41446980*b[[13]] - 236154750*b[[14]] +
1346377809*b[[15]]) - (2*(2546544*b[[5]] - 14858415*b[[6]] +
85544316*b[[7]] - 489351863*b[[8]] + 2790636992*b[[9]] -
15892197399*b[[10]] + 90462565180*b[[11]] - 514973456591*b[[12]] +
2932644091632*b[[13]] - 16709488419039*b[[14]] +
95265009097692*b[[15]]))/45045))/Pi, (2*(a[[1]]/3 + a[[2]]/3 -
(11*a[[3]])/15 + (-91/15 + 2*Pi)*a[[4]] + (-17*(2263833*a[[5]] +
15566265*a[[6]] + 99625097*a[[7]] + 614166553*a[[8]] +
3704245337*a[[9]] + 22036976793*a[[10]] + 129920292745*a[[11]] +
761239120697*a[[12]] + 4441057351961*a[[13]] + 25829081676281*a[[14]])
- 2548045887680153*a[[15]])/765765 + 2*Pi*(8*a[[5]] + 55*a[[6]] +
352*a[[7]] + 2170*a[[8]] + 13088*a[[9]] + 77862*a[[10]] +
459040*a[[11]] + 2689643*a[[12]] + 15691336*a[[13]] + 91260429*a[[14]]
+ 529580352*a[[15]]) - b[[1]]/3 + b[[2]]/3 + (11*b[[3]])/15 + (-91/15
+ 2*Pi)*b[[4]] - 2*Pi*(8*b[[5]] - 55*b[[6]] + 352*b[[7]] - 2170*b[[8]]
+ 13088*b[[9]] - 77862*b[[10]] + 459040*b[[11]] - 2689643*b[[12]] +
15691336*b[[13]] - 91260429*b[[14]] + 529580352*b[[15]]) +
(17*(2263833*b[[5]] - 15566265*b[[6]] + 99625097*b[[7]] -
614166553*b[[8]] + 3704245337*b[[9]] - 22036976793*b[[10]] +
129920292745*b[[11]] - 761239120697*b[[12]] + 4441057351961*b[[13]] -
25829081676281*b[[14]]) + 2548045887680153*b[[15]])/765765))/Pi,
(2*((2*a[[2]])/15 + (8*a[[3]])/15 - (22*a[[4]])/35 + (-1312/105 +
4*Pi)*a[[5]] + 4*Pi*(10*a[[6]] + 78*a[[7]] + 546*a[[8]] + 3604*a[[9]]
+ 22950*a[[10]] + 142730*a[[11]] + 873246*a[[12]] + 5280105*a[[13]] +
31649020*a[[14]] + 188454644*a[[15]]) - (2*(48121645*a[[6]] +
375297780*a[[7]] + 2627051973*a[[8]] + 17340444992*a[[9]] +
110422628325*a[[10]] + 686737317940*a[[11]] + 4201573702029*a[[12]] +
25404926337744*a[[13]] + 152277468293821*a[[14]] +
906738852462100*a[[15]]))/765765 - (2*b[[2]])/15 + (8*b[[3]])/15 +
(22*b[[4]])/35 + (-1312/105 + 4*Pi)*b[[5]] + (7918/63 - 40*Pi)*b[[6]]
+ 4*Pi*(78*b[[7]] - 546*b[[8]] + 3604*b[[9]] - 22950*b[[10]] +
142730*b[[11]] - 873246*b[[12]] + 5280105*b[[13]] - 31649020*b[[14]] +
188454644*b[[15]]) - (2*(375297780*b[[7]] - 2627051973*b[[8]] +
17340444992*b[[9]] - 110422628325*b[[10]] + 686737317940*b[[11]] -
4201573702029*b[[12]] + 25404926337744*b[[13]] -
152277468293821*b[[14]] + 906738852462100*b[[15]]))/ 765765))/Pi,
(2*(-a[[1]]/5 - a[[2]]/5 - a[[3]]/21 + (5*a[[4]])/7 - (127*a[[5]])/315
+ (-1129/45 + 8*Pi)*a[[6]] + (-19*(230951409*a[[7]] +
2020807425*a[[8]] + 15396619585*a[[9]] + 108603900801*a[[10]] +
729876717809*a[[11]] + 4747451199777*a[[12]] + 30171214337025*a[[13]]
+ 188494453715425*a[[14]]) - 22086522902393187*a[[15]])/14549535 +
8*Pi*(12*a[[7]] + 105*a[[8]] + 800*a[[9]] + 5643*a[[10]] +
37924*a[[11]] + 246675*a[[12]] + 1567680*a[[13]] + 9794070*a[[14]] +
60400200*a[[15]]) + b[[1]]/5 - b[[2]]/5 + b[[3]]/21 + (5*b[[4]])/7 +
(127*b[[5]])/315 + (-1129/45 + 8*Pi)*b[[6]] - 8*Pi*(12*b[[7]] -
105*b[[8]] + 800*b[[9]] - 5643*b[[10]] + 37924*b[[11]] -
246675*b[[12]] + 1567680*b[[13]] - 9794070*b[[14]] + 60400200*b[[15]])
+ (19*(230951409*b[[7]] - 2020807425*b[[8]] + 15396619585*b[[9]] -
108603900801*b[[10]] + 729876717809*b[[11]] - 4747451199777*b[[12]] +
30171214337025*b[[13]] - 188494453715425*b[[14]]) +
22086522902393187*b[[15]])/14549535))/Pi, (2*((-2*a[[2]])/35 -
(8*a[[3]])/35 - (14*a[[4]])/45 + (32*a[[5]])/45 - (158*a[[6]])/693 +
(-34808/693 + 16*Pi)*a[[7]] + 16*Pi*(14*a[[8]] + 136*a[[9]] +
1122*a[[10]] + 8435*a[[11]] + 59752*a[[12]] + 406320*a[[13]] +
2682680*a[[14]] + 17325238*a[[15]]) - (2*(5119304197*a[[8]] +
49731023168*a[[9]] + 410281356837*a[[10]] + 3084423867700*a[[11]] +
21849495774029*a[[12]] + 148578911728336*a[[13]] +
980974785820029*a[[14]] + 6335314549873428*a[[15]]))/14549535 +
(2*b[[2]])/35 - (8*b[[3]])/35 + (14*b[[4]])/45 + (32*b[[5]])/45 +
(158*b[[6]])/693 + (-34808/693 + 16*Pi)*b[[7]] + (2*(5119304197*b[[8]]
- 49731023168*b[[9]] + 410281356837*b[[10]] - 3084423867700*b[[11]] +
21849495774029*b[[12]] - 148578911728336*b[[13]] +
980974785820029*b[[14]] - 6335314549873428*b[[15]]))/14549535 +
16*Pi*(-14*b[[8]] + 136*b[[9]] - 1122*b[[10]] + 8435*b[[11]] -
59752*b[[12]] + 406320*b[[13]] - 2682680*b[[14]] +
17325238*b[[15]])))/Pi, (2*(a[[1]]/7 + a[[2]]/7 + (29*a[[3]])/315 -
(17*a[[4]])/105 - (667*a[[5]])/1155 + (43*a[[6]])/77 -
(2159*a[[7]])/15015 + (-4527773/45045 + 32*Pi)*a[[8]] +
(-23402842583*a[[9]] - 250118061975*a[[10]] - 2223271757095*a[[11]] -
17762771252215*a[[12]] - 132413385733911*a[[13]] -
940549269368631*a[[14]] - 6449149720943271*a[[15]])/14549535 +
32*Pi*(16*a[[9]] + 171*a[[10]] + 8*(190*a[[11]] + 1518*a[[12]] +
11316*a[[13]] + 80379*a[[14]] + 551142*a[[15]])) - b[[1]]/7 + b[[2]]/7
- (29*b[[3]])/315 - (17*b[[4]])/105 + (667*b[[5]])/1155 +
(43*b[[6]])/77 + (2159*b[[7]])/15015 + (-4527773/45045 + 32*Pi)*b[[8]]
+ (23402842583*b[[9]] - 250118061975*b[[10]] + 2223271757095*b[[11]] -
17762771252215*b[[12]] + 132413385733911*b[[13]] -
940549269368631*b[[14]] + 6449149720943271*b[[15]])/14549535 -
32*Pi*(16*b[[9]] - 171*b[[10]] + 8*(190*b[[11]] - 1518*b[[12]] +
11316*b[[13]] - 80379*b[[14]] + 551142*b[[15]]))))/Pi,
(2*((2*a[[2]])/63 + (8*a[[3]])/63 + (38*a[[4]])/165 + (32*a[[5]])/495
- (566*a[[6]])/819 + (536*a[[7]])/1365 - (614*a[[8]])/6435 +
(-9056896/45045 + 64*Pi)*a[[9]] + 128*Pi*(9*a[[10]] + 105*a[[11]] +
1001*a[[12]] + 8475*a[[13]] + 66365*a[[14]] + 491869*a[[15]]) -
(2*(26328262095*a[[10]] + 307162582300*a[[11]] +
3*(976094324205*a[[12]] + 8264135186640*a[[13]] +
64713785388317*a[[14]] + 479630903368596*a[[15]])))/14549535 -
(2*b[[2]])/63 + (8*b[[3]])/63 - (38*b[[4]])/165 + (32*b[[5]])/495 +
(566*b[[6]])/819 + (536*b[[7]])/1365 + (614*b[[8]])/6435 +
(-9056896/45045 + 64*Pi)*b[[9]] + (2*(26328262095*b[[10]] -
307162582300*b[[11]] + 3*(976094324205*b[[12]] - 8264135186640*b[[13]]
+ 64713785388317*b[[14]] - 479630903368596*b[[15]])))/14549535 +
128*Pi*(-9*b[[10]] + 105*b[[11]] - 1001*b[[12]] + 8475*b[[13]] -
66365*b[[14]] + 491869*b[[15]])))/Pi, (2*(-a[[1]]/9 - a[[2]]/9 -
(61*a[[3]])/693 + (19*a[[4]])/693 + (4241*a[[5]])/15015 +
(155*a[[6]])/429 - (445*a[[7]])/693 + (137*a[[8]])/495 -
(38749*a[[9]])/765765 + (-307930781/765765 + 128*Pi)*a[[10]] +
(-115*(7800954201*a[[11]] + 98682062985*a[[12]] +
1004762818921*a[[13]] + 8990208931145*a[[14]]) -
8488989863712379*a[[15]])/111546435 + 128*Pi*(20*a[[11]] + 253*a[[12]]
+ 2576*a[[13]] + 23049*a[[14]] + 189252*a[[15]]) + b[[1]]/9 - b[[2]]/9
+ (61*b[[3]])/693 + (19*b[[4]])/693 - (4241*b[[5]])/15015 +
(155*b[[6]])/429 + (445*b[[7]])/693 + (137*b[[8]])/495 +
(38749*b[[9]])/765765 + (-307930781/765765 + 128*Pi)*b[[10]] -
128*Pi*(20*b[[11]] - 253*b[[12]] + 2576*b[[13]] - 23049*b[[14]] +
189252*b[[15]]) + (115*(7800954201*b[[11]] - 98682062985*b[[12]] +
1004762818921*b[[13]] - 8990208931145*b[[14]]) +
8488989863712379*b[[15]])/111546435))/Pi, (2*((-2*a[[2]])/99 -
(8*a[[3]])/99 - (482*a[[4]])/3003 - (1376*a[[5]])/9009 +
(614*a[[6]])/4095 + (776*a[[7]])/1365 - (11546*a[[8]])/21879 +
(29312*a[[9]])/153153 - (35066*a[[10]])/1616615 +
(-11701337192/14549535 + 256*Pi)*a[[11]] + 256*Pi*(22*a[[12]] +
300*a[[13]] + 3250*a[[14]] + 30653*a[[15]]) - (2*(197364079781*a[[12]]
+ 2691328940112*a[[13]] + 29156063899989*a[[14]] +
274991023888756*a[[15]]))/22309287 + (2*b[[2]])/99 - (8*b[[3]])/99 +
(482*b[[4]])/3003 - (1376*b[[5]])/9009 - (614*b[[6]])/4095 +
(776*b[[7]])/1365 + (11546*b[[8]])/21879 + (29312*b[[9]])/153153 +
(35066*b[[10]])/1616615 + (-11701337192/14549535 + 256*Pi)*b[[11]] +
(2*(197364079781*b[[12]] - 2691328940112*b[[13]] +
29156063899989*b[[14]] - 274991023888756*b[[15]]))/22309287 -
256*Pi*(22*b[[12]] - 300*b[[13]] + 3250*b[[14]] - 30653*b[[15]])))/Pi,
(2*(a[[1]]/11 + a[[2]]/11 + (101*a[[3]])/1287 + (7*a[[4]])/429 -
(2027*a[[5]])/15015 - (911*a[[6]])/3003 - (2263*a[[7]])/19635 +
(5309*a[[8]])/8415 - (355603*a[[9]])/855855 + (11269*a[[10]])/95095 -
(42359*a[[11]])/2909907 - (23402841571*a[[12]])/14549535 +
512*Pi*a[[12]] - (287075088121*a[[13]])/7436429 + 12288*Pi*a[[13]] -
(322959477245*a[[14]])/572033 + 179712*Pi*a[[14]] -
(516735163837157*a[[15]])/79676025 + 2064384*Pi*a[[15]] - b[[1]]/11 +
b[[2]]/11 - (101*b[[3]])/1287 + (7*b[[4]])/429 + (2027*b[[5]])/15015 -
(911*b[[6]])/3003 + (2263*b[[7]])/19635 + (5309*b[[8]])/8415 +
(355603*b[[9]])/855855 + (11269*b[[10]])/95095 +
(42359*b[[11]])/2909907 - (23402841571*b[[12]])/ 14549535 +
512*Pi*b[[12]] + (287075088121*b[[13]])/7436429 - 12288*Pi*b[[13]] -
(322959477245*b[[14]])/572033 + 179712*Pi*b[[14]] +
(516735163837157*b[[15]])/79676025 - 2064384*Pi*b[[15]]))/Pi,
(2*((2*(11700675*a[[2]] + 46802700*a[[3]] + 96985595*a[[4]] +
120646960*a[[5]] + 23674475*a[[6]] - 242176660*a[[7]] -
308328685*a[[8]] + 500958400*a[[9]] - 260882445*a[[10]] +
56941100*a[[11]] - 10422005*a[[12]] - 3*(23324851960631*a[[14]] +
364226522449468*a[[15]]) + 80*((-33641643857 + 10708457760*Pi)*a[[13]]
+ 21416915520*Pi* (13*a[[14]] + 203*a[[15]]))))/1673196525 +
(2*(-11700675*b[[2]] + 46802700*b[[3]] - 96985595*b[[4]] +
120646960*b[[5]] - 23674475*b[[6]] - 242176660*b[[7]] +
308328685*b[[8]] + 500958400*b[[9]] + 260882445*b[[10]] +
56941100*b[[11]] + 10422005*b[[12]] + 69974555881893*b[[14]] +
80*((-33641643857 + 10708457760*Pi)*b[[13]] -
21416915520*Pi*(13*b[[14]] - 203*b[[15]])) -
1092679567348404*b[[15]]))/ 1673196525))/Pi, (2*((-3*(128707425*a[[1]]
+ 128707425*a[[2]] + 116226705*a[[3]] + 53823105*a[[4]] -
105244895*a[[5]] - 338707775*a[[6]] - 392540655*a[[7]] +
180175905*a[[8]] + 875924065*a[[9]] - 881386335*a[[10]] +
360830225*a[[11]] - 73057215*a[[12]] + 8459553*a[[13]] +
(10765316151553 - 3426706483200*Pi)*a[[14]]) + 7*(-129183791143157 +
41120477798400*Pi)*a[[15]])/5019589575 + (386122275*b[[1]] -
386122275*b[[2]] + 3*(116226705*b[[3]] - 53823105*b[[4]] -
105244895*b[[5]] + 338707775*b[[6]] - 392540655*b[[7]] -
180175905*b[[8]] + 875924065*b[[9]] + 881386335*b[[10]] +
360830225*b[[11]] + 73057215*b[[12]] + 8459553*b[[13]] +
(-10765316151553 + 3426706483200*Pi)*b[[14]]) + 7*(129183791143157 -
41120477798400*Pi)*b[[15]])/5019589575))/Pi, (2*((2*(-25741485*a[[2]]
- 102965940*a[[3]] - 218458485*a[[4]] - 306144720*a[[5]] -
205745925*a[[6]] + 256617900*a[[7]] + 832712355*a[[8]] +
336918720*a[[9]] - 1466997885*a[[10]] + 1086254700*a[[11]] -
355287141*a[[12]] + 74894256*a[[13]] + 1027819*a[[14]] +
4*(-8073985296413 + 2570029862400*Pi)* a[[15]]))/5019589575 +
(2*(25741485*b[[2]] - 102965940*b[[3]] + 218458485*b[[4]] -
306144720*b[[5]] + 205745925*b[[6]] + 256617900*b[[7]] -
832712355*b[[8]] + 336918720*b[[9]] + 1466997885*b[[10]] +
1086254700*b[[11]] + 355287141*b[[12]] + 74894256*b[[13]] -
1027819*b[[14]] + 4*(-8073985296413 +
2570029862400*Pi)*b[[15]]))/5019589575))/Pi, (2*((29*(334639305*a[[1]]
+ 334639305*a[[2]] + 310412025*a[[3]] + 189275625*a[[4]] -
127649655*a[[5]] - 654158295*a[[6]] - 1063891335*a[[7]] -
531360375*a[[8]] + 1319649225*a[[9]] + 1713010185*a[[10]] -
2912303751*a[[11]] + 1652551593*a[[12]] - 478669175*a[[13]] +
80107625*a[[14]]) - 153811147*a[[15]])/145568097675 +
(29*(-334639305*b[[1]] + 334639305*b[[2]] - 310412025*b[[3]] +
189275625*b[[4]] + 127649655*b[[5]] - 654158295*b[[6]] +
1063891335*b[[7]] - 531360375*b[[8]] - 1319649225*b[[9]] +
1713010185*b[[10]] + 2912303751*b[[11]] + 1652551593*b[[12]] +
478669175*b[[13]] + 80107625*b[[14]]) +
153811147*b[[15]])/145568097675))/Pi, (2*((2*(570855285*a[[2]] +
2283421140*a[[3]] + 4915826685*a[[4]] + 7358717520*a[[5]] +
6813254925*a[[6]] - 610505100*a[[7]] - 14589688155*a[[8]] -
20338595520*a[[9]] + 6157545669*a[[10]] + 35127340980*a[[11]] -
38243224723*a[[12]] + 17330548944*a[[13]] - 4700171619*a[[14]] +
477282708*a[[15]]))/145568097675 - (2*(570855285*b[[2]] -
2283421140*b[[3]] + 4915826685*b[[4]] - 7358717520*b[[5]] +
6813254925*b[[6]] + 610505100*b[[7]] - 14589688155*b[[8]] +
20338595520*b[[9]] + 6157545669*b[[10]] - 35127340980*b[[11]] -
38243224723*b[[12]] - 17330548944*b[[13]] - 4700171619*b[[14]] -
477282708*b[[15]]))/145568097675))/Pi, (2*((-31*(8562829275*a[[1]] +
8562829275*a[[2]] + 8082109035*a[[3]] + 5678507835*a[[4]] -
713486565*a[[5]] - 12092293125*a[[6]] - 24297425685*a[[7]] -
23639726565*a[[8]] + 6024778971*a[[9]] + 47203641243*a[[10]] +
17883552235*a[[11]] - 81020343173*a[[12]] + 63723088155*a[[13]] -
24885053765*a[[14]]) - 177094380533*a[[15]])/ 4512611027925 +
(31*(8562829275*b[[1]] - 8562829275*b[[2]] + 8082109035*b[[3]] -
5678507835*b[[4]] - 713486565*b[[5]] + 12092293125*b[[6]] -
24297425685*b[[7]] + 23639726565*b[[8]] + 6024778971*b[[9]] -
47203641243*b[[10]] + 17883552235*b[[11]] + 81020343173*b[[12]] +
63723088155*b[[13]] + 24885053765*b[[14]]) +
177094380533*b[[15]])/4512611027925))/Pi, (2*((-2*(13970931975*a[[2]]
+ 55883727900*a[[3]] + 121480579935*a[[4]] + 189472448880*a[[5]] +
204806876175*a[[6]] + 80761287420*a[[7]] - 227477583081*a[[8]] -
541260196416*a[[9]] - 355482956681*a[[10]] + 549673070780*a[[11]] +
702726815791*a[[12]] - 1271227675408*a[[13]] + 778140541503*a[[14]] -
272215163556*a[[15]]))/4512611027925 + (2*(13970931975*b[[2]] -
55883727900*b[[3]] + 121480579935*b[[4]] - 189472448880*b[[5]] +
204806876175*b[[6]] - 80761287420*b[[7]] - 227477583081*b[[8]] +
541260196416*b[[9]] - 355482956681*b[[10]] - 549673070780*b[[11]] +
702726815791*b[[12]] + 1271227675408*b[[13]] + 778140541503*b[[14]] +
272215163556*b[[15]]))/4512611027925))/Pi, (2*((237505843575*a[[1]] +
237505843575*a[[2]] + 226861323975*a[[3]] + 173638725975*a[[4]] +
30539358135*a[[5]] - 235481070825*a[[6]] - 569026914489*a[[7]] -
727287780681*a[[8]] - 312791704969*a[[9]] + 743934090807*a[[10]] +
1306492401735*a[[11]] - 384622402153*a[[12]] - 2047906975305*a[[13]] +
2328287255255*a[[14]] - 1195041605177*a[[15]])/ 4512611027925 +
(-237505843575*b[[1]] + 237505843575*b[[2]] - 226861323975*b[[3]] +
173638725975*b[[4]] - 30539358135*b[[5]] - 235481070825*b[[6]] +
569026914489*b[[7]] - 727287780681*b[[8]] + 312791704969*b[[9]] +
743934090807*b[[10]] - 1306492401735*b[[11]] - 384622402153*b[[12]] +
2047906975305*b[[13]] + 2328287255255*b[[14]] +
1195041605177*b[[15]])/4512611027925))/Pi, (2*((2*(11309802075*a[[2]]
+ 45239208300*a[[3]] + 99011387475*a[[4]] + 158742183600*a[[5]] +
187925522499*a[[6]] + 124582531788*a[[7]] - 84288347605*a[[8]] -
380702766400*a[[9]] - 479024827893*a[[10]] - 13745207924*a[[11]] +
15*(47312291565*a[[12]] + 15909468368*a[[13]] - 79782682083*a[[14]] +
66491455380*a[[15]])))/4512611027925 + (2*(-11309802075*b[[2]] +
45239208300*b[[3]] - 99011387475*b[[4]] + 158742183600*b[[5]] -
187925522499*b[[6]] + 124582531788*b[[7]] + 84288347605*b[[8]] -
380702766400*b[[9]] + 479024827893*b[[10]] - 13745207924*b[[11]] +
15*(-47312291565*b[[12]] + 15909468368*b[[13]] + 79782682083*b[[14]] +
66491455380*b[[15]])))/4512611027925))/Pi, (2*((-214886239425*a[[1]] -
214886239425*a[[2]] - 207018551025*a[[3]] - 167680109025*a[[4]] -
61086815361*a[[5]] + 142954741215*a[[6]] + 423499025807*a[[7]] +
639744241279*a[[8]] + 510884062271*a[[9]] - 180332409345*a[[10]] -
1048342440305*a[[11]] - 809849527201*a[[12]] + 1083567066495*a[[13]] +
1301207063455*a[[14]] - 2442044345329*a[[15]])/ 4512611027925 +
(214886239425*b[[1]] - 214886239425*b[[2]] + 207018551025*b[[3]] -
167680109025*b[[4]] + 61086815361*b[[5]] + 142954741215*b[[6]] -
423499025807*b[[7]] + 639744241279*b[[8]] - 510884062271*b[[9]] -
180332409345*b[[10]] + 1048342440305*b[[11]] - 809849527201*b[[12]] -
1083567066495*b[[13]] + 1301207063455*b[[14]] +
2442044345329*b[[15]])/4512611027925))/Pi, (2*((-2*(9342879975*a[[2]]
+ 37371519900*a[[3]] + 82197674559*a[[4]] + 134380117872*a[[5]] +
168799840495*a[[6]] + 140657299068*a[[7]] + 1988001015*a[[8]] -
240113693248*a[[9]] - 434826438057*a[[10]] - 290370943940*a[[11]] +
295953453327*a[[12]] + 657586174704*a[[13]] - 206517379809*a[[14]] -
959567936292*a[[15]]))/4512611027925 + (2*(9342879975*b[[2]] -
37371519900*b[[3]] + 82197674559*b[[4]] - 134380117872*b[[5]] +
168799840495*b[[6]] - 140657299068*b[[7]] + 1988001015*b[[8]] +
240113693248*b[[9]] - 434826438057*b[[10]] + 290370943940*b[[11]] +
295953453327*b[[12]] - 657586174704*b[[13]] - 206517379809*b[[14]] +
959567936292*b[[15]]))/4512611027925))/Pi,
(2*((37*(196200479475*a[[1]] + 196200479475*a[[2]] +
190221036291*a[[3]] + 160323820371*a[[4]] + 78849536051*a[[5]] -
80392477165*a[[6]] - 312972269181*a[[7]] - 536311845069*a[[8]] -
558273011725*a[[9]] - 158835829581*a[[10]] + 606473537155*a[[11]] +
1034541203091*a[[12]] + 142169209395*a[[13]] - 1412260061485*a[[14]])
- 15340932167057*a[[15]])/ 166966608033225 + (-37*(196200479475*b[[1]]
- 196200479475*b[[2]] + 190221036291*b[[3]] - 160323820371*b[[4]] +
78849536051*b[[5]] + 80392477165*b[[6]] - 312972269181*b[[7]] +
536311845069*b[[8]] - 558273011725*b[[9]] + 158835829581*b[[10]] +
606473537155*b[[11]] - 1034541203091*b[[12]] + 142169209395*b[[13]] +
1412260061485*b[[14]]) + 15340932167057*b[[15]])/166966608033225))/Pi,
(2*((2*(290376709623*a[[2]] + 1161506838492*a[[3]] +
2564226075983*a[[4]] + 4252712868976*a[[5]] + 5567219644415*a[[6]] +
5289792064700*a[[7]] + 1936306322951*a[[8]] - 4986271923776*a[[9]] -
12704260500633*a[[10]] - 13863210658180*a[[11]] -
1263789078497*a[[12]] + 18206658650096*a[[13]] +
15965500229679*a[[14]] - 20030899899108*a[[15]]))/166966608033225 -
(2*(290376709623*b[[2]] - 1161506838492*b[[3]] + 2564226075983*b[[4]]
- 4252712868976*b[[5]] + 5567219644415*b[[6]] - 5289792064700*b[[7]] +
1936306322951*b[[8]] + 4986271923776*b[[9]] - 12704260500633*b[[10]] +
13863210658180*b[[11]] - 1263789078497*b[[12]] -
18206658650096*b[[13]] + 15965500229679*b[[14]] +
20030899899108*b[[15]]))/166966608033225))/Pi,
(2*((-6678664321329*a[[1]] - 6678664321329*a[[2]] -
6506589234145*a[[3]] - 5646213798225*a[[4]] - 3291412851441*a[[5]] +
1382587299951*a[[6]] + 8503915797663*a[[7]] + 16274445762575*a[[8]] +
19860691103695*a[[9]] + 12435964113807*a[[10]] - 8681149137505*a[[11]]
- 31406998365457*a[[12]] - 26971866896625*a[[13]] +
18498380566575*a[[14]] + 49355003461407*a[[15]])/ 166966608033225 +
(6678664321329*b[[1]] - 6678664321329*b[[2]] + 6506589234145*b[[3]] -
5646213798225*b[[4]] + 3291412851441*b[[5]] + 1382587299951*b[[6]] -
8503915797663*b[[7]] + 16274445762575*b[[8]] - 19860691103695*b[[9]] +
12435964113807*b[[10]] + 8681149137505*b[[11]] -
31406998365457*b[[12]] + 26971866896625*b[[13]] +
18498380566575*b[[14]] - 49355003461407*b[[15]])/166966608033225))/Pi,
(2*((-2*(247357937827*a[[2]] + 989431751308*a[[3]] +
2190619698267*a[[4]] + 3672913067824*a[[5]] + 4955387557835*a[[6]] +
5127491697900*a[[7]] + 2982377478899*a[[8]] - 2233528841024*a[[9]] -
9281163935277*a[[10]] - 13461026664020*a[[11]] - 8054034252693*a[[12]]
+ 7947879651504*a[[13]] + 19618906371771*a[[14]] +
4029752254668*a[[15]]))/166966608033225 + (2*(247357937827*b[[2]] -
989431751308*b[[3]] + 2190619698267*b[[4]] - 3672913067824*b[[5]] +
4955387557835*b[[6]] - 5127491697900*b[[7]] + 2982377478899*b[[8]] +
2233528841024*b[[9]] - 9281163935277*b[[10]] + 13461026664020*b[[11]]
- 8054034252693*b[[12]] - 7947879651504*b[[13]] +
19618906371771*b[[14]] - 4029752254668*b[[15]]))/166966608033225))/Pi,
(2*((41*(6183948445675*a[[1]] + 6183948445675*a[[2]] +
6047475100667*a[[3]] + 5365108375627*a[[4]] + 3491231730987*a[[5]] -
272216950005*a[[6]] - 6186697438597*a[[7]] - 13203653661653*a[[8]] -
18028962329365*a[[9]] - 15303736479317*a[[10]] - 905706002565*a[[11]]
+ 20812076872587*a[[12]] + 31302754080555*a[[13]] +
8761800270795*a[[14]]) - 1432016677651917*a[[15]])/ 6845630929362225 +
(41*(-6183948445675*b[[1]] + 6183948445675*b[[2]] -
6047475100667*b[[3]] + 5365108375627*b[[4]] - 3491231730987*b[[5]] -
272216950005*b[[6]] + 6186697438597*b[[7]] - 13203653661653*b[[8]] +
18028962329365*b[[9]] - 15303736479317*b[[10]] + 905706002565*b[[11]]
+ 20812076872587*b[[12]] - 31302754080555*b[[13]] +
8761800270795*b[[14]]) +
1432016677651917*b[[15]])/6845630929362225))/Pi,
(2*((2*(8742823664575*a[[2]] + 34971294658300*a[[3]] +
77602430953047*a[[4]] + 131221322408176*a[[5]] +
181122813843335*a[[6]] + 198926783335644*a[[7]] +
144741864077135*a[[8]] - 14181703674944*a[[9]] -
260881473922641*a[[10]] - 476874631141220*a[[11]] -
445293237449049*a[[12]] - 12711152220048*a[[13]] +
587607315604023*a[[14]] + 625578016817724*a[[15]]))/6845630929362225 -
(2*(8742823664575*b[[2]] - 34971294658300*b[[3]] +
77602430953047*b[[4]] - 131221322408176*b[[5]] +
181122813843335*b[[6]] - 198926783335644*b[[7]] +
144741864077135*b[[8]] + 14181703674944*b[[9]] -
260881473922641*b[[10]] + 476874631141220*b[[11]] -
445293237449049*b[[12]] + 12711152220048*b[[13]] +
587607315604023*b[[14]] -
625578016817724*b[[15]]))/6845630929362225))/Pi, (2*(-a[[1]]/29 -
a[[2]]/29 + (-43*(231543813826325*a[[3]] + 208981688240325*a[[4]] +
146857900990437*a[[5]] + 20936626992645*a[[6]] -
181665706231659*a[[7]] - 436611151634203*a[[8]] -
651411253008347*a[[9]] - 658159808681115*a[[10]] -
284708497015915*a[[11]] + 452294460239237*a[[12]] +
1115676534707685*a[[13]] + 921581577712965*a[[14]]) +
19021089054878841*a[[15]])/294362129962575675 + b[[1]]/29 - b[[2]]/29
+ (9956383994531975*b[[3]] - 43*(208981688240325*b[[4]] -
146857900990437*b[[5]] + 20936626992645*b[[6]] +
181665706231659*b[[7]] - 436611151634203*b[[8]] +
651411253008347*b[[9]] - 658159808681115*b[[10]] +
284708497015915*b[[11]] + 452294460239237*b[[12]] -
1115676534707685*b[[13]] + 921581577712965*b[[14]]) -
19021089054878841*b[[15]])/294362129962575675))/Pi,
(2*((-2*(327432847566825*a[[2]] + 1309731390267300*a[[3]] +
2911616668094225*a[[4]] + 4956693881011600*a[[5]] +
6963959608578401*a[[6]] + 7991163227516612*a[[7]] +
6655462603622105*a[[8]] + 1626740858267200*a[[9]] -
7130754804790407*a[[10]] - 16597428948980476*a[[11]] -
19939033700266175*a[[12]] - 9764457633691120*a[[13]] +
12691361134532145*a[[14]] + 28633834568768100*a[[15]]))/
294362129962575675 + (2*(327432847566825*b[[2]] -
1309731390267300*b[[3]] + 2911616668094225*b[[4]] -
4956693881011600*b[[5]] + 6963959608578401*b[[6]] -
7991163227516612*b[[7]] + 6655462603622105*b[[8]] -
1626740858267200*b[[9]] - 7130754804790407*b[[10]] +
16597428948980476*b[[11]] - 19939033700266175*b[[12]] +
9764457633691120*b[[13]] + 12691361134532145*b[[14]] -
28633834568768100*b[[15]]))/ 294362129962575675))/Pi} ;

