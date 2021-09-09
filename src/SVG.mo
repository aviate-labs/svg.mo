import Float "mo:base/Float";
import Int "mo:base/Int";
import Text "mo:base/Text";

module {
    public func new(
        width  : Float,
        height : Float,
        as     : [Text],
    ) : SVG {
        SVG(width, height, as);
    };

    private let emptyClose = "/>\n";

    public class SVG(
        width  : Float,
        height : Float,
        as     : [Text],
    ) {
        var text : Text = "<?xml version=\"1.0\"?>\n<!-- Generated by svg.mo -->\n";
            text       #= "<svg width=\"" # Float.toText(width) # "\" height=\"" # Float.toText(height) # "\"";
        private func attrs(as : [Text]) : Text {
            var a = "";
            for (v in as.vals()) {
                a #= "\n     " # v;
            };
            a #= "\n     xmlns=\"http://www.w3.org/2000/svg\"";
            a #= "\n     xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n";
            a;
        };
            text       #= attrs(as);

        // Generates end styles based on the given tag and styles.
        private func endStyle(ts : [Text], tag : Text) : Text {
            if (ts.size() == 0) return tag;
            var e = "";
            for (t in ts.vals()) {
                switch (indexEquals(t)) {
                    case (null) { e #= style(t) # " "; };
                    case (? i) {
                        if (0 < i) { e #= t  # " "; }
                        else { e #= style(t) # " "; };
                    };
                };
            };
            e;
        };

        // Returns a style attribute string.
        private func style(s : Text) : Text {
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

        public func cicle(x : Int, y : Int, r : Int, s : [Text]) {
            text #= "<circle cx=\"" # Int.toText(x) # "\" cy=\"" # Int.toText(y) # "\" r=\"" # Int.toText(y) # "\"" # endStyle(s, emptyClose);
        };

        public func end() : Text {
            text # "</svg>";
        };
    };
};
