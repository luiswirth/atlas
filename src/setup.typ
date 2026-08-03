// The one place the library is imported, and the one place this document says
// how it departs from it. Every note imports this file.

#import "@local/dottyp:0.1.0": *

#let title = "Atlas"
#let author = "Luis Wirth"

// The whole document is drawn in this one, light-theme or dark-theme.
#let colors = dark-theme

// And set in this one, serif-fonts or sans-fonts.
#let fonts = serif-fonts

// Applied per note rather than once at the top, since every note is standalone.
#let note(body) = {
  set document(title: title, author: author)
  show: document-style.with(colors: colors, fonts: fonts)
  show: notes-style
  show: thmrules
  body
}

// An area document. Every note sets the page so that it compiles alone, and a
// set page rule issued after content exists starts a new one, so a note begins
// a page whatever an area does. The area heading is therefore a title page
// rather than a stray line above the first note.
//
// It also shifts the notes one level down, which is what lets a note write its
// title as = regardless of what it is compiled inside.
#let area(name, body) = {
  show heading.where(level: 1): it => page(
    align(center + horizon, text(size: 25pt, weight: "bold", it.body)),
  )
  heading(level: 1, name)
  set heading(offset: 1)
  body
}
