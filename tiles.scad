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
module base(size=100, height=10) {
    cube([size, size, height]);
}

tenon(50, 10, 20);