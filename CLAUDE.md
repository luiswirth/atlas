# atlas

A personal encyclopedia of the mathematics and physics I have understood.
Each note records the framing that made a thing click and its connections to what I already know,
so it is written for me and not for a reader who needs the standard account.
It has a second reader: an agent consults a note to find how I frame a subject
and what I already take for granted, so a note is also written to be arrived at cold.

## Structure

One file per concept under `src/<area>/<concept>.typ`, kebab-case, no dates and no numbers.
The area directories are one level deep and no deeper:
a deeper tree would force a home on the cross-cutting notes, which are the valuable ones.
`src/bridges/` exists for the notes whose subject is a correspondence between two areas,
so those are filed by what they connect rather than by whichever area they mention first.

Every note starts with the two lines

```typst
#import "/src/setup.typ": *
#show: note
```

followed by a single level-one heading carrying its title, and uses `==` and deeper inside.

Three documents nest, and each of them compiles alone.
A note is the leaf. `src/<area>/index.typ` lists the notes of its area and nothing else,
and `src/atlas.typ` lists the seven area indices and nothing else,
naming each area at the point of inclusion.
Both lists are exhaustive, so a new note is added to its area index and to no other place.
The heading offset comes from the enclosing document,
which is why a note writes its title as `=` regardless of what it is compiled inside.

`src/setup.typ` defines no notation.
It is the one file that imports dottyp, whose `notes` template this repo follows,
and a name missing from a note is added to the library rather than here.
Macros specific to one note stay in that note.

## Build

The notation, the page style and the shape of this repo all come from
[dottyp](https://github.com/luiswirth/dottyp).
The library is vendored as a submodule at `lib/dottyp` and imported as `@local/dottyp`,
so a fresh clone builds without anything installed around it:

```bash
git clone --recurse-submodules git@github.com:luiswirth/atlas.git
```

The submodule is pinned to a commit, so picking up a change to the library
is `git -C lib/dottyp pull` and a commit here.
The vendored copy is never edited: a change to the library is written in its own
checkout, and its `CLAUDE.md` carries the Typst conventions a note is written to.

`./build.sh` and `./watch.sh` take the name of a document below `src/`,
which is an area or a single note, and default to the whole atlas:

```bash
./build.sh
./build.sh probability
./watch.sh probability/stochastic-calculus
```

Compiling by hand needs only the package root the scripts export:

```bash
export TYPST_PACKAGE_PATH=$PWD/lib/dottyp/pkg
typst compile --root . src/probability/stochastic-calculus.typ
```

## Conventions

Typst, not LaTeX. Angle brackets are `chevron.l` / `chevron.r`; `angle.l` does not exist.

Prose is the default and the register is mathematical.
A note records the framing and the connections, not a textbook development of the subject,
and it points at other notes rather than restating them.
A derivation belongs in a note where the derivation is the explanation.

A note is drafted with Luis and never handed to him finished, the framing having to be his.

## Anti-goals

No completeness pressure. A note of three sentences is a finished note,
and an area with one file in it is fine. Nothing here has to cover its subject.

Not a diary. Notes are undated and revised forever.
Dated personal material belongs elsewhere.

Not course material. Anything bound to one lecture or one project stays with that project;
only what generalizes beyond it is harvested into a note here.
