import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 1000;
let height : Int = 300;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example tspan01 - using tspan to change visual attributes.");

canvas.group(["font-family=\"Verdana\"", "font-size=\"45\""]);
canvas.text(200, 150, "You are <tspan font-weight=\"bold\" fill=\"red\">not</tspan> a banana.", ["fill=\"blue\""]);
canvas.groupEnd();

Debug.print(canvas.end());
