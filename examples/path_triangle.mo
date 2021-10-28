import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 400;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example triangle01- simple example of a 'path'.");

canvas.path(
    "M 100 100 L 300 100 L 200 300 z",
    ["fill=\"red\"", "stroke=\"blue\"", "stroke-width=\"3\""],
);

Debug.print(canvas.end());
