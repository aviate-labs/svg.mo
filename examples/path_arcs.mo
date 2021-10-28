import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1200;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example arcs01 - arc commands in path data.");

canvas.path(
    "M300,200 h-150 a150,150 0 1,0 150,-150 z",
    ["fill=\"red\"", "stroke=\"blue\"", "stroke-width=\"5\""],
);

canvas.path(
    "M275,175 v-150 a150,150 0 0,0 -150,150 z",
    ["fill=\"yellow\"", "stroke=\"blue\"", "stroke-width=\"5\""],
);

canvas.path(
    "M600,350 l 50,-25 a25,25 -30 0,1 50,-25 l 50,-25 a25,50 -30 0,1 50,-25 l 50,-25 a25,75 -30 0,1 50,-25 l 50,-25 a25,100 -30 0,1 50,-25 l 50,-25",
    ["fill=\"none\"", "stroke=\"red\"", "stroke-width=\"5\""],
);

Debug.print(canvas.end());