import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 500;
let height : Int = 500;
let canvas = SVG.SVG();

canvas.start(width, height, []);
canvas.circle(width/2, height/2, 100, []);
canvas.text(width/2, height/2, "Hello, SVG", ["text-anchor:middle;font-size:30px;fill:white"]);
Debug.print(canvas.end());
