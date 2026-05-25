$fn=100;    

cube([85, 8, 1.6], center = true);

difference() {
    
    rotate([0, 90, 0]) 
    
    hull() {
        translate([0, 0, 43.0]) sphere(d = 4);
        translate([0, 0, -50.5]) sphere(d = 4);
    }
    cube([75, 8, 10], center = true);
}
