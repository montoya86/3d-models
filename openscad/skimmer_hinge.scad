
$fn=100;    
cube([85,8,1.5], center = true);


difference() {
rotate([0,90,0]) translate ([0,0,-4]) cylinder(100, d=4, center = true);
cube([75,8,10], center = true);
}

module rounded_cylinder(r,h,n) {
  rotate_extrude(convexity=1) {
    offset(r=n) offset(delta=-n) square([r,h]);
    square([n,h]);
  }
}