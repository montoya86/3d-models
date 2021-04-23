$fn = 50;

length = 150;
deepL = 96.33 + 1; //a + b = longitut total + gruixcanalillo per fora
deepR = 94.5 + 1;

errorTallL=22.68 + 2;// + 2; //a + b + c = error + gruix + canalillo
errorTallR=21.06 + 2;// + 2;

triangle=1.5;


laPeca();

module laPeca(){
    difference(){
        blocAmbSuportsIEncaixos();
        encaixCicularFemella();
        triangleEntrePecesFemella();
        canalillo();
    }
}

module canalillo(){
    //CANALILLO 
    hull() {
        translate([0,deepR-5-1,0]) cube([0.01,5,2]);
        translate([length,deepL-5-1,0]) cube([0.01,5,2]);
    }
}

module blocAmbSuportsIEncaixos(){
    
    blocBuit();
    encaixCicularMascle();
    translate ([0,10,0]) suportFinestra();
    triangleEntrePecesMascle();

}

module triangleEntrePecesFemella(){
     if (triangle < 0)
        hull() {
            translate([length,deepL-5.5,0]) cube([0.01,5.5,errorTallL-3]);
            translate([length+triangle,deepL-5.5,0]) cube([0.01,5.5,0.01]);
        }
}
module triangleEntrePecesMascle(){
    if (triangle > 0){
        difference() {
            hull() {
                translate([length,deepL-7,0]) cube([0.01,7,errorTallL-3]);
                translate([length+triangle,deepL-7,0]) cube([0.01,7,0.01]);
            }
            hull() {
                translate([length,deepL-6,0]) cube([0.01,5,2]);
                translate([length+triangle,deepL-6,0]) cube([0.01,5,2]);
            }
        }
    }
}

module encaixCicularFemella(){
    translate([0,0,errorTallR-1]) rotate([-90,0,0]) cylinder(h=deepR+1, d=2, center=false);
}

module encaixCicularMascle(){
    translate([length,deepL,errorTallL-1]) rotate([90,0,0]) cylinder(h=deepL, d=1.7, center=false);
}

module suportFinestra(){
    hull() {
        translate([0,0,errorTallR-10]) cube([0.01,2,10]);
        translate([length,0,errorTallL-10]) cube([0.01,2,10]);
    }
}

module blocBuit(){
    difference(){
        bloc();
        hull() {
            cube([0.01,deepR-7,errorTallR-2]);
            translate([length,0,0]) cube([0.01,deepL-7,errorTallL-2]);
        }
    }
}


module bloc(){
    hull() {
        cube([0.01,deepR,errorTallR]);
        translate([length,0,0]) cube([0.01,deepL,errorTallL]);
    }
}