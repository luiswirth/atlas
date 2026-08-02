#import "/setup.typ": *
#show: note

= Hierarchy of Spaces

A space $X$ carries structure in a chain, each level induced by the one above it:
inner product, norm, metric, topology.
Each step forgets something, and each level can also be had on its own,
without anything above it inducing it.

== Inner product

$ip(x, y): X times X -> RR$, positive definite, symmetric and bilinear.

== Norm

$norm(x): X -> RR^+_0$, positive definite, absolutely homogeneous
and satisfying the triangle inequality.
Induced by an inner product through
$
  norm(x) = sqrt(ip(x, x)).
$

== Metric

$d(x, y): X times X -> RR^+_0$, positive definite, symmetric
and satisfying the triangle inequality.
Induced by a norm through
$
  d(x, y) = norm(x - y).
$

== Topology

$T subset.eq cal(P)(X)$ with $emptyset in T$ and $X in T$,
closed under finite intersection $inter.big_i^N T_i in T$
and arbitrary union $union.big_i^oo T_i in T$.

Induced by a metric through the open balls
$B_r (x_0) = { x in X | d(x, x_0) < r }$:
a point $x_0 in M$ is an inner point iff $exists r in RR^+: B_r (x_0) subset.eq M$,
a set $M$ is open iff every $x in M$ is an inner point,
and $T = { M | M "open" }$.
