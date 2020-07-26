
polyRes = 64;
sprinklerHight = 60; // minimum wallthickness
r = 10;
rSprinklerHole=1;
spHighCorr=0;

module hoseCylinderProfile()
{
  // Outer Diameter (bottom)
  outer_diameter_1 = 15;
  // Wall Thickness (bottom)
  wall_thickness_1 = 2;
  // Rib Thickness (bottom), set to Zero to remove
  barb_size_1 = 0.5;
  // Length (bottom)
  length_1 = 15;
  // Outer Diameter (top), should be smaller than or equal to Outer Diameter (bottom)
  outer_diameter_2 = 12;
  // Wall Thickness (top)
  wall_thickness_2 = 1;
  // Rib Thickness (top), set to Zero to remove
  barb_size_2 = 0.5;
  // Length (top)
  length_2 = 15;
  // Middle Diameter
  mid_diameter = 17;
  // Middle Length
  mid_length = 5;


  //do not change these
  inner_diameter_1 = outer_diameter_1 - (wall_thickness_1*2);
  inner_diameter_2 = outer_diameter_2 - (wall_thickness_2*2);
  translate([inner_diameter_2/2,length_1+mid_length,0])square([wall_thickness_2,length_2]);
  //rib 1
  translate([outer_diameter_2/2,(length_1+mid_length+length_2),0])polygon(points=[[0,0],[0,-1*(length_2/5)],[barb_size_2,-1*(length_2/5)]]);
  //rib 2
  translate([outer_diameter_2/2,(length_1+mid_length+length_2)-length_2*0.25,0])polygon(points=[[0,0],[0,-1*(length_2/5)],[barb_size_2,-1*(length_2/5)]]);
  //rib 3
  translate([outer_diameter_2/2,(length_1+mid_length+length_2)-length_2*0.5,0])polygon(points=[[0,0],[0,-1*(length_2/5)],[barb_size_2,-1*(length_2/5)]]);

}

module sprinkler(end=false)
{
difference()
{
union()
{
/* hose connector on each side */
translate([0,0,40])  rotate_extrude(angle = 360, convexity = 10, $fn=polyRes) hoseCylinderProfile();
if(end==false) translate([0,0,20]) rotate([0,180,0]) rotate_extrude(angle = 360, convexity = 10, $fn=polyRes) hoseCylinderProfile();

cylinder(r=r,h=sprinklerHight,$fn=polyRes);
}

/* set correction if sprinkler is end point */
spHighCorr = (end) ? 2 : 0;

/* translate([0,0,1]) cylinder(r=r-2,h=sprinklerHight-2,$fn=polyRes); */
translate([0,0,spHighCorr]) cylinder(r=5,h=sprinklerHight-spHighCorr,$fn=polyRes);

/*sprinkler holes*/
#translate([0,0,40])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([2,0,35])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([-2,0,35])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([0,0,30])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([2,0,25])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([-2,0,25])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

#translate([0,0,20])
rotate([-90,0,0]) cylinder(r=rSprinklerHole, h=15, $fn=polyRes);

/* cylinder(r=10, h=10, center=true); */
/* translate([0,-30,-30]) cube([60,60,120]); */
}
}

sprinkler(end=true);
/* translate([50,0,0]) sprinkler(end=false); */
