#import "/src/setup.typ": *
#show: note

= Integral Forms

A cochain is an integral form restricted to the mesh.
Everything that is lowest-order about FEEC is visible in what that stops being true of.

== The definition

Hiptmair's FEEC chapter introduces forms in an order that is worth copying.
Not the pointwise object first, but the measurable one.

An integral $ell$-form on an $n$-manifold $Sigma$ is a continuous and additive map
$
  omega: union.big_(k <= ell) S_k (Sigma) --> RR,
  quad
  omega(-Gamma) = -omega(Gamma) space forall Gamma in S_ell (Sigma),
  quad
  omega(gamma) = 0 space forall gamma in S_k (Sigma), k < ell,
$
where $S_k (Sigma)$ is the set of oriented compact piecewise-$C^1$ $k$-submanifolds of $Sigma$,
continuity is with respect to a deformation topology,
and additivity means the value on a disjoint union is the sum of the values.
Evaluation is written as a pairing, $inner(omega, Gamma) := omega(Gamma)$,
and the space is $I^ell (Sigma)$.

The motivation is physical and it is the right one.
The electric field is measured along a wire and the magnetic induction through a loop.
Neither admits a point value, so neither is a function,
and $I^0$ recovering the continuous functions is the statement that
integral forms generalize functions to fields for which point evaluation is meaningless.
Maxwell said as much in 1873:
quantities defined with reference to a line, and quantities defined with reference to an area.

A differential $ell$-form is the other object,
a field of alternating $ell$-linear maps on the tangent spaces,
and integration is the map from it into $I^ell$.
Localization, probing an integral form with shrinking parallelotopes at a point, is the map back.
The two are the same information seen from opposite ends,
and only the integral one survives when the density does not exist.

== Chains are forced, not chosen

The exterior derivative on $I^ell$ is defined, not derived,
$
  inner(dif omega, Gamma) = inner(omega, partial Gamma).
$
Stokes' theorem is then the statement that this agrees with the pointwise $dif$
under the identification of the previous section,
and $dif compose dif = 0$ is $partial compose partial = 0$ read through the pairing.

Now restrict an integral form to the finitely many oriented facets of a mesh.
What comes out is a map $F_ell (cal(M)) -> RR$, which is a cochain,
and Hiptmair says outright that a cochain is what a discrete integral form is sold as.

It is tempting to read that as a coincidence,
two subjects meeting by luck, since algebraic topology knows nothing of integration.
It is not.
The free abelian group on oriented submanifolds, modulo additivity under subdivision
and sign reversal under reorientation, is the group of chains:
those two relations are the definition of a chain, and they are exactly the two axioms above.
So an integral form does not merely restrict to a functional on chains,
it factors through them by construction.
The same holds one level up:
the definition of $dif$ by adjointness to $partial$ forces the discrete differential
to be the transpose of the incidence matrix, with no room for a choice.

Both sides of the dictionary are forced.
The de Rham theorem is a further and genuinely non-trivial statement on top of it,
namely that passing to the mesh loses no cohomology.

== Where the coincidence actually sits

One thing in the lowest-order picture is unforced, and it carries everything else:
there is exactly one degree of freedom per simplex.
Since $dim W^1 Lambda^k = \#{k"-faces"}$,
the index set of the degrees of freedom is the face set of the mesh,
and the finite element complex is the mesh's cochain complex, on the nose,
with the exterior derivative equal to the signed incidence matrix.

Nothing about integral forms predicts this.
It is a fact about the first-order Whitney space and about no other.
Calling the cochain complex of a mesh the discrete de Rham complex is,
read strictly, a pun that holds at $r = 1$.

== Higher order: the moments leave

For the trimmed spaces $P^-_r Lambda^k$ the degrees of freedom are weighted integrals,
$
  omega |-> integral_f "tr"_f omega and eta,
$
with $f$ ranging over the faces of dimension at least $k$
and $eta$ over a space attached to each.
This is not $omega(Gamma)$ for any submanifold $Gamma$.
It is $omega$ smeared against a weight, and no reparametrization turns it into an evaluation.
So higher-order degrees of freedom are not integral forms in the sense of the first section.

They are still currents, in de Rham's sense of the word,
which is the dual of the compactly supported smooth forms.
Integration over $f$ is the current $[f]$, and a weighted integral over $f$ is $eta and [f]$,
a perfectly ordinary member of the same space.

Hiptmair's notion is titled integral forms or currents and treats the two as synonyms.
At lowest order they are.
This is exactly where they come apart:
currents generalize to arbitrary order and integral forms do not.
Worth knowing which of the two words one is leaning on.

== Small simplices, and what they buy

There is a construction that keeps the geometric picture intact.
Rapetti and Bossavit build the degree-$r$ Whitney forms with degrees of freedom
that are honest integrals over honest submanifolds,
the small simplices, meaning the $k$-simplices of a homothetic subdivision of each cell.
Higher-order Whitney forms and small $k$-chains then sit in duality,
and the entire first picture survives verbatim to arbitrary order.

The price is stated plainly: one evaluates on submanifolds that are not facets of the mesh.
The index set grows past the face set, which is precisely the coincidence above going away.

_DISCLAIMER: The following is recalled from the literature and not verified in detail._
The full small-simplex family is generating but not linearly independent for $r >= 2$,
and selecting a unisolvent subset is the content of the Christiansen-Rapetti line of work
rather than something that falls out of the construction.

== What actually breaks

Higher-order cochains do not exist, and it is worth being precise about why.
The concept that fails is not the cochain.
It is that $dif$ stops being $partial^transp$.

#table(
  columns: (auto, auto, auto),
  align: (left, left, left),
  stroke: none,
  inset: (x: 0.8em, y: 0.5em),
  table.hline(),
  table.header([], [index set], [the differential]),
  table.hline(),
  [$r = 1$], [the face set], [the incidence matrix, entries $plus.minus 1$],
  [$r >= 2$], [$limits(plus.o)_f$ (local space on $f$)], [block-sparse over the face poset, rational entries],
  table.hline(),
)

Both are metric-free, both are exact, both are computed once on the reference cell.
Only the first is combinatorics.

Even with small-simplex degrees of freedom, where the index set is a set of simplices
of a subdivision, the exterior derivative on $P^-_r Lambda$ is not that subdivision's coboundary.
The dimensions do not match.
One gets the indexing, not the complex.

== Sources

R. Hiptmair, _Numerical Methods for Partial Differential Equations_, ETH Zürich ST'25,
Chapter 13, Notions 13.1.2.7 and 13.2.1.7, Definition 13.1.4.27.
F. Rapetti and A. Bossavit, _Whitney forms of higher degree_, SIAM J. Numer. Anal. 47 (2009).
S. H. Christiansen and F. Rapetti, _On high order finite element spaces of differential forms_,
Math. Comp. 85 (2016), arXiv:1306.4835.
D. N. Arnold, R. S. Falk and R. Winther, _Finite element exterior calculus_, Acta Numer. 15 (2006).
