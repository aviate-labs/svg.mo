import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(500, 500, []);
canvas.title("Marker");

canvas.def();
canvas.marker("dot", 5, 5, 8, 8, []);
canvas.circle(5, 5, 3, ["fill:black"]);
canvas.markerEnd();
canvas.defEnd();

canvas.polyline(
    [100, 250, 100],
    [100, 250, 400],
    ["fill=\"none\"", "stroke=\"red\"", "marker-start=\"url(#dot)\""],
);

Debug.print(canvas.end());