// The notation comes from dottyp; this file only selects it and sets the page.

#import "@local/dottyp:0.1.0": *

#let note(body) = {
  set page(paper: "a4", margin: 2cm)
  set text(font: "New Computer Modern Sans", size: 10pt, lang: "en")
  set par(justify: true)
  show link: set text(fill: blue)
  body
}
