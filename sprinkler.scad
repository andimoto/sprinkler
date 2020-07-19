include <waterHoseConnector.scad>

polyRes = 64;
sprinklerHight = 60; // minimum wallthickness
r = 38/2;
rSprinklerHole=1;
spHighCorr=0;

module sprinkler(end=false)
{
difference()
{
union()
{
/* hose connector on each side */
translate([0,0,60]) hoseConnector();
if(end==false) rotate([0,180,0]) hoseConnector();

cylinder(r=r,h=sprinklerHight,$fn=polyRes);
}

/* set correction if sprinkler is end point */
spHighCorr = (end) ? 2 : 0;

/* translate([0,0,1]) cylinder(r=r-2,h=sprinklerHight-2,$fn=polyRes); */
translate([0,0,spHighCorr]) cylinder(r=8,h=sprinklerHight-spHighCorr,$fn=polyRes);

translate([0,7,40])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

translate([0,7,30])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

translate([0,7,20])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

/* cylinder(r=10, h=10, center=true); */
/* translate([0,-30,-30]) cube([60,60,120]); */
}
}

sprinkler(end=true);
translate([50,0,0]) sprinkler(end=false);
