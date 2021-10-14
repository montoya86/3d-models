$fn = 50;

length = 69.35;
deepL = 74 + 7 + 1; //a + distanciafinselvidre + b = longitut total + gruixcanalillo per fora
deepR = 70 + 7 + 1;

errorTallL=1 + 2;// + 2; //a + b + c = error + gruix + canalillo
errorTallR=5.37 + 2;// + 2;

triangle=0;


laPeca();
//triangleEntrePecesFemella();


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
        translate([0,1,0]) cube([0.01,5,2]);
        translate([length,1,0]) cube([0.01,5,2]);
    }
}

module blocAmbSuportsIEncaixos(){
    
    blocBuit();
    encaixCicularMascle();
    //suportFinestra();
    triangleEntrePecesMascle();

}

module triangleEntrePecesFemella(){
     if (triangle < 0)
        hull() {
            cube([0.01,7,errorTallL-2]);
            translate([triangle*-1,0,0]) cube([0.01,7,0.01]);
           
        }
}
module triangleEntrePecesMascle(){
    if (triangle > 0){
        difference() {
            hull() {
                cube([0.01,7,errorTallL-2]);
                translate([-triangle,0,0]) cube([0.01,7,0.01]);
            }
            hull() {
                translate([0,1,0]) cube([0.01,5,2]);
                translate([-triangle,1,0]) cube([0.01,5,2]);
            }
        }
    }
}

module encaixCicularFemella(){
    translate([length,0,errorTallR-1]) rotate([-90,0,0]) cylinder(h=deepR+1, d=2, center=false);
}

module encaixCicularMascle(){
    translate([0,deepL,errorTallL-1]) rotate([90,0,0]) cylinder(h=deepL, d=1.7, center=false);
}

module suportFinestra(){
    translate([0,0,0])//TODO
    hull() {
        translate([0,0,errorTallL-10]) cube([0.01,2,10]);
        translate([length,0,errorTallR-10]) cube([0.01,2,10]);
    }
}

module blocBuit(){
    difference(){
        bloc();
        translate([0,7,0])
            hull() {
                cube([0.01,deepL-7,errorTallL-2]);
                translate([length,0,0]) cube([0.01,deepR-7,errorTallR-2]);
            }
    }
}


module bloc(){
    hull() {
        cube([0.01,deepL,errorTallL]);
        translate([length,0,0]) cube([0.01,deepR,errorTallR]);
    }
}