import Float "mo:base/Float";
import Int "mo:base/Int";
import Nat8 "mo:base/Nat8";
import Text "mo:base/Text";

module {
    public type LinearGradientCoordinateSystem = {
        #objectBoundingBox : (x1 : Nat8, y1 : Nat8, x2 : Nat8, y2 : Nat8);
        #userSpaceOnUse    : (x1 : Int, y1 : Int, x2 : Int, y2 : Int);
    };

    // Linear gradient default: 0%, 0%, 100%, 0%.
    public let LinearGradientDefault : LinearGradientCoordinateSystem = #objectBoundingBox(0, 0, 100, 0);

    public type RadialGradientCoordinateSystem = {
        #objectBoundingBox : (cx : Nat8, cy : Nat8, r : Nat8, fx : Nat8, fy : Nat8);
        #userSpaceOnUse    : (cx : Int, cy : Int, r : Int, fx : Int, fy : Int);
    };

    // Radial gradient default: 50%, 50%, 50%, fx, fy
    public func RadialGradientDefault(fx : Nat8, fy : Nat8) : RadialGradientCoordinateSystem {
        #objectBoundingBox(50 : Nat8, 50 : Nat8, 50 : Nat8, fx, fy);
    };

    public type OffsetColor = {
        offset  : Nat8;
        color   : Text;
        opacity : Float;
    };

    private let emptyClose = "/>\n";

    public class SVG() {
        var svg : Text = "";

        // Begins the SVG document with the width w and height h.
        public func start(
            width  : Int,
            height : Int,
            as     : [Text],
        ) {
            svg #= "<?xml version=\"1.0\"?>\n";
            svg #= "<!-- Generated by Aviate Labs, SVG Motoko Package (https://github.com/aviate-labs/svg.mo) -->\n";
            svg #= "<svg width=\"" # Int.toText(width) # "\" height=\"" # Int.toText(height) # "\"";
            svg #= do {
                var a = "";
                for (v in as.vals()) {
                    a #= "\n     " # v;
                };
                a #= "\n     xmlns=\"http://www.w3.org/2000/svg\"";
                a #= "\n     xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n";
                a;
            };
        };

        // Begins the SVG document, with the specified width, height, and viewbox.
        public func startView(
            width  : Int,
            height : Int,
            minX   : Int,
            minY   : Int,
            vw     : Int,
            vh     : Int,
        ) {
            start(
                width,
                height,
                ["viewBox=\"" # Int.toText(minX) # " " # Int.toText(minY) # " " #
                                Int.toText(vw)   # " " # Int.toText(vh)   # "\""],
            );
        };

        // End the SVG document.
        public func end() : Text {
            svg # "</svg>";
        };

        // Defines the specified style (e.g. "text/css").
        public func style(scriptType : Text, data : [Text]) {
            svg #= embed("style", scriptType, data);
        };

        // Circle centered at (x, y) with radius r, with optional style.
        public func circle(x : Int, y : Int, r : Int, s : [Text]) {
            svg #= "<circle cx=\"" # Int.toText(x) # "\" cy=\"" # Int.toText(y) # "\" r=\"" # Int.toText(r) # "\"" # endStyle(s, emptyClose);
        };

        // Ellipse centered at (x, y) with radii w and h, with optional style.
        public func ellipse(x : Int, y : Int, w : Int, h : Int, s : [Text]) {
            svg #= "<ellipse cx=\"" # Int.toText(x) # "\" cy=\"" # Int.toText(y) # "\" rx=\"" # Int.toText(w) # "\" ry=\"" # Int.toText(h) # "\"" # endStyle(s, emptyClose);
        };

        public func title(t : Text) {
            svg #= "<title>" # t # "</title>\n";
        };

        public func desc(t : Text) {
            svg #= "<desc>" # t # "</desc>\n";
        };

        // Text places the specified text, t at x,y according to the style specified in s.
        public func text(x : Int, y : Int, t : Text, s : [Text]) {
            svg #= "<text " # Util.location(x, y) # "" # endStyle(s, ">");
            // TODO: escaping of t?
            svg #= t # "</text>\n";
        };

        // Defines a marker.
        public func marker(id : Text, x : Int, y : Int, w : Int, h : Int, s : [Text]) {
            svg #= "<marker id=\"" # id # "\" refX=\"" # Int.toText(x) # "\" refY=\"" # Int.toText(x) # "\"";
            svg #= " markerWidth=\"" # Int.toText(w) # "\" markerHeight=\"" # Int.toText(h) # "\"" # endStyle(s, ">\n");
        };

        // Ends a marker.
        public func markerEnd() {
            svg #= "</marker>";
        };

        // Draws an arbitrary path, the caller is responsible for structuring the path data.
        public func path(d : Text, s : [Text]) {
            svg #= "<path d=\"" # d # "\"" # endStyle(s, emptyClose);
        };

        // Draws a straight line between two points.
        public func line(x1 : Int, y1 : Int, x2 : Int, y2 : Int, s : [Text]) {
             svg #= "<line x1=\"" # Int.toText(x1) # "\" y1=\"" # Int.toText(y1) # "\" x2=\"" # Int.toText(x2) # "\" y2=\"" # Int.toText(y2) # "\"" # endStyle(s, emptyClose);
        };

        // Draws connected lines between coordinates.
        public func polyline(xs : [Int], ys : [Int], s : [Text]) {
            pp(xs, ys, "<polyline points=\"");
            svg #= "\"" # endStyle(s, emptyClose);
        };

        private func pp(xs : [Int], ys : [Int], tag : Text) {
            svg #= tag;
            if (xs.size() != ys.size()) {
                svg #= " ";
                return;
            };
            for (i in xs.keys()) {
                svg #= Util.coordinate(xs[i], ys[i]);
                if (i != xs.size()) {
                    svg #= " ";
                };
            };
        };

        // Draws connected polygon between coordinates.
        public func polygon(xs : [Int], ys : [Int], s : [Text]) {
            pp(xs, ys, "<polygon points=\"");
            svg #= "\"" # endStyle(s, emptyClose);
        };

        // Rect starting at (x, y) upper the left-hand corner, with size width w and height h, with optional style.
        public func rect(x : Int, y : Int, w : Int, h : Int, s : [Text]) {
            svg #= "<rect " # Util.dimension(x, y, w, h) # "" # endStyle(s, emptyClose);
        };

        // Rect centered at (x, y) with size w:h, with optional style.
        public func rectCenter(x : Int, y : Int, w : Int, h : Int, s : [Text]) {
            rect(x - (w/2), y - (h/2), w, h, s);
        };

        // Rect with rounded corners starting at (x, y) upper the left-hand corner, with size width w and height h, with optional style.
        public func rectRound(x : Int, y : Int, w : Int, h : Int, rx : Int, ry : Int, s : [Text]) {
            svg #= "<rect " # Util.dimension(x, y, w, h) # " rx=\"" # Int.toText(rx) # "\" ry=\"" # Int.toText(ry) # "\"" # endStyle(s, emptyClose);
        };

        // Def begins a defintion block.
        public func defs() {
            svg #= "<defs>" # "\n";
        };

        // Ends a defintion block.
        public func defsEnd() {
            svg #= "</defs>" # "\n";
        };

        // Begins a group.
        public func group(s : [Text]) {
            if (s.size() == 0) {
                svg #= "<g>\n";
                return;
            };
            svg #= "<g" # endStyle(s, ">\n");
        };

        // Begins a group, with the specified style.
        public func groupStyle(t : Text) {
            svg #= Util.group("style", t) # "\n";
        };

        // Begins a group, with the specified transform.
        public func groupTransform(t : Text) {
            svg #= Util.group("transform", t) # "\n";
        };

        // Ends a group.
        public func groupEnd() {
            svg #= "</g>\n";
        };

        // Defines an element with a specified type.
        // - (link): Link reference.
        // - (data): CDATA
        // - Just a closing element.
        private func embed(tag : Text, scriptType : Text, data : [Text]) : Text {
            var e = "<" # tag # " type=\"" # scriptType # "\"";
            if (data.size() == 1 and isLink(data[0])) {
                e #= " " # Util.href(data[0]) # "/>\n";
            } else if (0 < data.size()) {
                e #= ">\n<![CDATA[\n";
                for (v in data.vals()) {
                    e #= v # "\n";
                };
                e #= "]]>\n</" # tag # ">\n";
            } else {
                e #= "/>"
            };
            e;
        };

        public func image(x : Int, y : Int, w : Int, h : Int, link : Text, s : [Text]) {
            svg #= "<image " # Util.dimension(x, y, w, h) # " " # Util.href(link) # "" # endStyle(s, emptyClose);
        };

        // Constructs a linear color gradient identified by id, along the vector defined by (x1, y1), and (x2, y2).
        // Coordinates are expressed as percentages.
        public func linearGradient(id : Text, coordinates : LinearGradientCoordinateSystem, stopColors : [OffsetColor], s : [Text]) {
            switch (coordinates) {
                case (#objectBoundingBox(x1, y1, x2, y2)) {
                    svg #= "<linearGradient id=\"" # id # "\" x1=\"" # Nat8.toText(x1) # "%\" y1=\"" # Nat8.toText(y1) # "%\" x2=\"" # Nat8.toText(x2) # "%\" y2=\"" # Nat8.toText(y2) # "%\"" # endStyle(s, ">\n");
                };
                case (#userSpaceOnUse(x1, y1, x2, y2)) {
                    svg #= "<linearGradient id=\"" # id # "\" gradientUnits=\"userSpaceOnUse\" x1=\"" # Int.toText(x1) # "\" y1=\"" # Int.toText(y1) # "\" x2=\"" # Int.toText(x2) # "\" y2=\"" # Int.toText(y2) # "\"" # endStyle(s, ">\n");
                };
            };
            stopColor(stopColors);
            svg #= "</linearGradient>\n";
        };

        // Constructs a radial color gradient identified by id, centered at (cx,cy), with a radius of r.
        // (fx, fy) define the location of the focal point of the light source.
        // Coordinates are expressed as percentages.
        public func radialGradient(id : Text, coordinates : RadialGradientCoordinateSystem, stopColors : [OffsetColor], s : [Text]) {
            switch (coordinates) {
                case (#objectBoundingBox(cx, cy, r, fx, fy)) {
                    svg #= "<radialGradient id=\"" # id # "\" cx=\"" # Nat8.toText(cx) # "%\" cy=\"" # Nat8.toText(cy) # "%\" r=\"" # Nat8.toText(r) # "%\" fx=\"" # Nat8.toText(fx) # "%\" fy=\"" # Nat8.toText(fy) # "%\"" # endStyle(s, ">\n");
                };
                case (#userSpaceOnUse(cx, cy, r, fx, fy)) {
                    svg #= "<radialGradient id=\"" # id # "\" gradientUnits=\"userSpaceOnUse\" cx=\"" # Int.toText(cx) # "\" cy=\"" # Int.toText(cy) # "\" r=\"" # Int.toText(r) # "\" fx=\"" # Int.toText(fx) # "\" fy=\"" # Int.toText(fy) # "\"" # endStyle(s, ">\n");
                };
            };
            stopColor(stopColors);
            svg #= "</radialGradient>\n";
        };

        private func stopColor(stopColors : [OffsetColor]) {
            for (c in stopColors.vals()) {
                svg #= "<stop offset=\"" # Nat8.toText(c.offset) # "%\" stop-color=\"" # c.color # "\" stop-opacity=\"" # Float.toText(c.opacity) # "\"/>\n";
            };
        };

        // Checks whether l is a script reference.
        private func isLink(l : Text) : Bool {
            Text.startsWith(l, #text("http://")) or Text.startsWith(l, #char('#')) or
            Text.startsWith(l, #text("../")) or Text.startsWith(l, #text("./"));
        };

        // Generates end styles based on the given tag and styles.
        private func endStyle(ts : [Text], tag : Text) : Text {
            if (ts.size() == 0) return tag;
            var e = switch (ts.size()) {
                case (0) "";
                case (_) " ";
            };
            for (i in ts.keys()) {
                let t = ts[i];
                switch (indexEquals(t)) {
                    case (null) { e #= styleAttr(t); };
                    case (? i) {
                        if (0 < i) { e #= t;  }
                        else { e #= styleAttr(t); };
                    };
                };
                if (i != (ts.size()-1 : Nat)) e #= " ";
            };
            e # tag;
        };

        // Returns a style attribute string.
        private func styleAttr(s : Text) : Text {
            if (s.size() == 0) return s;
            "style=\"" # s # "\"";
        };

        // Return the position of the first equals sign in the given string.
        private func indexEquals(t : Text) : ?Nat {
            var i = 0;
            for (c in Text.toIter(t)) {
                if (c == '=') return ?i;
                i += 1;
            };
            null;
        };

        private module Util {
            // Returns a coordinate string.
            public func coordinate(x : Int, y : Int) : Text {
                Int.toText(x) # "," # Int.toText(y);
            };

            // Returns a dimension string.
            public func dimension(x : Int, y : Int, w : Int, h : Int) : Text {
                "x=\"" # Int.toText(x) # "\" y=\"" # Int.toText(y) # "\" width=\"" # Int.toText(w) # "\" height=\"" # Int.toText(h) # "\"";
            };

            // Returns a group element.
            public func group(tag : Text, v : Text) : Text {
                "<g " # tag # "=\"" # v # "\">";
            };

            // Returns the href name and attribute.
            public func href(l : Text) : Text {
                "xlink:href=\"" # l # "\"";
            };

            // Returns the x and y coordinate attributes.
            public func location(x : Int, y : Int) : Text {
                "x=\"" # Int.toText(x) # "\" y=\"" # Int.toText(y) # "\"";
            };
        };
    };

    /* Transform Example:
     *  canvas.groupTransform(SVG.Transforms.skewX(10));
     *  canvas.rect(0, 25, 150, 150, []);
     *  canvas.groupEnd();
     */
    public module Transforms {
        // Returns the rotate string for the transform.
        public func rotate(f : Float) : Text {
            "rotate(" # Float.toText(f) # ")";
        };

        // Returns the scale string for the transform.
        public func scale(f : Float) : Text {
            "scale(" # Float.toText(f) # ")";
        };

        // Returns the xy scale string for the transform.
        public func scaleXY(x : Float, y : Float) : Text {
            "scale(" # Float.toText(x) # "," # Float.toText(y) # ")";
        };

        // Returns the x skew string for the transform.
        public func skewX(f : Float) : Text {
            "skewX(" # Float.toText(f) # ")";
        };

        // Returns the y skew string for the transform.
        public func skewY(f : Float) : Text {
            "skewY(" # Float.toText(f) # ")";
        };

        // Returns the xy skew string for the transform.
        public func skewXY(x : Float, y : Float) : Text {
            skewX(x) # " " # skewY(y);
        };

        // Returns the translate string for the transform.
        public func translate(x : Float, y : Float) : Text {
            "translate(" # Float.toText(x) # "," # Float.toText(x) # ")";
        };

        // Returns the translate and rotate strings for the transform.
        public func translateRotate(x : Float, y : Float, r : Float) : Text {
            translate(x, y) # " " # rotate(r);
        };

        // Returns the rotate and translate strings for the transform.
        public func rotateTranslate(r : Float, x : Float, y : Float) : Text {
            rotate(r) # " " # translate(x, y);
        };
    };
};
