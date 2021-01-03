horizontal_offset=3.6;
vertical_offset=3.1;

module hexagon(d, h) {
    rotate([0, 0, 30])
        cylinder($fn=6, d=d, h=h);
}

module honeycomb(words="") {
    difference() {
        hexagon(d=4, h=1);
        hexagon(d=3.3, h=1);
    }
    linear_extrude(height=1)
        text(words, font="Roboto:style=Bold", size=1.8, valign="center", halign="center");
}

projection() {
    honeycomb("s");
    translate([horizontal_offset, 0, 0]) {
        honeycomb("n");
    }
    translate([horizontal_offset * 2, 0, 0]) {
        honeycomb("u");
    }
    translate([horizontal_offset * 3, 0, 0]) {
        honeycomb("g");
    }
    translate([horizontal_offset * 4, 0, 0]) {
        honeycomb("g");
    }
    translate([horizontal_offset * 5, 0, 0]) {
        honeycomb("y");
    }
    translate([horizontal_offset/2 + horizontal_offset, -vertical_offset, 0]) {
        honeycomb("b");
    }
    translate([horizontal_offset/2 + horizontal_offset * 2, -vertical_offset, 0]) {
        honeycomb("u");
    }
    translate([horizontal_offset/2 + horizontal_offset * 3, -vertical_offset, 0]) {
        honeycomb("g");
    }
    translate([horizontal_offset/2 + horizontal_offset * 4, -vertical_offset, 0]) {
        honeycomb("s");
    }
}