# SVG Generation

This Motoko library generates SVGs (as defined by the [Scalable Vector Graphics 1.1 Specification](http://www.w3.org/TR/SVG11))

## Usage

```motoko
import SVG "mo:svg/SVG";

let width  : Int = 500;
let height : Int = 500;
let canvas = SVG.SVG();

canvas.start(width, height, []);
canvas.circle(width/2, height/2, 100, []);
canvas.text(width/2, height/2, "Hello, SVG", ["text-anchor:middle;font-size:30px;fill:white"]);
let svg = canvas.end();
```

## Supported SVG Elements and Functions

### Shapes, Lines, Text

- [x] circle
- [ ] ellipse
- [ ] polygon
- [x] polyline
- [ ] rect (including roundrects)
- [ ] line
- [x] text

### Paths

- [ ] general
- [ ] arc
- [ ] cubic and quadratic bezier paths

### Image and Gradients

- [x] image
- [ ] linearGradient
- [ ] radialGradient

### Transforms

- [x] translate
- [x] rotate
- [x] scale
- [ ] skewX
- [ ] skewY

### Animation

- [ ] ...

### Filter Effects

- [ ] ...

### Metadata Elements

- [ ] desc
- [x] defs
- [ ] g (style, transform, id)
- [x] marker
- [ ] mask, pattern, title, (a)ddress, link, script, use, ...
