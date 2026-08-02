#import "/src/setup.typ": *
#show: note

= The Finite Element Method

FEM is Galerkin with a mesh.
Everything that distinguishes it from Galerkin in the abstract
comes from the one choice of building the trial space out of local pieces,
so that the basis functions have small support and the resulting matrix is sparse.

== The variational form is the primitive, not the PDE

The usual presentation starts from a PDE and derives a weak form,
which makes the weak form look like a weakened version of something stronger.
The dependency runs the other way.
A quadratic functional
$
  J(v) = 1/2 bilf(a)(v, v) - linf(l)(v)
$
with $bilf(a)$ symmetric and positive definite has a unique minimizer over a Hilbert space
on which $linf(l)$ is bounded,
and stationarity of $J$ is exactly
$
  bilf(a)(u, v) = linf(l)(v) quad forall v in V_0.
$
Only if the minimizer happens to be smooth enough
can one integrate by parts and read off a PDE.
The variational problem is well posed for data for which the PDE is meaningless,
so it is the primitive object and the PDE is the special case.

This also fixes the function space rather than leaving it to taste.
The rule is to take the largest space on which the problem is still defined,
that is on which $bilf(a)(v, v) < oo$,
and for a second-order problem that space is $H^1$.
The space is read off the energy, not imposed.

== Trial and test are different spaces

The asymmetry between the trial space $hat(V)$ and the test space $V_0$
is where the boundary conditions live,
and it is the one structural feature that a first pass tends to flatten.

A Dirichlet condition constrains the solution, so it goes into the trial space,
which is therefore an affine space $hat(V) = g + V_0$ and not a subspace.
The test space carries the corresponding homogeneous condition:
one does not test where the solution is already known.
This is why Dirichlet conditions are called essential.
A Neumann condition constrains nothing about the solution;
it enters through a boundary term in $linf(l)$ produced by the integration by parts,
so it is satisfied only in the weak sense and only by the solution.
This is why it is called natural.

The classification is not about the physics of the two conditions,
which are equally physical, but about which of the two spaces absorbs the condition.

== Galerkin is orthogonal projection

Restricting to a finite-dimensional $V_(0,h) subset V_0$ gives
$
  bilf(a)(u - u_h, v_h) = 0 quad forall v_h in V_(0,h),
$
by subtracting the discrete problem from the continuous one tested against $v_h in V_(0,h)$.
The error is $bilf(a)$-orthogonal to the discrete space.
When $bilf(a)$ is symmetric positive definite it is an inner product, the energy inner product,
and the statement is that $u_h$ is the orthogonal projection of $u$ onto $V_(0,h)$.
Hence
$
  norm(u - u_h)_bilf(a) = inf_(v_h in V_(0,h)) norm(u - v_h)_bilf(a),
$
which is Céa's lemma:
the Galerkin solution is the best approximation in the energy norm.
Without symmetry the equality weakens to a bound with the continuity and coercivity
constants of $bilf(a)$, but the shape of the argument is unchanged.

This is the pivot of the entire error theory.
It removes the PDE from the question.
Whatever is left to estimate is how well the exact solution can be approximated
by the discrete space at all, which is pure approximation theory
and knows nothing about the operator that produced $u$.

== Error analysis is approximation theory plus regularity

The best-approximation error of a mesh-based space is bounded by an interpolation error,
since the interpolant is one competitor in the infimum.
For Lagrangian elements of degree $p$ on a shape-regular mesh of width $msize$,
with the solution in $H^k$,
$
  inf_(v_h in lagrange(p, mesh)) norm(u - v_h)_(H^1) <= C msize^(min{p, k-1}) norm(u)_(H^k).
$
Two quantities control the rate and they are of entirely different kinds.
The polynomial degree $p$ is chosen; the smoothness $k$ is a property of the solution,
and it is not free.

That is what elliptic regularity supplies.
It says the solution operator gains two derivatives on the data,
so $f in H^k$ gives $u in H^(k+2)$, provided the domain cooperates,
smooth boundary or convexity being the usual hypotheses.
Where the domain fails to cooperate, at a reentrant corner,
the solution genuinely lacks the smoothness
and the rate genuinely degrades: the estimate is not pessimistic, it is correct.
Recovering the rate then requires adapting the mesh rather than the analysis.

Because $min{p, k-1}$ is a minimum, refining the degree past the regularity of the solution
buys nothing. This is the whole content of the choice between h- and p-refinement.

== Duality buys an order

Measuring the error in $L^2$ rather than in the energy norm gains one power of $msize$.
The mechanism generalizes past that particular pair of norms.
For a linear functional output $F$, solve the dual problem $bilf(a)(g_F, v) = F(v)$;
then
$
  abs(F(u) - F(u_h)) <= C norm(u - u_h)_bilf(a) inf_(v_h in V_(0,h)) norm(g_F - v_h)_bilf(a).
$
The output error is a product of two approximation errors,
the primal one and the dual one,
so it converges at the sum of their rates.
A quantity of interest whose dual solution is smooth is computed far more accurately
than the field it is extracted from.
See the note on dualities for what the dual solution is as an object.

== Variational crimes

The bilinear form actually assembled is never the one analyzed.
Quadrature replaces the integrals, polygons replace curved boundaries,
and the discrete problem solved is
$
  bilf(a)_h (tilde(u)_h, v_h) = linf(l)_h (v_h).
$
The perturbation is unavoidable, so the question is never whether to commit one
but whether it costs anything asymptotically.
A crime is admissible when it leaves the convergence rate intact,
which puts a floor on the quadrature order and on the degree of the boundary approximation,
each tied to $p$.
The consistency error enters additively alongside the approximation error, by Strang's lemmas,
and the design rule is simply to keep it below the term that already dominates.

== What FEM assumes without saying so

Every step above rests on the energy inner product being an inner product,
that is on coercivity of $bilf(a)$ over the whole space.
Then any subspace inherits stability for free,
and this is the reason conformity is enough:
choose a subspace, and it works.

That is a genuinely restrictive assumption.
It fails for saddle point problems, where stability of the discrete pair
is an extra condition, the inf-sup condition, not implied by conformity.
It fails for the Hodge Laplacian, where the operator is not coercive
and the kernel is topological.
The discrete space must then be chosen to reproduce structure
that the coercive theory never had to mention,
which is what FEEC is about.
