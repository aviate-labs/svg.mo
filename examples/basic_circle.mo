import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example circle01 - circle filled with red and stroked with blue.");

canvas.circle(
    600, 200, 100,
    ["fill=\"red\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

Debug.print(canvas.end());
