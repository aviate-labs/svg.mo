import SVG "../src/SVG";

import Debug "mo:base/Debug";

let width  : Int = 500;
let height : Int = 400;
let canvas = SVG.SVG();

canvas.startView(width, height, 0, 0, width, height);
canvas.desc("Example cubic01- cubic Bézier commands in path data.");

canvas.style(
    "text/css",
    [
        ".border { fill:none; stroke:blue; stroke-width:1 }",
        ".connect { fill:none; stroke:#888888; stroke-width:2 }",
        ".sample-path { fill:none; stroke:red; stroke-width:5 }",
        ".end-point { fill:none; stroke:#888888; stroke-width:2 }",
        ".ctl-point { fill:#888888; stroke:none }",
        ".auto-ctl-point { fill:none; stroke:blue; stroke-width:4 }",
        ".label { font-size:22; font-family:Verdana }",
    ],
);

let pts = [
    ([100, 100], [200, 100]),
    ([250, 250], [100, 200]),
    ([250, 250], [200, 300]),
    ([400, 400], [300, 200]),
];

for ((xs, ys) in pts.vals()) {
    canvas.polyline(xs, ys, ["class=\"connect\""]);
};

canvas.path(
    "M100,200 C100,100 250,100 250,200 S400,300 400,200",
    ["class=\"sample-path\""],
);

for ((xs, ys) in pts.vals()) {
    for (i in xs.keys()) {
        let x = xs[i];
        let y = ys[i];
        let c = switch (y) {
            case (200) { "end-point"; };
            case (300) {
                switch (x) {
                    case (250) { "auto-ctl-point"; };
                    case (_)   { "ctr-point"; };
                };
            };
            case (_) { "ctr-point"; };
        };
        canvas.circle(
            x, y, 5,
            ["class=\"" # c # "\""],
        );
    };
};

canvas.text(
    25, 70, "M100,200 C100,100 250,100 250,200",
    ["class=\"label\""],
);

canvas.text(
    325, 350, "S400,300 400,200",
    ["class=\"label\"", "style=\"text-anchor:middle\""],
);

Debug.print(canvas.end());