$fn = 50;

sizeX = 93;
sizeY = 57;
errorCorrectLenght=18.5;
errorCorrectAngle=0;




difference(){
        body();
        color("RED") translate([0,sizeY/2,0]) rotate([90,0,90]) cylinder(h=sizeX, d=2, center=true);
        if(errorCorrectAngle < 0){
           color("PURPLE") 
        translate([-sizeX/2+5+1,-sizeY/2,errorCorrectLenght+1])
        rotate([180,90,0]) 
        triangle(errorCorrectAngle,errorCorrectLenght,6, false);
        }
    }


module body() {
    color("GREEN") cube([sizeX,sizeY,2], center =true);   
    color("RED") translate([0,-sizeY/2,0]) rotate([90,0,90]) cylinder(h=sizeX, d=1.5, center=true);
    color("BLUE") translate([-sizeX/2+1+5-0.1,0,(errorCorrectLenght+10)/2]) cube([2,sizeY/3,errorCorrectLenght+10], center = true);
    color("YELLOW") translate([sizeX/2-1-10,0,5]) cube([2,sizeY/3,10], center = true);
    if (errorCorrectLenght>0){
        color("PINK") translate([-sizeX/2+2.6,0,errorCorrectLenght/2+0.9]) cube([5,sizeY,errorCorrectLenght], center = true);
    }
    if (errorCorrectAngle>0){
       color("PURPLE") 
        translate([-sizeX/2+5,-sizeY/2+0.1,errorCorrectLenght+1])
        rotate([180,90,0]) 
        triangle(errorCorrectAngle,errorCorrectLenght,5, false);
        
    }
}


    
/**
 * Standard right-angled triangle
 *
 * @param number  o_len  Length of the opposite side
 * @param number  a_len  Length of the adjacent side
 * @param number  depth  How wide/deep the triangle is in the 3rd dimension
 * @param boolean center Whether to center the triangle on the origin
 * @todo a better way ?
 */
module triangle(o_len, a_len, depth, center=false)
{
    centroid = center ? [-a_len/3, -o_len/3, -depth/2] : [0, 0, 0];
    translate(centroid) linear_extrude(height=depth)
    {
        polygon(points=[[0,0],[a_len,0],[0,o_len]], paths=[[0,1,2]]);
    }
}