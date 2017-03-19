/* +-------------------------------------------+
 * | Tiles the medibot can travel on. |
 * +-------------------------------------------+
 */
 
 /*
  * Tenon will allow tiles to fit together. See https://en.wikipedia.org/wiki/Mortise_and_tenon
  */
module tenon(width, height, depth) {
    radius = height/2;
    hull() {
        translate([-width/2 + radius, 0, 0]) cylinder(h=depth, r=radius, center=true);
        translate([ width/2 - radius, 0, 0]) cylinder(h=depth, r=radius, center=true);
    }
}
 
 /*
  * Base provides an easily assembled part so tiles can fit together.
  */
module base(size, height, tenon_width, tenon_height, tenon_depth, tenon_tolerance=0.1) {
    difference() {
        union() {
            cube([size, size, height]);
            for (data = [
                [[3*size/4, 0, height/2],[0, 0, 0]],
                [[size, 3*size/4, height/2],[0, 0, 90]],
                [[1*size/4, size, height/2],[0, 0, 0]],
                [[0, 1*size/4, height/2],[0, 0, 90]]
            ]) {
                translate(data[0]) rotate(data[1]) rotate([90, 0, 0]) tenon(tenon_width, tenon_height, tenon_depth);
            }
        }
        union() {
            for (data = [
                [[1*size/4, 0, height/2],[0, 0, 0]],
                [[size, 1*size/4, height/2],[0, 0, 90]],
                [[3*size/4, size, height/2],[0, 0, 0]],
                [[0, 3*size/4, height/2],[0, 0, 90]]
            ]) {
                translate(data[0]) rotate(data[1]) rotate([90, 0, 0]) tenon(tenon_width, tenon_height, tenon_depth);
            }
        }
    }
}

base_size = 100;
base_height = 10;
tenon_width = base_size/4;
tenon_height = base_height - 4;
tenon_depth = 10;
base(size=base_size, height=base_height, tenon_width=tenon_width, tenon_height=tenon_height, tenon_depth=tenon_depth);