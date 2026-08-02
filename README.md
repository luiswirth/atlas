# atlas

A personal encyclopedia of the mathematics and physics I have understood.
Each note records the framing that made a thing click and its connections to what I already know,
so it is written for me and not for a reader who needs the standard account.

Notes live in `src/`, one file per concept, grouped by area.
`src/bridges/` holds the notes whose subject is a dictionary between two areas.

Build a single document over everything:

```bash
typst compile main.typ
```

Every note also compiles on its own:

```bash
typst compile --root . src/probability/stochastic-calculus.typ
```
