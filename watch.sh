#!/usr/bin/env sh

mkdir -p out
typst watch src/main.typ out/atlas.pdf --root $(pwd)
