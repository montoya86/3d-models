include <roundedcube.scad>;


$fn = 50;

//PHONE VARIABLES
phoneSize = [153,75,8];
phoneScreenSize = [122,69,50];
phoneScreenPosition = [15,3];
unlockPhoneSize =[7,50];//r,h
unlockScreenButtonPosition = [137,30]; //x,y
lateralUnlockSize=[12,50];//r,h
lateralUnlockPosition=[45,74.5];

volumeButtonsPosition=[20,-1];//
volumeButtonsSize = 42;

usbSize=12.5;
usbPosition=[phoneSize[0],phoneSize[1]/2-usbSize/2];


//DASH VARIABLES

dashSize = [phoneSize[0]+10,phoneSize[1]+10,phoneSize[2]+5];
dashHull = [340,110];


//scale(1.005) fullPiece();



color("RED"){
   //translate([2.5, -100,0]) scale(0.995) dashBackCover();
}

scale(0.995) {
    dashBackCover();
    simucube2mount();
}


module simucube2mount() {
    
    
    beginX = 5+phoneSize[0]/2-60;
    beginY = -24;
    beginZ = -5;
    
    difference(){
        union(){
            //translate([beginX,30,-39]) cube([120,5,35]);    
            translate([beginX,beginY,beginZ]) cube([120,25,5]);
        }
    
        translate([beginX+5,beginY,beginZ]) cube([9,24,5]);
        translate([beginX+5+9+5,beginY,beginZ]) cube([81,24,5]);
        translate([beginX+5+120-20,beginY,beginZ]) cube([9,24,5]);
    }
    //
    
}


module fullPiece(){
    difference() {
        difference(){
            dash();
            //translate([0,0,0.1])backAppendixBackCover();       
            translate([2.5,0,0]) dashBackCover();     
        }

        translate([dashSize[0]/2 - phoneSize[0]/2,dashSize[1]/2 - phoneSize[1]/2,0]) phone();
    }

}

module dashBackCover(){
    difference(){
        hull(){
            cube([dashSize[0]-5,dashSize[1]-2.5,0.1]);
            translate([2.5,0,-5]) cube([dashSize[0]-10,dashSize[1]-5,0.1]);
        }
        
        color("RED"){
            holeSizeY = phoneSize[1]/2+25+5+5;
            translate([5,phoneSize[1]-holeSizeY+10,-2]) cube([25,holeSizeY,4]);
        }
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
    translate([0,0,-5]) roundedcube(size=[dashSize[0],dashSize[1],dashSize[2]+5]);
    //translate([0,0,-5]) cube(size=[dashSize[0],dashSize[1],dashSize[2]+5]);
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
                translate([unlockScreenButtonPosition[0]+unlockPhoneSize[0],unlockScreenButtonPosition[1]+unlockPhoneSize[0],phoneSize[2]]) 
                    scale([0.6,1,1])
                        cylinder(unlockPhoneSize[1],unlockPhoneSize[0], unlockPhoneSize[0]+150);
            }
            
            color("BLUE"){
                
                translate([lateralUnlockPosition[0]-lateralUnlockSize[0]/2,lateralUnlockPosition[1],phoneSize[2]/2]) 
                    rotate([0,90,90])
                        scale([0.3,1,1]) 
                            cylinder(lateralUnlockSize[1],lateralUnlockSize[0],lateralUnlockSize[0],center=false);
            }
            
            color("ORANGE"){
                translate([volumeButtonsPosition[0],volumeButtonsPosition[1],0]) {
                    cube([volumeButtonsSize,3,phoneSize[2]]);
                    translate([0,-10,phoneSize[2]/4]) cube([volumeButtonsSize,13,phoneSize[2]/2]);
                }
            }
            
            
            color("PINK"){
                translate([usbPosition[0]-0.1,usbPosition[1]+usbSize/2,phoneSize[2]/2]) {
                    //cube([30,usbSize,phoneSize[2]]);
                    rotate([90,0,90]) scale([1,0.4,1]) cylinder(30,usbSize,usbSize,center=false);
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
