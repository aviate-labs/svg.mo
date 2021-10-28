import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(120, 40, []);

Debug.print(canvas.end());