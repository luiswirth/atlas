#import "/src/setup.typ": *
#show: note

= The Hodge Laplacian

The abstract Hodge Laplacian is defined on any Hilbert complex,
$
  W^(k-1) arrows.rl^dif_(dif^star) W^k arrows.rl^dif_(dif^star) W^(k+1),
$
by
$
  L := dif^star dif + dif dif^star,
$
with domain
$
  cal(D)(L^k) = { u in V^k inter V_k^star : dif u in V_(k+1)^star, dif^star u in V^(k-1) }.
$
When the complex is the de Rham complex this is the usual Hodge Laplacian.

Its null space is exactly the harmonic forms, which justifies the name,
and they are orthogonal to its range.

== Why the problem needs two repairs

The Hodge-Laplace problem is: given $f$, find $u in cal(D)(L)$ with
$
  L u = f, quad u perp frak(h).
$

The side condition is there because the harmonic forms are the null space of $L$,
so with non-trivial topology the operator is not injective and solutions are not unique.
For a scalar homogeneous Neumann problem this is the vanishing mean condition
$integral u = 0$.

That is not yet enough.
Pairing the range against a harmonic form $p$ gives
$
  (L u, p) = (dif^star u, dif^star p) + (dif u, dif p) = 0,
$
so $p perp cal(R)(L)$, which is unsurprising since $L$ is self-adjoint
and the range of a self-adjoint operator is orthogonal to its kernel.
Harmonic forms are therefore not in the image, and not every $f$ admits a solution.
The fix is to keep only the non-harmonic part of the data,
splitting $W = frak(h) xor frak(h)^perp$ and solving
$
  L u = f - P_frak(h) f,
$
that is, $L u = f$ modulo the harmonic forms.
For the scalar Neumann problem this is $-Delta u = f - macron(f)$
with $macron(f)$ the average, the projection onto the constants.

The two repairs are one statement read on both sides:
the kernel is removed from the solution space,
and the same kernel is removed from the data.
