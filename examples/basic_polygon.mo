import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example polygon01 - star and hexagon.");

canvas.polygon(
    [350, 379, 469, 397, 423, 350, 277, 303, 231, 321],
    [ 75, 161, 161, 215, 301, 250, 301, 215, 161, 161],
    ["fill=\"red\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

canvas.polygon(
    [850, 958, 958, 850, 742, 742],
    [ 75, 138, 263, 325, 263, 138],
    ["fill=\"lime\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

Debug.print(canvas.end());
