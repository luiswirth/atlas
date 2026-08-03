#!/usr/bin/env sh
# dottyp is vendored at lib/dottyp, so every checkout resolves @local/dottyp
# the same way, this one and CI included.
#
# The argument names a document below src/, which is either a note or an area,
# and defaults to the whole atlas:
#
#   ./watch.sh
#   ./watch.sh probability
#   ./watch.sh probability/brownian-motion

set -e
export TYPST_PACKAGE_PATH="$PWD/lib/dottyp/pkg"
mkdir -p out

doc=${1:-atlas}
src="src/$doc.typ"
[ -f "$src" ] || src="src/$doc/index.typ"

typst watch "$src" "out/$(basename "$doc").pdf" --root "$PWD"
