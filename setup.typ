#let note(body) = {
  set page(paper: "a4", margin: 2cm)
  set text(font: "New Computer Modern Sans", size: 10pt, lang: "en")
  set par(justify: true)
  show link: set text(fill: blue)
  body
}

#let ip(a, b) = $chevron.l #a, #b chevron.r$
#let transp = math.tack.b

#let avec(a) = math.bold(a)
#let grad = avec(math.op("grad"))
#let curl = avec(math.op("curl"))
#let scurl = math.op("curl")
#let div = math.op("div")
