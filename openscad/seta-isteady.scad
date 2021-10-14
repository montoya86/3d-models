
$fn=200;

difference(){
    foot();
    hole();
}
translate([0,0,3.65]) hat();

module hat(){
    cylinder(2.5,7.5,7.5);
}

module foot(){
    cylinder(3.75,3,3);
}

module hole(){
    intersection(){
        cylinder(3.1,2.1,2.1);
        translate([-1.5,-2.5,0]) cube([3.1,5,3.1]);
    }
}