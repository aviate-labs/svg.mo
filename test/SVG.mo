import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.new(500, 500, []);
canvas.cicle(250, 250, 100, []);
Debug.print(canvas.end());
