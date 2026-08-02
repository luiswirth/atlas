# atlas

A personal encyclopedia of the mathematics and physics I have understood.
Each note records the framing that made a thing click and its connections to what I already know,
so it is written for me and not for a reader who needs the standard account.

Notes live in `src/`, one file per concept, grouped by area.
`src/bridges/` holds the notes whose subject is a dictionary between two areas.

The notation, the page style and the shape of this repo all come from
[dottyp](https://github.com/luiswirth/dottyp),
whose `notes` template this follows.
The library is vendored as a submodule at `lib/dottyp` and imported as `@local/dottyp`,
so a fresh clone builds without anything installed around it:

```bash
git clone --recurse-submodules git@github.com:luiswirth/atlas.git
```

`src/setup.typ` is the one file that imports it.
The submodule is pinned to a commit, so picking up a change to the library
is `git -C lib/dottyp pull` and a commit here.

Build a single document over everything into `out/`:

```bash
./build.sh
```

Every note also compiles on its own,
given the same package root the scripts export:

```bash
export TYPST_PACKAGE_PATH=$PWD/lib/dottyp/pkg
typst compile --root . src/probability/stochastic-calculus.typ
```
