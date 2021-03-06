# SVG Generation

This Motoko library generates SVGs (as defined by the [Scalable Vector Graphics 1.1 Specification](http://www.w3.org/TR/SVG11))

## Usage

```motoko
import SVG "mo:svg/SVG";

let width  : Int = 1200;
let height : Int = 400;

let canvas = SVG.SVG();
canvas.start(width, height, []);

canvas.circle(
    600, 200, 100,
    ["fill=\"red\"", "stroke=\"blue\"", "stroke-width=\"10\""],
);

let svg = canvas.end();
```

![circle01](./examples/basic_circle.svg)

More examples can be found [here](./EXAMPLES.md).

## Supported SVG Elements and Functions

### Shapes, Lines, Text

- [x] circle
- [x] ellipse
- [x] polygon
- [x] polyline
- [x] rect (including roundrects)
- [x] line
- [x] text

### Paths

- [x] general
- [x] arc
- [x] cubic and quadratic bezier paths

### Image and Gradients

- [x] image
- [x] linearGradient
- [x] radialGradient
- [ ] pattern

### Transforms

- [x] translate
- [x] rotate
- [x] scale
- [x] skewX
- [x] skewY

### Animation

- [ ] ...

### Filter Effects

- [ ] ...

### Metadata Elements

- [x] desc
- [x] defs
- [x] g (style, transform, id)
- [x] marker
- [ ] ...
