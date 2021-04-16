$fn=50;


translate([0,0,-3.5]) cylinder(d=2.8,h=5, center=true);
difference(){
    knob();
    translate([0,0,1]) hole2();
    translate([0,0,-3]) hole();
}

module knob(){
    color("RED") cylinder(d=25,h=5, center=true);
    translate([0,0,-9]) scale([0.4,1,1]) cylinder(d=25,h=18, center=true);
}

module hole(){
    intersection() {
        cube([6.1,8.1,5], center=true);
        cylinder(d=8.1,h=5, center=true);
    }
}

module hole2(){
    cube([16,16,3.5], center=true);
    difference(){
        cylinder(d=23,h=3.5, center=true);
        translate([8,-8,0]) cube(10, center=true);
        translate([-8,8,0]) cube(10, center=true);
    }
}