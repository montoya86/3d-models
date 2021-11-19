include <roundedcube.scad>;


$fn = 50;

//PHONE VARIABLES
phoneSize = [100,50,5];
phoneScreenSize = [80,48,50];
phoneScreenPosition = [10,1];
unlockPhoneSize =[4,50];//r,h
unlockScreenButtonPosition = [95,25]; //x,y
lateralUnlockSize=[3,50];//r,h
lateralUnlockPosition=[30,49.5];

volumeButtonsPosition=[20,-1];//
volumeButtonsSize = 30;

//DASH VARIABLES

dashSize = [phoneSize[0]+10,phoneSize[1]+10,phoneSize[2]+5];
dashHull = [200,30];


fullPiece();



color("RED"){
    translate([2.5, -80,0]) scale(0.99)dashBackCover();
}


module fullPiece(){
    difference() {
        group(){
            dash();
            translate([0,0,0.1])backAppendixBackCover();            
        }

        translate([dashSize[0]/2 - phoneSize[0]/2,dashSize[1]/2 - phoneSize[1]/2,0]) phone();
    }

}

module dashBackCover(){
    hull(){
        cube([dashSize[0]-5,dashSize[1]-2.5,0.1]);
        translate([2.5,0,-5]) cube([dashSize[0]-10,dashSize[1]-5,0.1]);
    }
}

module backAppendixBackCover(){
    difference() {
        translate([0,0,-5]) cube([dashSize[0],dashSize[1],5]);
        translate([2.5,0,0]) dashBackCover();
    }
}

module dash() {
    //roundedcube(size=dashSize,center=false, radius=1);
    cube(size=dashSize,center=false);
}

module phone() {
            cube([phoneSize[0],phoneSize[1],phoneSize[2]]);
    
            color("RED"){
                translate([phoneScreenPosition[0],phoneScreenPosition[1],phoneSize[2]]) {
                    hull(){
                        cube([phoneScreenSize[0],phoneScreenSize[1],1]);
                        translate([0-dashHull[0]/2,0-dashHull[1]/2,phoneScreenSize[2]]) cube([phoneScreenSize[0]+dashHull[0],phoneScreenSize[1]+dashHull[1],1]);
                    }
                }
            }
        
            color("GREEN"){
                translate([unlockScreenButtonPosition[0],unlockScreenButtonPosition[1],phoneSize[2]]) cylinder(unlockPhoneSize[1],unlockPhoneSize[0], unlockPhoneSize[0]+100);
            }
            
            color("BLUE"){
                
                translate([lateralUnlockPosition[0],lateralUnlockPosition[1],lateralUnlockSize[0]/2]) rotate([0,90,90]) cylinder(lateralUnlockSize[1],lateralUnlockSize[0],lateralUnlockSize[0]+20,center=false);
            }
            
            color("ORANGE"){
                translate([volumeButtonsPosition[0],volumeButtonsPosition[1],0]) {
                    cube([volumeButtonsSize,3,phoneSize[2]]);
                    translate([0,-10,phoneSize[2]/4]) cube([volumeButtonsSize,13,phoneSize[2]/2]);
                }
            }
            
    
}

module rounded_square( width, radius_corner ) {
	translate( [ radius_corner, radius_corner, 0 ] )
		minkowski() {
			square( width - 2 * radius_corner );
			circle( radius_corner );
		}
}
