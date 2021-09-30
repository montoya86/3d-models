
$fn=200;

difference(){
    foot();
    hole();
}
translate([0,0,3.4]) hat();

module hat(){
    difference() {
        cylinder(5,7.5,7.5);
        translate([0,0,31]) sphere(30);
    }
}

module foot(){
    cylinder(3.5,3,3);
}

module hole(){
    intersection(){
        cylinder(3,2,2);
        translate([-1.5,-2.5,0]) cube([3,5,3]);
    }
}