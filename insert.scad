module insert() {
    if(insert) {
        translate([0, 0, 0.75])
            linear_extrude(height = 2.75)
                import(str(insert, ".svg"), dpi=800, center=true);
    }
    cylinder($fn=6, center=true, d=27.5, h=1.5);
}

insert();