// The one place the library is imported, and the one place this document says
// how it departs from it. Every note imports this file.

#import "@local/dottyp:0.1.0": *

// Applied per note rather than once at the top, since every note is standalone.
#let note = notes-document.with(
  title: "Atlas",
  author: "Luis Wirth",
  colors: dark-theme,
  fonts: serif-fonts,
)
