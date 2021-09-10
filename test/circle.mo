import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(500, 500, []);
canvas.circle(250, 250, 100, []);
canvas.text(250, 250, "Hello, SVG", ["text-anchor:middle;font-size:30px;fill:white"]);
Debug.print(canvas.end());
