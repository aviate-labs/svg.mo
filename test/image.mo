import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(500, 500, []);
canvas.image(150, 150, 200, 200, "https://avatars.githubusercontent.com/u/88667310?s=200", []);
Debug.print(canvas.end());