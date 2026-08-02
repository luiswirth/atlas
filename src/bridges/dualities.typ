#import "/src/setup.typ": *
#show: note

= Dualities

One functor, one extra structure, and every "co-" in the library.

== Four notions

Everything below is assembled from four things,
and keeping them apart is the entire discipline.

/ Functional: an element of $X^* = "Hom"(X, RR)$. Free: it needs a module and nothing else.
/ Duality pairing: the evaluation $inner(dot, dot): X^* times X -> RR$. Free. Two different spaces.
/ Inner product: a form $inner(dot, dot): X times X -> RR$, one space with itself. Extra structure, implied by nothing above.
/ Riesz map: the map $R_X: X -> X^*$ that an inner product induces, $v |-> inner(v, dot)$.

The first two always exist.
The last two exist only where something supplied an inner product,
which is a real cost, paid once and reused.

=== A vector is a map

The first two notions are less abstract than they look.
A linear map $f: RR -> V$ is fixed by where it sends $1$, since $f(t) = t f(1)$,
and every $v in V$ gives one back as $t |-> t v$.
So
$
  V tilde.eq "Hom"(RR, V),
$
canonically: no basis was chosen and none could have been.
A vector is a map from the scalars, in the way that $1 dot x = x$.
The dual is the maps in the other direction, $V^* = "Hom"(V, RR)$, by definition,
and evaluation is composition $RR -> V -> RR$, landing in $"Hom"(RR, RR) tilde.eq RR$.

This is what the shape convention of matrices records,
and it is a statement rather than a habit:

#table(
  columns: 3, align: (left, left, left), stroke: none, inset: (x: 0.9em, y: 0.45em),
  table.hline(),
  [$v in V$], [$RR -> V$], [$N times 1$, a column: a map into $V$],
  [$f in V^*$], [$V -> RR$], [$1 times N$, a row: a map out of $V$],
  table.hline(),
)

Matrix multiplication computes the pairing because it composes the two,
and dimension matching is type checking of that composition.
The convention holds up to rank two and fails in one place, which is the place that matters:
a bilinear form has two covariant slots where an endomorphism has one of each,
and at equal dimensions both are $N times N$,
so a square shape cannot say whether a matrix stays in a space or crosses to its dual.
The mass matrix is a square matrix that crosses.

=== One functor

$X |-> X^*$ is a single contravariant functor applied to whatever module is at hand.
The tangent space and the chain module are not two dualities;
they are one construction at two objects.
What differs is never the duality, only what the object carries:
$
  X tilde.eq X^(**) quad "always, for finite rank and free", quad quad
  X tilde.eq X^* quad "only with an inner product".
$

The double dual is canonical and free.
The single dual is not, and every crossing in this library is the act of buying it.
A pairing whose $X -> X^(**)$ is an isomorphism is called perfect;
free modules of finite rank have one over any ring, $ZZ$ included,
with no inner product anywhere.
So having a perfect pairing and having a Riesz map are different statements,
and the gap between them is where cochains live.

=== Transpose and adjoint

Let $A: X -> Y$ be linear.
There is always a map back on the duals, requiring no structure,
$
  A^*: Y^* -> X^*, quad quad (A^* f)(x) = f(A x).
$
Given a functional on $Y$, precompose with $A$ to get one on $X$.
That is all it is.
Nothing was chosen and it works over any ring.
This is the transpose, also called the dual map, and in geometry the pullback.
In coordinates it is the matrix transpose, which is where the name comes from,
but the matrix operation is the shadow and not the thing.

Now let $X$ and $Y$ both carry inner products.
One may then ask for a map $Y -> X$, the same direction as the transpose,
but between the original spaces instead of their duals.
Exactly one exists, and it is the transpose with a Riesz map at each end,
$
  A^H = R_X^(-1) compose A^* compose R_Y : Y -> X,
$
equivalently $inner(A^H y, x) = inner(y, A x)$.
This is the adjoint.

