#import "/setup.typ": *
#show: note

= Topology

Topology allows for defining limits and continuity.
The limits are however not necessarily unique.

Two topological spaces are homeomorphic if there exists a continuous bijection between the two.
This is the structure preserving mapping.

== Examples

Chaotic topology $T = (emptyset, M)$,
discrete topology $T = cal(P)(M)$,
metric-induced topology is the open ball topology,
and the standard topology is the open ball topology with the euclidean metric.

One can induce a subset topology $O_"restr" (N)$,
where all open sets are replaced by the intersection of themselves with the subset.
So all subsets of a topological space can also be made into a topological space.

== Separation and compactness

Hausdorff space: topological space that is separable,
in the sense that for any distinct points $p, q$
we can find their respective open neighborhoods that have an empty intersection.

On a Hausdorff space all limits will be unique.
Every metric space is a Hausdorff space.
In a Hausdorff space, every compact set is closed.

A cover is a collection of open sets that covers the whole space.
Compactness: every cover has a finite subcover.
Paracompactness: every cover has a refinement that is locally compact.

== Quotient spaces

A topological quotient space $(X slash tilde, hat(T))$ is a topological space on the quotient set.
We define the derived topology such that a set is open in the quotient topology
iff the preimage under the projection map of the set is open in the original set.
The canonical projection map projects a point of the original set
to the corresponding equivalence class.

The Möbius strip can be defined as a quotient space.
Take the set $X = [0,1] times (-1,+1)$ and the equivalence relation $(0,s) tilde (1,-s)$.
This will glue the left and right side together but turned around, giving us a Möbius strip.

$P^n (RR)$ is called the projective space
and is the set of all 1-dimensional subspaces of $RR^(n+1)$.
It can be constructed as a quotient space.
Consider the $n$-sphere $S^n := { x in RR^(n+1) | norm(x) = 1 }$.
Lines through the origin have two intersections with the sphere, at $x$ and $-x$.
This lets us define the equivalence relation $x tilde y <=> x = y or x = -y$,
which gives us $P^n (RR) = S^n slash tilde$. It is a Hausdorff space.

== Basis and countability

A collection $B$ of open subsets of a topology $T$ is called a basis,
if for all $U in T$ there is $(A_i)_(i in I)$ with $A_i in B$ and $union.big_(i in I) A_i = U$.
It generates the topology.

$T$ itself is always a basis.
For the discrete topology $T = cal(P)(X)$, $B = {{x} | x in X}$ is a basis.
For a metric space $(X, d)$, $B = {B_epsilon (x) | x in X, epsilon in RR^+}$ is a basis.

A second-countable space is a topological space for which there is a countable basis.
The standard topology of $RR^n$ has a countable basis
$B = {B_epsilon (x) | x in QQ^n, epsilon in QQ^+}$.

== Continuity

A function is continuous iff the preimage of every open set in the target topology
is an open set in the source topology.

A homeomorphism is an isomorphism on topological spaces.
It is a bijective continuous function with continuous inverse.

If the source topology is discrete then every function is continuous.
If the target topology is chaotic then every function is continuous.
For a quotient space the canonical projection onto the equivalence class is continuous.

There is a second notion of continuity called sequential continuity.
It is fulfilled if for every sequence converging to a point $x$,
the induced sequence of function values converges to $f(x)$.
Continuity is stronger than sequential continuity.
For metric spaces and second-countable spaces the two are equivalent.

== Partition of unity

A set $F$ of continuous functions $f in F subset.eq C^0 (X, [0,1])$ on a topological space $X$,
such that for every point $x in X$ there is an open neighborhood
on which only finitely many are non-zero and these all sum to the value one.

Partition of unity is necessary for defining integrals on manifolds,
where we have integrals on different charts that overlap.
The partition of unity then allows for weighting on this overlap.
A space with Hausdorff and paracompactness always possesses a partition of unity.

== Connectedness

Connectedness: if no two non-empty, non-intersecting sets exist such that $M = A union B$.
A topological space is connected iff the empty set and the whole set
are the only subsets that are both open and closed.

Path-connectedness: for every pair of points $p, q$
there exists a continuous curve $gamma: [0,1] -> M$ with $gamma(0) = p$ and $gamma(1) = q$.
Path-connectedness is stronger than connectedness.

== Homotopy and the fundamental group

Two curves $gamma, delta: [0,1] -> M$ are called homotopic if there exists a homotopy,
which is a continuous map $h: [0,1] times [0,1] -> M$ that interpolates between the two curves,
meaning $h(0, lambda) = gamma(lambda)$ and $h(1, lambda) = delta(lambda)$.
Homotopy is an equivalence relation.

The space of loops $cal(L)_p$ at $p$ is the set of curves that have the same start and end point.
They can be concatenated by going along the two loops with double speed.

The fundamental group $pi_(1,p)$ of a topological space is the quotient space
of the space of loops modulo the homotopy equivalence relation.
It is a group with the operation of concatenation of the representatives.
The identity is the constant loop, and the inverse is going the path in reverse.

Intuitively a loop around a hole cannot be homotopic to a loop not around the same hole,
because we cannot continuously deform them into each other.

Often topological spaces without holes have a fundamental group
that only consists of the constant loop.
But there are other instances of non-trivial fundamental groups without holes.
For instance an infinitely long cylinder $C = S^1 times RR$ can have loops around its perimeter
that cannot be deformed such that they are not around the perimeter.
In fact you can count the windings and notice that the fundamental group is isomorphic to $(ZZ, +)$.
Since for the torus there are two directions one can wind along,
there are two winding numbers that describe the fundamental group,
therefore it is isomorphic to $(ZZ^2, +)$.

Two topological spaces are homeomorphic iff all their topological invariants agree.
