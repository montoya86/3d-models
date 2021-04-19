$fn = 50;

length = 150;
deepL = 95;
deepR = 80;

errorTallL=20;
errorTallR=10;

color("BLUE") frame();

color("RED") translate([length,deepL,errorTallL-1.5]) rotate([90,0,0]) cylinder(h=deepL, d=3, center=false);

module frame(){
    difference(){
        hull() {
            cube([0.01,deepR,errorTallR]);
            translate([length,0,0]) cube([0.01,deepL,errorTallL]);
        }
        
        hull() {
            cube([0.01,deepR-5,errorTallR-3]);
            translate([length,0,0]) cube([0.01,deepL-5,errorTallL-3]);
        }
    }
}