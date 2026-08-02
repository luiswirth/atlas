// The one place the library is imported, and the one place this document says
// how it departs from it. Every note imports this file.

#import "@local/dottyp:0.1.0": *

#let title = "Atlas"
#let author = "Luis Wirth"

// The whole document is drawn in this one, light-theme or dark-theme.
#let colors = dark-theme

// Applied per note rather than once at the top, since every note is standalone.
#let note(body) = {
  set document(title: title, author: author)
  show: document-style.with(colors: colors)
  show: notes-style
  show: thmrules
  body
}
