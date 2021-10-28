import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example ellipse01 - examples of ellipses.");

canvas.ellipse(
    300, 200, 250, 100,
    ["fill=\"red\""],
);

canvas.ellipse(
    0, 0, 250, 100,
    ["transform=\"translate(900 200) rotate(-30)\"","fill=\"none\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

Debug.print(canvas.end());
