import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(100, 100, []);
canvas.image(10, 10, 200, 200, "https://raw.githubusercontent.com/aviate-labs/svg.mo/main/examples/image.svg", []);
// Base64 encoded images.
// Example: red dot.
canvas.image(90, 90, 5, 5, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==", []);
Debug.print(canvas.end());