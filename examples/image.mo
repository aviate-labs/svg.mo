import SVG "../src/SVG";

import Debug "mo:base/Debug";

let canvas = SVG.SVG();
canvas.start(200, 200, []);
canvas.image(0, 0, 200, 200, "https://avatars.githubusercontent.com/u/88667310?s=200", []);
// Base64 encoded images.
// Example: red dot.
canvas.image(10, 10, 5, 5, "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==", []);
Debug.print(canvas.end());