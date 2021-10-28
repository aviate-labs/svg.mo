import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example rect02 - rounded rectangles.");

canvas.rectRound(
    100, 100, 400, 200, 50, 50,
    ["fill=\"green\""],
);

canvas.rectRound(
    0, 0, 400, 200, 50, 50,
    ["transform=\"translate(700 210) rotate(-30)\"", "fill=\"none\"", "stroke=\"purple\"", "stroke-width=\"30\""],
);

Debug.print(canvas.end());
