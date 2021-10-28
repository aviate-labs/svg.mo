#!/usr/bin/env sh

# Exports all examples to SVGs. All generated from Motoko code.
for i in examples/*.mo ; do
    $(dfx cache show)/moc --package base $(dfx cache show)/base -r $i > examples/$(basename $i .mo).svg
done
