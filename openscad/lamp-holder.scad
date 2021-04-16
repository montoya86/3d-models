// Global resolution
$fs = 0.1;  // Don't generate smaller facets than 0.1 mm
$fa = 5;    // Don't generate larger angles than 5 degrees

ws_h = 7;
ms_h = 4;
ss_h = 4;
ts_h = 14;

ws_d = 18;
ms_d = 17;
ss_d = 14;
ts_d = 12;

ws_w = 2;
ms_w = 4;
ss_w = 2;
ts_w = 1;


wideSection();
translate([0,0,ws_h-0.1]){
    midSection();
    translate([0,0,ms_h-0.1]){
        smallSection();
        thinSection();
    }
}


module wideSection() {
    difference(){
        color("Blue") cylinder(h=ws_h,d=ws_d);
        color("Blue") cylinder(h=ws_h,d=ws_d-ws_w);
    }
}

module midSection() {
    difference(){
        color("Red") cylinder(h=ms_h,d=ms_d);
        color("Red") cylinder(h=ms_h,d=ms_d-ms_w);
    }
}


module smallSection() {
    difference(){
        color("Yellow") cylinder(h=ss_h,d=ss_d);
        color("Yellow") cylinder(h=ss_h,d=ss_d-ss_w);
    }
}

module thinSection() {
    difference(){
        color("Green") cylinder(h=ts_h,d=ts_d);
        color("Green") cylinder(h=ts_h,d=ts_d-ts_w);
    }
    difference(){
        screwSection();
        color("Green") cylinder(h=ts_h,d=ts_d-ts_w);
    }
    
}

module screwSection() {
    translate([9,6,8]){
            rotate([90, 0, 0]){
            difference(){
                color("Pink") cylinder(h=12,d=12);
                color("Pink") cylinder(h=12,d=6);
            }
            
        }
    }
}


    