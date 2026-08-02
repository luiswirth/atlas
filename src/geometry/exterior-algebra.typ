#import "/setup.typ": *
#show: note

= Exterior Algebra

== Primal and dual

Vectors are primal and represent directions of motion and flow, tangent to curves.
Forms are dual and represent quantities you integrate, so they are measurement devices.
The degree of a form equals the dimension of what you integrate it over.
Force is naturally a 1-form, since work is $integral_gamma f$,
and $dif f$ is intrinsically a covector.
The metric converts between the two worlds,
and in Euclidean $RR^3$ with Cartesian coordinates the distinction collapses,
which is why vector calculus gets away without it.

== Against Clifford algebra

Exterior algebra has no metric, its product is $and$, and its rule is $v and v = 0$.
Clifford algebra has a metric, its product is $dot.c$, and its rule is $v dot.c v = g(v,v)$.
The Clifford product decomposes as
$
  u dot.c v = g(u,v) + u and v,
$
so it contains the exterior product as its antisymmetric part
and the inner product as its symmetric part.
Setting $g = 0$ recovers exterior algebra.
