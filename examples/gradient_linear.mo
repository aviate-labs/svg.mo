import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 800;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example lingrad01 - fill a rectangle using a linear gradient paint server.");

canvas.group([]);
    canvas.defs();
        canvas.linearGradient(
            "MyGradient",
            SVG.LinearGradientDefault,
            [
                {
                    offset  = 5;
                    color   = "#F60";
                    opacity = 1;
                },
                {
                    offset  = 95;
                    color   = "#FF6";
                    opacity = 1;
                },
            ],
            [],
        );
    canvas.defsEnd();

    canvas.rect(100, 100, 600, 200, [
        "fill=\"url(#MyGradient)\"",
        "stroke=\"black\"",
        "stroke-width=\"5\"",
    ]);
canvas.groupEnd();

Debug.print(canvas.end());
