import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 800;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example radgrad01 - fill a rectangle by referencing a radial gradient paint server.");

canvas.group([]);
    canvas.defs();
        canvas.radialGradient(
            "MyGradient",
            #userSpaceOnUse(400, 200, 300, 400, 200),
            [
                {
                    offset  = 0;
                    color   = "red";
                    opacity = 1;
                },
                {
                    offset  = 50;
                    color   = "blue";
                    opacity = 1;
                },
                {
                    offset  = 100;
                    color   = "red";
                    opacity = 1;
                },
            ],
        );
    canvas.defsEnd();

     canvas.rect(100, 100, 600, 200, [
        "fill=\"url(#MyGradient)\"",
        "stroke=\"black\"",
        "stroke-width=\"5\"",
    ]);
canvas.groupEnd();

Debug.print(canvas.end());
