import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(200, 200, []);
canvas.groupTransform(SVG.Transforms.skewX(10));
canvas.rect(0, 25, 150, 150, []);
canvas.groupEnd();
Debug.print(canvas.end());