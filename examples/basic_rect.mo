import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example rect01 - rectangle with sharp corners.");

canvas.rect(
    400, 100, 400, 200,
    ["fill=\"yellow\"", "stroke=\"navy\"", "stroke-width=\"10\""],
);

Debug.print(canvas.end());
