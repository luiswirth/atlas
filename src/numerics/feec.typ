#import "/src/setup.typ": *
#show: note

= Finite Element Exterior Calculus

FEEC discretizes a Hilbert complex rather than a single equation.
The object being approximated is the de Rham complex,
and what is preserved is not the value of the solution but the complex property,
that the composition of two consecutive maps vanishes,
together with the cohomology it computes.

== Why conformity is not enough here

For a coercive problem, choosing any subspace works,
because coercivity is inherited by subspaces.
See the note on the finite element method for how the whole error theory rests on that.

The Hodge Laplacian is not coercive.
Its kernel is the harmonic forms, and their dimension is a Betti number,
so it is topology and not analysis that decides whether the operator is invertible.
A discrete space chosen for approximation quality alone
has no reason to reproduce that kernel.
It will have a kernel of its own, of whatever dimension the accident of the basis produces,
and spurious modes appear that converge to nothing.
The requirement is therefore not "approximate the space well"
but "approximate the complex", and those are different demands.

== The degrees of freedom are cochains

A differential $k$-form is a thing that gets integrated over $k$-dimensional pieces.
Take that literally as the definition of the discretization.
Given a simplicial complex $simpcomp$,
the discretization of $omega in forms(k, Omega)$ is the map assigning to each $k$-simplex
the number
$
  (interp omega)(simp) = integral_simp omega, quad simp in Delta_k (simpcomp),
$
which is a simplicial $k$-cochain.
No point values, no coefficient functions, no choice of frame: only integrals over the mesh.

This is the step that makes everything else follow,
and it is worth stating what it costs.
The projection is defined only on forms regular enough to have well-defined traces on simplices,
so it is not defined on all of $l2forms(k, Omega)$.
The bounded projection needed for the theory is built afterwards,
by smoothing before integrating.

== The exterior derivative becomes the transpose of the boundary

Stokes' theorem, in the pairing between forms and chains given by integration,
$
  inner(omega, c) := integral_c omega,
$
reads
$
  inner(dif omega, c) = inner(omega, bdry c).
$
So $dif$ is the adjoint of $bdry$, and no approximation is involved in saying so.

Define the discrete exterior derivative to be exactly that adjoint on cochains.
Then $dif_h$ is the transpose of the signed incidence matrix,
$
  amat(dif)^k = amat(D)_(k+1)^transp,
$
with entries in ${-1, 0, +1}$.
Three consequences fall out at once, and they are the substance of the method.

The discrete Stokes theorem holds exactly, by construction, not up to quadrature error.

The complex property $dif_h compose dif_h = 0$ holds exactly,
because it is $bdry compose bdry = 0$ transposed,
and that is a combinatorial identity about faces of faces.

The operator is purely topological.
It contains no geometry, no metric, no coordinates and no mesh vertex positions,
which is the discrete image of the fact that $dif$ needs no metric.
All the metric information of the problem is confined to the mass matrices,
that is to the discrete Hodge star, and it is separated cleanly from the differential structure.
Discrete cohomology is therefore computed by linear algebra over the incidence matrices alone,
and it agrees with the cohomology of the domain.

== Whitney forms reconstruct

Cochains are enough to differentiate but not to integrate against,
so a weak form needs actual fields.
The Whitney map sends a cochain back to a piecewise polynomial form,
$
  whitney(c) = sum_(simp in Delta_k (simpcomp)) c(simp) phi_simp,
$
with one basis function per $k$-simplex,
$
  phi_(i_0 dots i_k) = k! sum_(l=0)^k (-1)^l lambda_(i_l)
  (dif lambda_(i_0) wedge dots.c wedge hat(dif lambda)_(i_l) wedge dots.c wedge dif lambda_(i_k)),
$
built from the barycentric coordinates of the cell, with the $l$-th factor omitted.

The defining property is the Lagrange property with points replaced by simplices,
$
  integral_simp phi_tau = delta_(simp tau),
$
signed, so that reversing the orientation of $simp$ flips the sign.
This says precisely that $interp compose whitney$ and $whitney compose interp$ are identities
on the respective spaces:
cochains and Whitney forms are the same object seen twice,
and the degree of freedom of a Whitney form really is the integral of that form
over its own simplex.

For $k = 0$ these are the barycentric hat functions and the ordinary Lagrange element.
For $k = 1$ they are the edge elements, for $k = n-1$ the face elements,
so the vector-proxy zoo of $Hcurl$- and $Hdiv$-conforming elements
is one family read at different degrees.
Conformity is likewise one statement:
what must be continuous across a face is the trace,
tangential components for $k=1$, normal for $k=n-1$,
and the Whitney space enforces exactly that and nothing more.

== The commuting diagram is the whole point

The two constructions agree:
$
  interp dif omega = dif_h interp omega.
$
Discretize then differentiate, or differentiate then discretize, and get the same cochain.
This is again just Stokes' theorem, since both sides are $integral_(bdry simp) omega$.

The commuting property is what upgrades a collection of good spaces into a good method.
It makes the Whitney spaces a subcomplex of the de Rham complex,
$
  0 -> whitney forms(0, simpcomp) ->^dif dots.c ->^dif whitney forms(n, simpcomp) -> 0,
$
so the discrete cohomology is a genuine cohomology and not an artifact,
and a discrete Hodge decomposition holds with the same three summands as the continuous one.
Stability and convergence for the Hodge-Laplace problem follow from this
rather than from coercivity,
which is why the argument survives an operator with a nontrivial kernel.

== Where the family goes

Whitney forms are the lowest-order member $polytrim(1, k, simpcomp)$
of the trimmed polynomial family,
which together with the full family $poly(r, k, simpcomp)$
exhausts the finite element spaces of differential forms with the commuting property.
The trimmed spaces are the ones that hold the complex together at mixed degrees.

The classification is a statement about which spaces can work at all,
not a menu of tricks:
the requirement of a commuting projection selects the family,
and outside it there is nothing to choose.

== What the structure preservation is worth

The comparison to draw is with penalizing.
One can take a discretization that fails to be a subcomplex
and add a term punishing the violation of $dif dif = 0$ or of a gauge condition.
This makes the constraint approximately true, with an error that has to be tuned against
the discretization error, and it leaves spurious modes present but shifted.

FEEC makes it exactly true instead, in the arithmetic, with no parameter.
The constraint holds because it is $bdry bdry = 0$ transposed,
which is true of the mesh and not of the solution.
Structure enforced by construction rather than by a penalty is the same move
the EPGP note makes for a prior;
the categories differ, the mechanism is the same.
