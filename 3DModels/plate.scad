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

switchStrutsX = -17;
switchStrutsY = 26;
switchWidth = 9.5;
switchStrutsDia = 4.28;
switchStrutsHeight = 5;
switchStrutsHoleDia = 1.7;
switchStrutsHoleHeight = 5;

slotWidth = holeDia - 3;
$fn = 80;

module strut(outerDia, outerHeight, innerDia, innerHeight)
{
    difference()
    {
        cylinder(d = outerDia, h = outerHeight);
        translate([ 0, 0, outerHeight - innerHeight ]) cylinder(d = innerDia, h = innerHeight);
    }
}

module servoStruts()
{
    translate([ servoWidth + servoStrutsX, -bottomStrutOffset, 0 ])
        strut(servoStrutDia + 4, servoStrutHeight, servoStrutHoleDia, servoStrutHoleHeight);
    translate([ servoWidth + servoStrutsX - inlineServoStrutSep, -bottomStrutOffset, 0 ])
        strut(servoStrutDia + 4, servoStrutHeight, servoStrutHoleDia, servoStrutHoleHeight);
    translate([ servoWidth + servoStrutsX, -bottomStrutOffset + 43.68 + servoStrutDia, 0 ])
        strut(servoStrutDia + 4, servoStrutHeight, servoStrutHoleDia, servoStrutHoleHeight);
    translate([ servoWidth + servoStrutsX - inlineServoStrutSep, -bottomStrutOffset + 43.68 + servoStrutDia, 0 ])
        strut(servoStrutDia + 4, servoStrutHeight, servoStrutHoleDia, servoStrutHoleHeight);
}

module switchStruts()
{
    translate([ switchStrutsX, switchStrutsY, 0 ])
        strut(switchStrutsDia, switchStrutsHeight, switchStrutsHoleDia, switchStrutsHoleHeight);
    translate([ switchStrutsX + switchWidth, switchStrutsY, 0 ])
        strut(switchStrutsDia, switchStrutsHeight, switchStrutsHoleDia, switchStrutsHoleHeight);
}

module base()
{
    difference()
    {
        // Panel
        cube([ 70.36, 85, baseThickness ], center = true);

        // Switch slot
        cube([ 11, 24.5, baseThickness + 2 ], center = true);
        translate([ -17.59, 0, 0 ]) cube([ 35.18, 24.5, baseThickness + 2 ], center = true);

        // Upper hole and slot
        translate([ 0, 30.05, (baseThickness / 2 - wellDepth) ])
            cylinder(r = (holeDia + 1) / 2, h = wellDepth, center = true);
        translate([ 0, 30.05, 0 ]) cylinder(r = (holeDia - 1) / 2, h = baseThickness, center = true);
        translate([ -17.59, 30.05, 0 ]) cube([ 35.18, slotWidth, baseThickness + 2 ], center = true);

        // Lower hole and slot
        translate([ 0, -30.05, (baseThickness / 2 - wellDepth) ])
            cylinder(r = (holeDia + 1) / 2, h = wellDepth, center = true);
        translate([ 0, -30.05, 0 ]) cylinder(r = (holeDia - 1) / 2, h = baseThickness, center = true);
        translate([ -17.59, -30.05, 0 ]) cube([ 35.18, slotWidth, baseThickness + 2 ], center = true);
    }
}

module drawAll()
{
    union()
    {
        base();
        servoStruts();
        switchStruts();
    }
}

drawAll();
