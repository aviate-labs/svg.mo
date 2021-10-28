import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 600;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example quad01 - quadratic Bézier commands in path data.");

canvas.path(
    "M200,300 Q400,50 600,300 T1000,300",
    ["fill=\"none\"", "stroke=\"red\"", "stroke-width=\"5\""],
);

canvas.group(["fill=\"black\""]);
    canvas.circle(200, 300, 10, []);
    canvas.circle(600, 300, 10, []);
    canvas.circle(1000, 300, 10, []);
canvas.groupEnd();

canvas.group(["fill=\"gray\""]);
    canvas.circle(400, 50, 10, []);
    canvas.circle(800, 550, 10, []);
canvas.groupEnd();

canvas.path(
    "M200,300 L400,50 L600,300 L800,550 L1000,300",
    ["fill=\"none\"", "stroke=\"gray\"", "stroke-width=\"2\""],
);

Debug.print(canvas.end());