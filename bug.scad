module bug() {
    translate([0, 0, 0.5])
        linear_extrude(height = 3)
            import(str(bug, ".svg"), dpi=800, center=true);
    cylinder($fn=6, center=true, d=27.5, h=1.5);
}

bug();