The transpose is free and always exists.
The adjoint is the transpose conjugated by Riesz maps,
so it exists only where both spaces have inner products, and it costs $R^(-1)$.

Every "co-" in FEEC is one of the two.
The coboundary and the exterior derivative are transposes.
The codifferential is an adjoint.
No amount of matrix algebra will tell them apart,
because in coordinates both are $D^transp$ up to the crossings,
and the crossings are invisible in the storage.

== The dualities of FEEC

Three, and only three: one functor at three different modules.
They differ in what the module carries, never in what the duality is.

=== Geometric: vectors and covectors

#table(
  columns: (auto, auto), align: (left, left), stroke: none, inset: (x: 0.7em, y: 0.4em),
  [spaces], [$V = T_p M$ and $V^* = T_p^* M$, at a point, with all tensor powers following functorially],
  [pairing], [evaluation of a covector on a vector; the interior product $iota_v$ is that pairing in one slot],
  [structure], [the metric $g$],
  [Riesz map], [the musicals: $flat = R_V$ and $sharp = R_V^(-1)$],
  [induced], [the inner product on $Lambda^k$ and on any tensor power, hence norms; $g$ against $g^(-1)$ as one datum read on two sides],
  [transpose], [the pullback: $phi^*$ on forms is the transpose of $phi_*$ on vectors, and $Lambda^k$ of a map is functorial, $Lambda^k (A B) = Lambda^k (A) Lambda^k (B)$. The interior product is the transpose of the wedge, $iota_v = (v and dot)^*$, which is why it is metric-free and an antiderivation],
  [adjoint], [the $g$-adjoint of an endomorphism, $A^H = g^(-1) A^* g$, and with it the meaning of self-adjoint and of symmetric],
  [also], [the reciprocal basis, which is the dual basis and agrees with the primal one only on $Lambda$],
)

A differential form is already an element of the dual side:
an alternating functional on tangent vectors.
That is why the exterior derivative costs nothing metric,
and it is the cleanest example of a "co-" that is not an adjoint.
Variance is per slot, and a tensor may mix the two,
which is what an endomorphism, a torsion or a trace is.

The Hodge star is built here, and it is worth seeing that it is not a Riesz map.
It is this duality's Riesz map followed by a second identification of a different kind,
the wedge pairing $Lambda^k times Lambda^(n-k) -> Lambda^n$,
which relates complementary grades rather than a space to its dual
and asks only for a volume element,
$
  star: quad Lambda^k --> (Lambda^k)^* --> Lambda^(n-k).
$
One factor from each, which is why the star needs a metric and an orientation,
and why a star compared across cells needs a coherent orientation
while one inside a single cell's own integral does not.

=== Topological: chains and cochains

#table(
  columns: (auto, auto), align: (left, left), stroke: none, inset: (x: 0.7em, y: 0.4em),
  [spaces], [$C_k$, the free module on the $k$-simplices, and $C^k = "Hom"(C_k, R)$ by definition],
  [pairing], [evaluation of a cochain on a chain, which is what integrating over a chain means],
  [structure], [none, and none is available],
  [Riesz map], [none],
  [transpose], [the coboundary is one: $D = partial^*$, which is its definition and not a theorem. One signed incidence read on both sides, and $partial partial = 0$ gives $D D = 0$ for free],
  [adjoint], [none, and this is structural rather than an omission: with no inner product there is nothing to conjugate the transpose by],
  [derived], [homology and cohomology, Betti numbers, periods against cycles],
  [coefficients], [any commutative ring; over $ZZ$ the pairing is perfect at chain level and the answers exact],
)

One caveat belongs here, since it is the only place the duality does not simply descend.
The pairing is perfect on $C_k$, but not on homology when there is torsion:
$"Hom"(dot, ZZ)$ is only left exact, and universal coefficients gives
$
  0 --> "Ext"(H_(k-1), ZZ) --> H^k --> "Hom"(H_k, ZZ) --> 0.
$
Over a field the $"Ext"$ term vanishes and cohomology is exactly the dual of homology.
Over $ZZ$ it need not, so a basis of integral cycles is Kronecker-dual to one of integral
cocycles only modulo torsion, that is, after passing to $QQ$.

