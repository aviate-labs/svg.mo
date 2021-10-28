#!/usr/bin/env sh

> EXAMPLES.md
echo "# Examples\n" >> EXAMPLES.md

# Exports all examples to SVGs. All generated from Motoko code.
for i in examples/*.mo ; do
    base=$(basename $i .mo)
    $(dfx cache show)/moc --package base $(dfx cache show)/base -r $i > examples/$base.svg

    echo "# $base\n\n![$base](./examples/$base.svg)\n" >> EXAMPLES.md
    echo "View the code [here](./$i)\n" >> EXAMPLES.md
done
