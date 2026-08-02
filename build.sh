#!/usr/bin/env sh

mkdir -p out
typst compile src/main.typ out/atlas.pdf --root $(pwd)