There is no inner product here and none can be grown.
The mesh supplies incidence and nothing metric,
so there is no canonical bilinear form on $C^k$ to find.
A cochain space can only borrow one along an isomorphism to a space that has one,
which is what the mass matrix turns out to be.

=== Analytic: the $L^2$ duality

#table(
  columns: (auto, auto), align: (left, left), stroke: none, inset: (x: 0.7em, y: 0.4em),
  [spaces], [$L^2 Lambda^k (M)$ and its dual; discretely the subspace $cal(W)^k$ of Whitney forms and $(cal(W)^k)^*$],
  [pairing], [evaluation of a functional on a form],
  [structure], [$inner(omega, eta) = integral_M inner(omega, eta)_g "vol"$, built pointwise from the geometric duality and integrated],
  [Riesz map], [$R_(L^2)$; on the discrete subspace it is the mass matrix $M$ in the Whitney basis],
  [transpose], [precomposition with $dif$, which is not $partial$ here, see below; the transposes properly belonging to this duality are those of inclusions, the Galerkin restriction $i^*$ and the multigrid pair in which restriction is the transpose of prolongation, both free and needing no metric],
  [adjoint], [the codifferential $delta = dif^H$, discretely $delta_h = M^(-1) partial M$; the Hodge-Laplacian $dif delta + delta dif$ is self-adjoint here and nowhere else; the $L^2$ projection is the crossing back after a transpose],
  [objects], [load vectors, residuals, Galerkin matrices, preconditioners, the $L^2$ projection, all the norms],
)

This is the only one of the three in which a Hilbert space appears,
and therefore the only one whose "co-" is an adjoint rather than a transpose.

==== Why $dif^*$ is not the boundary operator

It is tempting to say that the transpose of $dif$ is $partial$, and it is wrong,
or at least it is a statement about the bridge rather than about this duality.
The two act on different spaces:
$partial$ maps $C_k -> C_(k-1)$, chains,
while $dif^*$ maps $(cal(W)^k)^* -> (cal(W)^(k-1))^*$, functionals on Whitney forms.

They share a matrix, and for a reason that names the identification being used.
Under Whitney the two derivatives are the same map, $dif compose W = W compose D$,
and transposing an equality of maps gives an equality of transposes,
so $dif^*$ is $D^* = partial$ transported along the bridge.
The transport is concrete: the basis dual to ${lambda_sigma}$ consists of the functionals
$omega |-> integral_sigma omega$, since $R compose W = id$,
so the dual basis vectors are the simplices read as integration functionals,
which is exactly $(cal(W)^k)^* tilde.eq C_k$.
Metric-free, and a second identification all the same.

The continuum settles the question.
In $L^2 Lambda^k$ there is no $partial$ anywhere:
$dif^*$ is precomposition and nothing else,
because the dual of an infinite-dimensional space of forms has no simplices to be indexed by.
A boundary operator appears discretely only because the discrete dual has that basis.
And in neither setting is $dif^*$ the codifferential:
$delta = R^(-1) dif^* R$, with the crossings that the transpose alone never has.
It is also the only one where the space is infinite-dimensional before discretization,
and the two subsections below are what that costs.

==== What completeness buys, and what it does not

Everything said so far was finite-dimensional linear algebra.
In $L^2 Lambda^k$ the same statements hold, but for a different reason and at a price.

$X tilde.eq X^(**)$ now needs reflexivity rather than finite rank,
and the Riesz map needs completeness:
that is the actual content of the representation theorem,
where in finite dimensions it was a change of basis.
A Hilbert space has both, so the picture survives intact.

What does not survive is that operators are defined everywhere.
The exterior derivative is unbounded: differentiating leaves $L^2$,
so $dif$ is defined only on
$
  cal(D)(dif) = { omega in L^2 Lambda^k : dif omega in L^2 Lambda^(k+1) } = H Lambda^k,
