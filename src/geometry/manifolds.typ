#import "/setup.typ": *
#show: note

= Manifolds

A topological manifold is a topological space that is Hausdorff, second-countable
and locally Euclidean of dimension $d$.

Locally Euclidean means that the space is locally homeomorphic to $RR^d$:
for all $x in X$ there is an open neighborhood $U in T$
for which there is a homeomorphism $h: U -> U'$ with $U' subset.eq RR^d$ open.
$h$ is called a chart. It is continuous.

== Atlas and smooth structure

A collection of charts that covers the whole manifold is called an atlas
$cal(A) = (U_i, h_i)_(i in I)$ with $union.big_(i in I) U_i = M$.

The transition map is a map between the intersection of the images of two charts.
It is the composition of the target chart after the inverse of the source chart.
So if we have two charts $h: U -> U'$ and $k: V -> V'$,
then the transition map is $omega: U' -> V'$, $omega = k compose h^(-1)$.
It is a map on subsets of $RR^d$ and therefore has a notion of differentiability.
It is a diffeomorphism if both the function and its inverse are $C^k$.

Two charts $h, k$ are $C^k$-compatible if the transition map is a $C^k$-diffeomorphism.
A $C^k$-atlas is an atlas for which any two charts are $C^k$-compatible.
A maximal $C^k$-atlas is the biggest such atlas,
and a $C^k$-smooth manifold is a topological manifold with a maximal $C^k$-atlas.
We call a maximal $C^oo$-atlas a smooth structure.

So a topology suffices for the notion of continuity,
but charts are needed for differentiability.

A discrete topological space with countably many points is a 0-dimensional manifold.
A subset of $RR^n$ is an $n$-dimensional manifold.
$S^2$ is a 2-dimensional manifold.
A graph $G_f = { (x, f(x)) | x in D }$ of a function is a smooth 1-manifold
with a chart $h: G_f -> RR$, $(x, f(x)) |-> x$.
This can be extended to a smooth structure.

== Submanifolds

A submanifold is a subset of a manifold.
We can use the charts of the parent manifold by restricting them.
Let $M$ be an $n$-manifold and $M_0 subset.eq M$ a $k$-submanifold of $M$.
This is the case if for all $p in M_0$ there is a chart $(U, h)$ of $M$
with $h[M_0 inter U] = (RR^k times 0^(n-k)) inter U'$.
Then $(U, h)$ is a submanifold chart for $M_0$,
so it is even defined outside the submanifold; there is something around it.

A submanifold is itself a manifold and we can forget about the surrounding parent manifold.
We get new charts by taking a submanifold chart, restricting to $tilde(U) := U inter M_0$,
and for $tilde(h)$ leaving out the zeros of $h$.

Not necessarily every subset is a submanifold.

== Smooth maps

We can define smooth maps between two manifolds using the smooth structure.
We compose a map between manifolds with the two chart maps, one inverse and one not,
and check the resulting map between subsets of Euclidean space.
A map $f: M -> N$ is called $k$-times differentiable at $p in M$
if for two charts $(U, h), (W, k)$ with $p in U$ and $f(p) in W$
the map $k compose f compose h^(-1)$ is $k$-times differentiable at $h(p)$
in the real analysis sense. We write $f in C^k (M, N)$.

An example of a smooth map is the canonical inclusion map $i: S^2 -> RR^3$, $i = op("id")$.
The canonical projection from $S^2$ to the projective space $P^2 (RR) = S^2 slash tilde$
is a smooth map.

=== Regular value theorem

Also called the preimage theorem or submersion theorem.
Let $M, N$ be smooth manifolds with dimensions $m, n$ and $m >= n$,
let $f: M -> N$ be a smooth map and $q in N$ a regular value of $f$.
This means that $f^(-1)[{q}]$ does not contain critical points.
A point $p in M$ is called a critical point of $f$
if the total derivative $dif (k compose f compose h^(-1))(h(p))$
is not surjective, meaning it has rank less than $n$.
Then $f^(-1)[{q}]$ is an $(m-n)$-submanifold of $M$.

For example $op("GL")(d, RR) = {A in RR^(d times d) | det(A) != 0}$ is a $d^2$-manifold,
and $op("sym")(d times d, RR) := {B in RR^(d times d) | B^transp = B}$
is a $d(d+1) slash 2$-manifold.
That $O(d, RR) = { A in op("GL")(d, RR) | A^transp A = I }$
is a submanifold of $op("GL")(d, RR)$ can be shown using the regular value theorem.

== Tangent space

While charts $h: M -> RR^n$ are local maps from the manifold into $RR^n$,
a local parametrization $phi: RR^n -> M$ is the opposite.

