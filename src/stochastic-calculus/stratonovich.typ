#import "/src/setup.typ": *
#show: note

= Itô against Stratonovich

Left endpoint against midpoint. The midpoint sees half of its own increment,
which is the correction:
$
  integral H compose dif B = integral H dif B + 1/2 [H, B]_t.
$
The left endpoint gives the martingale property, the midpoint gives the ordinary chain rule,
and no convention gives both. Generators, Girsanov, Feynman-Kac and the isometry all rest
on the martingale structure, so Itô is the computational convention. Stratonovich obeys the
chain rule, which makes the equation invariant under change of coordinates, so diffusions on
manifolds are defined with it.

By Wong-Zakai, white noise arising as the limit of a fast smooth process gives the
Stratonovich solution, so physical noise is Stratonovich and information arrival is Itô.
Working rule: write the model in Stratonovich, analyze in Itô.
