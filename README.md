# atlas

A personal encyclopedia of the mathematics and physics I have understood.
Each note records the framing that made a thing click and its connections to what I already know,
so it is written for me and not for a reader who needs the standard account.

Notes live in `src/`, one file per concept, grouped by area.
`src/bridges/` holds the notes whose subject is a dictionary between two areas.

The notation, the page style and the shape of this repo all come from
[dottyp](https://github.com/luiswirth/dottyp),
whose `notes` template this follows.
The library is imported as `@local/dottyp` and found through `TYPST_PACKAGE_PATH`,
which must point at `dottyp/pkg` for any build here.
`src/setup.typ` is the one file that imports it.

Build a single document over everything into `out/`:

```bash
./build.sh
```

Every note also compiles on its own:

```bash
typst compile --root . src/probability/stochastic-calculus.typ
```
