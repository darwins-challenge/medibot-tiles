/* +-------------------------------------------+
 * | Tiles the medibot can travel on. |
 * +-------------------------------------------+
 */
 
 /*
  * Base provides an easily assembled part so tiles can fit together.
  */
module base(size=100, height=10) {
    cube([size, size, height]);
}

base();