$
which is dense, and $dif$ is closed on it.
The adjoint of such an operator carries a domain of its own,
$cal(D)(dif^*) = { eta : omega |-> inner(dif omega, eta) "is bounded on" cal(D)(dif) }$,
and $delta$ is $dif^*$ there.
The domain is part of the operator, not a technicality attached to it,
and the next subsection is what lives in that domain.

A Hilbert complex is exactly this package:
a sequence of Hilbert spaces with closed, densely defined differentials composing to zero.
Well-posedness of the mixed formulation is then not automatic;
it needs the differentials to have closed range,
equivalently a Poincaré inequality, and that is what makes the harmonic space
finite-dimensional and the Hodge decomposition available.

The discrete complex has none of these concerns:
it is finite-dimensional, every operator is bounded, every domain is everything.
That is why the discrete side of the ladder looks so much simpler than the continuous one,
and it is also the trap.
The theory is not about either complex alone but about the pair,
and about bounds that hold uniformly as the mesh is refined.

==== The boundary term

Adjointness was stated above as if $dif$ and $delta$ simply were adjoint.
On a manifold with boundary they are not, and what stands between them is one integral.
Integration by parts, which is Stokes applied to $omega and star eta$, gives
$
  inner(dif omega, eta) = inner(omega, delta eta) + integral_(partial M) "tr" omega and "tr" star eta.
$
So $delta$ is the adjoint of $dif$ only on a domain where that term vanishes,
and there are two ways to make it vanish, which is why there are two complexes and not one.

/ Essential: require $"tr" omega = 0$, a constraint on the space itself. This is the relative complex, whose harmonic space is $cal(H)^k (K, partial K)$. Discretely it is a constraint on the degrees of freedom, the boundary simplices simply being absent.
/ Natural: require $"tr" star eta = 0$, a condition on the other side. Nothing constrains the space, and the condition appears by itself in the weak formulation. This is the absolute complex, with harmonic space $cal(H)^k (K)$.

The boundary condition is therefore not an input added to the problem afterwards.
It is the choice of domain from the previous subsection,
and the boundary term is what tells the two choices apart.
Note also where the metric sits in it:
the trace is metric-free, and only the $star$ carries geometry,
which is why the essential condition can be imposed combinatorially
while the natural one has to be argued analytically.

== The bridge

Cochains are used to represent discrete forms, and the map doing it is not a duality,
$
  W: C^k tilde.eq cal(W)^k,
$
Whitney interpolation, inverted by the de Rham map since $R compose W = id$.
It is an isomorphism between a cochain module and a space of forms,
so it relates the topological duality to the analytic one while being neither.

The pairing carrying it is integration, $(omega, c) |-> integral_c omega$,
and Stokes' theorem is exactly the statement that the two derivatives are transposes under it,
$
  integral_c dif omega = integral_(partial c) omega
  quad quad "is" quad quad dif^* = partial.
$
Read that way Stokes is not a computation but a definition being consistent,
and its discrete counterpart is $R compose dif = D compose R$,
the de Rham map intertwining the two.
Both are metric-free, as everything on this side is.
Transporting the $L^2$ inner product backwards along it gives
$
  M = W^* compose R_(cal(W)^k) compose W,
$
the precise sense in which cochains borrow an inner product rather than possess one.

This explains the standing confusion in one line:
a list of numbers may be a cochain, a chain, a discrete form or a functional on discrete
forms, and all four are stored identically.
The discrete codifferential shows every layer at once,
$
  delta_h = M^(-1) compose partial compose M,
$
with $partial$ from the topological duality, $M$ from the analytic one,
and the reading as a matrix on coefficient lists from the bridge.
Three identifications in one formula, which is why no single name for it was going to be honest.

=== The ladder

Write $V^k$ for the discrete forms and $V_k$ for the functionals on them,
the index recording the side.

