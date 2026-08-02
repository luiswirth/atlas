// The notation and the layout both come from dottyp; this file only selects them.
// Every note is standalone, so each file applies the style itself.

#import "@local/dottyp:0.1.0": *

#let note(body) = {
  show: document-style
  show: notes-style
  body
}
