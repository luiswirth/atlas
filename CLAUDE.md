# atlas

See the README for what this is and how to build it.
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
#import "/setup.typ": *
#show: note
```

followed by a single level-one heading carrying its title, and uses `==` and deeper inside.
It therefore compiles alone and is also included by `main.typ`, which must list every note.

`setup.typ` defines no notation.
It selects dottyp, which is where the notation and the page style both come from,
and a name missing from a note is added there rather than here.
Macros specific to one note stay in that note.

## Conventions

Typst, not LaTeX. Angle brackets are `chevron.l` / `chevron.r`; `angle.l` does not exist.

Prose is the default and the register is mathematical.
A note records the framing and the connections, not a textbook development of the subject,
and it points at other notes rather than restating them.

## Anti-goals

No completeness pressure. A note of three sentences is a finished note,
and an area with one file in it is fine. Nothing here has to cover its subject.

Not a diary. Notes are undated and revised forever.
Dated personal material belongs elsewhere.

Not course material. Anything bound to one lecture or one project stays with that project;
only what generalizes beyond it is harvested into a note here.
