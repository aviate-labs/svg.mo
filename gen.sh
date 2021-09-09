#!/bin/sh

for i in test/*.mo ; do
    $(dfx cache show)/moc --package base $(dfx cache show)/base -r $i > test/$(basename $i .mo).svg
done