The tangent space is a local linearization of the manifold.

When considering a submanifold of $RR^n$, the tangent space can be defined very easily,
$
  T_p^"sub" M := (dif phi)_(phi^(-1)(p)) [RR^k]
  = { (dif phi)_(phi^(-1)(p)) x | x in RR^k } subset.eq RR^n,
$
so it is the linear space you get by considering the image of the Jacobian
of the parametrization of the whole manifold.
This space is spanned by the columns of that Jacobian.

We can also just consider parametrized curves $gamma: RR -> M$.
For submanifolds we can use these curves to define the tangent space as
$
  T_p^"sub" M = { gamma'(0) | gamma: (-epsilon, +epsilon) -> M
  "differentiable with" gamma(0) = p }.
$
These are both equivalent extrinsic definitions.

We would prefer an intrinsic definition of the tangent space,
and the parametrized curves make one possible.
Consider the set of all parametrized curves on $M$,
$
  C_p (M) := { gamma: (-epsilon, +epsilon) -> M | gamma "differentiable with" gamma(0) = p },
$
and define the equivalence relation
$gamma tilde alpha <=> (h compose gamma)'(0) = (h compose alpha)'(0)$,
which does not depend on the chart $(U, h)$.
The quotient set $C_p (M) slash tilde$ is now the tangent space,
with the equivalence classes $[gamma]_tilde$ as tangent vectors.
This set forms a vector space of the same dimension as the manifold dimension of $M$.

One can also define the tangent space as the vector space generated
by all the directional derivative operators on $M$.
We consider functions $f in C^oo (M, RR)$ and define the directional derivative operator
$X_(p,gamma): C^oo (M, RR) -> RR$, $f |-> (f compose gamma)'(0)$.

We consider a coordinate basis for the tangent space by taking the standard basis of $RR^n$
and applying the inverse chart map to obtain $partial_j := h^(-1)(e_j)$.
It depends on the chart.
For a submanifold of $RR^n$ this coordinate basis is exactly the columns of the Jacobian
of the parametrization, where $partial_j = (partial phi) slash (partial x_j)$,
which also justifies the notation.

Given a map $f: M -> N$ between two manifolds, we can define the differential
$dif f_p: T_p M -> T_(f(p)) N$ of $f$ at some point $p in M$,
which is a linear map between the corresponding tangent spaces.
There is also just the differential $dif f: p |-> dif f_p$, which takes the point as an argument.
The differential is a generalization of the total derivative, the Jacobian.

== Bundles

The product manifold is always a manifold with dimension $dim M + dim N$.
The Möbius strip cannot be written as a product manifold.

A bundle of topological manifolds is a triple $(E, pi, M)$,
where the total space $E$ is a manifold, the base space $M$ is a manifold
and the projection $pi: E -> M$ is a surjective continuous map.
For $p in M$, the fibre at $p$ is $F_p = pi^(-1)[{p}]$.

This notion of a bundle includes the product manifold, which is called a trivial bundle:
$E = M times F$ with $pi: M times F -> M$, $(p, f) |-> p$.

The product space allows us to attach another space to each point of a base space,
but it must be the same space at each point.
The bundle allows us to attach a different space at each point of the base space.
These various attachments are called the fibres.
So the fibre space can vary for bundles but not for product manifolds.

The Möbius strip can be written as a bundle, but not as a product manifold:
$E$ is the Möbius strip, $M = S^1$ and $pi^(-1)[{p}] = [-1,+1]$.

Let $E ->^pi M$ be a bundle such that
$exists F forall p in M: pi^(-1)[{p}] tilde.equiv F$,
then we call it a fibre bundle with typical fibre $F$.
A fibre bundle can be seen as a space that is locally a product space,
but not necessarily globally.
The cylinder is a trivial fibre bundle, since it is a product.
The Möbius strip is not trivial, but locally trivial.

The $CC^1$-line bundle over $M$ is a fibre bundle with typical fibre $CC$.

A section is a map $sigma: M -> E$ of the bundle with $pi compose sigma = op("id")_M$,
so a section maps each point to some point of the corresponding fibre.
For a product bundle the section is $sigma: p |-> (p, s(p))$,
where $s: M -> F$ is any map.
Here there is no value in talking about the section, we can just consider the map $s$.
In fact in quantum mechanics the wave function is not a function $psi: RR^d -> CC$,
but a section of the $CC$-line bundle, which is not a product bundle.

Bundle morphisms are a map $M -> M'$ together with a map $E -> E'$
such that they commute with the projections $pi, pi'$.
A bundle isomorphism is a two-sided bundle morphism.
