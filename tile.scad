module tile() {
    difference() {
        translate([0, 0, 3/2])
            cylinder($fn=6, center=true, d=30, h=3);
        translate([0, 0, 2/2])
            linear_extrude(height = 2)
                import(str(tile, ".svg"), dpi=800, center=true);
        translate([0, 0, 2/2])
            cylinder($fn=6, center=true, d=28, h=2);
    }
}
tile();