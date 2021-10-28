import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example polyline01 - increasingly larger bars.");

canvas.polyline(
    [150, 150, 250, 250, 350, 350, 450, 450, 550, 550, 650, 650, 750, 750, 850, 850, 950, 950, 1050, 1050, 1150],
    [375, 325, 325, 375, 375, 250, 250, 375, 375, 175, 175, 375, 375, 100, 100, 375, 375,  25,   25,  375,  375],
    ["fill=\"none\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

Debug.print(canvas.end());
