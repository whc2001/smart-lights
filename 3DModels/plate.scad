holeDia = 6.15;
baseThickness = 2;
wellDepth = baseThickness / 2;
servoStrutDia = 4.28;
servoStrutHeight = 22;
servoStrutHoleDia = 1.7;
servoStrutHoleHeight = 10;
bottomStrutOffset = 32.5;
inlineServoStrutSep = 10.21;
servoWidth = 20.4;
servoStrutsX = 5;
slotWidth = holeDia - 3.2;
$fn = 80;

module base(){
    difference(){
        cube([70.36, 85, baseThickness], center=true);
        cube([11,24.5, baseThickness+2],center=true);
        translate([-17.59, 0, 0]) cube([35.18, 24.5, baseThickness+2], center=true);
        translate([0,30.05,(baseThickness/2 - wellDepth)])cylinder(r=(holeDia+1)/2, h=wellDepth, center=true);
        translate([0,30.05,0])cylinder(r=(holeDia-1)/2, h=baseThickness, center=true);
        translate([-17.59,30.05,0])cube([35.18, slotWidth, baseThickness+2], center=true);
        translate([0,-30.05, (baseThickness/2 - wellDepth)])cylinder(r=(holeDia+1)/2, h=wellDepth, center=true);
        translate([0,-30.05,0])cylinder(r=(holeDia-1)/2, h=baseThickness, center=true);
        translate([-17.59,-30.05,0])cube([35.18, slotWidth, baseThickness+2], center=true);
    }
}

module servoStrut(){
    difference(){
        cylinder(d=servoStrutDia+4, h=servoStrutHeight);
        translate([0, 0, servoStrutHeight-servoStrutHoleHeight]) cylinder(d=servoStrutHoleDia, h=servoStrutHoleHeight);
    }
    
}

module servoStruts(){
    translate([servoWidth+servoStrutsX,-bottomStrutOffset,0])servoStrut();
    translate([servoWidth+servoStrutsX-inlineServoStrutSep,-bottomStrutOffset,0])servoStrut();
    translate([servoWidth+servoStrutsX,-bottomStrutOffset+43.68+servoStrutDia,0])servoStrut();   
    translate([servoWidth+servoStrutsX-inlineServoStrutSep,-bottomStrutOffset+43.68+servoStrutDia,0])servoStrut();  
}

module drawAll(){
    union(){
        base();
        servoStruts();
    }
}

drawAll();