#align(center, $
  mat(delim: #none, column-gap: #1.2em, row-gap: #0.9em,
    V^(k-1), arrow.r.long^dif, V^k, arrow.r.long^dif, V^(k+1);
    arrow.b M_(k-1), , arrow.b M_k, , arrow.b M_(k+1);
    V_(k-1), arrow.l.long_partial, V_k, arrow.l.long_partial, V_(k+1)
  )
$)

Horizontal arrows are transposes of each other: free, exact, sparse.
Vertical arrows are Riesz maps: the geometry, once per grade and nowhere else.
Reading paths:

- Down, then left is $partial M_k$, which returns a functional,
  with values $(partial M_k u)_j = inner(u, dif lambda_j)$.
  This is the object usually written $D^transp M_k$ and usually miscalled a weak codifferential.
  No adjoint was taken, which is why it stays sparse.
- Down, left, up is $delta_h$, the adjoint, which returns an element and costs a solve.

Two laws follow from the picture rather than from calculation.
Adjointness $inner(delta_h u, tau) = inner(u, dif tau)$
says the two routes down to a number agree.
And $delta_h delta_h = 0$ because in $(M^(-1) partial M)(M^(-1) partial M)$
the middle crossing cancels its own inverse, leaving $partial partial = 0$:
nilpotency descends from the topology and owes the metric nothing.

== The Galerkin duality

The weak formulation is the analytic duality from beginning to end,
and two questions are worth answering carefully:
how a PDE operator relates to its bilinear form,
and how continuous objects become matrices and vectors.

=== The PDE operator already maps into the dual

A bilinear form $a: V times V -> RR$ is the same datum as a linear map
$
  A: V --> V^*, quad quad (A u)(v) = a(u, v),
$
elements in, functionals out.
So a Galerkin operator is not an operator on the solution space.
It crosses, exactly as a Riesz map does,
and it is one precisely when $a$ is an inner product.

The surprise is that the differential operator was this map all along.
Read distributionally, $-Delta$ is a map $H^1_0 -> H^(-1)$,
and it is an isomorphism there, which is what Lax-Milgram says.
The weak form is not a weakened version of it:
it is the same map, written as the bilinear form it always was,
$a(u,v) = inner(dif u, dif v)$.

Where, then, does the familiar reading of $-Delta$
as an operator taking functions to functions come from?
From a Riesz crossing, and from one that has to be earned.
Between $V$ and $V^*$ sits the pivot space $H = L^2$,
identified with its own dual by its Riesz map,
$
  V subset.eq H tilde.eq H^* subset.eq V^*,
$
the Gelfand triple.
The strong operator is then $R_H^(-1) compose A$,
defined only on those $u$ for which $A u$ happens to land in $H$ rather than merely in $V^*$.
That condition is elliptic regularity, and it is a theorem rather than a definition.

The weak form is the primitive object and the strong form is the derived one,
obtained by a Riesz crossing that is available only under extra regularity.
The usual order of presentation is exactly backwards.

The same reading explains the mixed formulation.
The Hodge-Laplacian $Delta = dif delta + delta dif$ contains $delta$,
which is a crossing, so writing it strongly commits to inverting a Riesz map.
Introducing $sigma = delta u$ as a second unknown removes every $delta$ from the formulation,
leaving only $dif$, which is free.
That is the whole trick: the mixed system stays on the functional side of the ladder.

=== Discretization is conjugation by an inclusion

Let $i: V_h arrow.hook V$ be the inclusion of a finite-dimensional subspace.
Its transpose $i^*: V^* -> V_h^*$ restricts a functional to the subspace,
and Galerkin discretization is nothing but conjugation by the two,
$
  A_h = i^* compose A compose i : V_h -> V_h^*, quad quad f_h = i^* f in V_h^*.
$
Both $i$ and $i^*$ are free and metric-free.
Discretizing introduces no new geometry; it only restricts.
All the geometry was already inside $a$.

Choosing a basis ${lambda_j}$ of $V_h$ turns those maps into arrays,
and the entries are exactly what the first section said they would be.
An element is recorded by coefficients, a functional by its values on basis functions,
$
  A_(i j) = a(lambda_j, lambda_i), quad quad (f_h)_i = f(lambda_i).
