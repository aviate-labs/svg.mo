import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example line01 - lines expressed in user coordinates.");

canvas.group(["stroke=\"green\""]);
    canvas.line(100, 300, 300, 100, ["stroke-width=\"5\""]);
    canvas.line(300, 300, 500, 100, ["stroke-width=\"10\""]);
    canvas.line(500, 300, 700, 100, ["stroke-width=\"15\""]);
    canvas.line(700, 300, 900, 100, ["stroke-width=\"20\""]);
    canvas.line(900, 300, 1100, 100, ["stroke-width=\"25\""]);
canvas.groupEnd();

Debug.print(canvas.end());