$
Assembly computes those numbers and nothing else.
The row index is the test function and the column index the trial function,
which is the statement that elements go in and functionals come out, written in coordinates.
Taking $a$ to be the $L^2$ inner product gives $A_h = M$:
the mass matrix is the discretized Riesz map,
which is why it turns up both as a Galerkin matrix and as the crossing of the ladder.
Those are not two roles.

One consequence worth naming: since $a$ is an inner product in the coercive case,
$u_h$ is the $a$-orthogonal projection of $u$ onto $V_h$,
which is quasi-optimality, Céa's lemma, and a Riesz statement in the $a$-inner product.

=== The correspondence

#table(
  columns: (auto, auto),
  align: (left, left), stroke: none, inset: (x: 0.8em, y: 0.5em),
  table.hline(),
  table.header([continuous], [discrete]),
  table.hline(),
  [$V = H Lambda^k$, with its domain], [$V_h = cal(W)^k$, everywhere defined],
  [$a(u, v)$, a bilinear form], [$A_(i j) = a(lambda_j, lambda_i)$, a sparse matrix],
  [$f in V^*$, a functional], [$(f_h)_i = f(lambda_i)$, the load vector],
  [$A: V -> V^*$], [$A_h = i^* A i$],
  [the $L^2$ inner product], [the mass matrix $M$],
  [the Riesz map $R_V$], [$M$ again],
  [$delta = dif^H$], [$M^(-1) partial M$],
  [$u in V$], [a coefficient vector],
  [$-Delta$ strongly, needing regularity], [$M^(-1) A_h$, needing a solve],
  table.hline(),
)

The last row is the discrete shadow of the Gelfand triple:
what regularity buys in the continuum, a mass solve buys in the discrete setting,
and both are the same crossing.

=== What lives where

Everything else follows by asking which side an object is on.

#table(
  columns: (auto, auto, auto),
  align: (left, left, left), stroke: none, inset: (x: 0.8em, y: 0.5em),
  table.hline(),
  table.header([object], [lives in], [why]),
  table.hline(),
  [solution $u$], [$V$], [it is a discrete form],
  [load vector $f$], [$V^*$], [it is $v |-> integral f v$, a rule eating test functions],
  [residual $r = f - A u$], [$V^*$], [a difference of functionals],
  [Galerkin matrix $A$], [$V -> V^*$], [it is a bilinear form],
  [solving], [$V^* -> V$], [$A^(-1)$ is the crossing back],
  [preconditioner $P approx A^(-1)$], [$V^* -> V$], [it turns a residual into a correction],
  table.hline(),
)

Three consequences to keep while writing code.

A load vector is not a discrete form.
It is a functional stored as the same list of numbers.
Adding it to a solution type-checks in every language and means nothing.

A preconditioner is a crossing, not an operator.
That is why applying it and applying the operator go in opposite directions,
and why building one as an approximate inverse is the natural thing rather than a trick.

A Krylov method's $inner(r, z)$ is the duality pairing.
The residual is a functional and $z = P r$ is an element,
so pairing them needs no inner product at all.
What looks like an inner product inside a conjugate gradient implementation is evaluation,
free, and it is why the method never asks for a metric.

=== The four blocks

A pairing of two Whitney families in the grade-$k$ inner product is
$
  A = R^transp M_k C,
$
with $C$ the trial side and $R^transp$ the test side,
each either the shape functions themselves or, one grade below, their exterior derivative,
which on Whitney forms is the coboundary.
Those four choices are the four blocks a problem posed around grade $k$ is built from:
both undifferentiated is the mass, both differentiated is the stiffness,
one of each is the mixed block usually miscalled a weak codifferential.

All four map elements to functionals, all four are sparse,
and none is a codifferential, because no mass inverse occurs in any of them.
The mixed formulation exists to stay on that side of the crossing:
it carries $sigma$ as an unknown instead of computing $delta u$,
the same instinct as writing $A x = b$ rather than $x = A^(-1) b$.
