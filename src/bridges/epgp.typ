#import "/src/setup.typ": *
#show: note

= Ehrenpreis-Palamodov Gaussian Processes

A prior that satisfies a constant-coefficient PDE by construction,
because its spectral support is the characteristic variety of the operator
and nothing else.

== The algebraic reading of Maxwell

Let $D = (partial_t, partial_x, partial_y, partial_z)$.
The source-free Maxwell equations are a matrix differential operator $P(D)$
acting on the six-component vector $u = (avec(B), avec(E))^transp$,
$
  P(D) u = 0.
$
Under the Fourier transform this becomes a statement in the polynomial ring
$CC[omega, k_x, k_y, k_z]$: derivatives turn into polynomial variables,
$partial_t |-> -i omega$ and $nabla |-> i avec(k)$,
which yields the symbol matrix $P(-i omega, i avec(k))$.
On Minkowski space $RR^(1,3)$ with signature $(-,+,+,+)$,
$
  partial_t limits(|->)^cal(F) -i omega, quad
  grad limits(|->)^cal(F) i avec(k), quad
  curl limits(|->)^cal(F) i avec(k) times, quad
  div limits(|->)^cal(F) i avec(k) dot, quad
  Delta limits(|->)^cal(F) -abs(avec(k))^2.
$
The principal symbol is $P(omega, avec(k)) = -omega^2 \/ c^2 + abs(avec(k))^2$,
and the characteristic variety is the light cone in four dimensions,
$
  Lambda = {(omega, avec(k)) mid(|) abs(avec(k))^2 = omega^2 \/ c^2}.
$
Time-harmonically the variety drops to a sphere in three dimensions,
$Lambda = { avec(k) mid(|) abs(avec(k))^2 = k_0^2 } = k_0 SS^2$.

== The fundamental principle

Every solution is built from transverse plane waves $avec(a) e^(i k hat(k) dot avec(r))$
with direction $hat(k) in SS^2$ and amplitude $avec(a) perp hat(k)$.
That such waves exhaust the solution space is the Ehrenpreis-Palamodov principle:
for a constant-coefficient system $P(partial) u = 0$,
every solution on a convex domain is a superposition
$
  u(avec(x)) = integral_V e^(i avec(xi) dot avec(x)) dif mu(avec(xi))
$
of exponential modes carried by the characteristic variety
$V = { avec(xi) mid(|) det P(avec(xi)) = 0 }$,
an inverse Fourier transform of a measure on $V$.
In general the modes are weighted by polynomial multiplier operators
encoding the multiplicity of the variety.

For the Helmholtz operator the variety is the simple sphere, no multiplier is needed,
and the principle is the classical Herglotz representation
$
  avec(E)(avec(r)) = integral_(SS^2) avec(a)(hat(k)) e^(i k hat(k) dot avec(r)) dif hat(k),
  quad avec(a)(hat(k)) perp hat(k),
$
with a tangential amplitude density on the direction sphere.
The transversality $avec(a) perp hat(k)$ is precisely the multiplier of the Maxwell system,
selecting the two physical polarizations on the variety.

== The prior

The construction is to put a Gaussian measure on exactly that density.
Replace the integral by a finite superposition or a quadrature rule,
place a normal prior on the plane-wave coefficients,
and what comes out is a Gaussian process
every sample of which solves the equation.
The constraint is not penalized, it is carried by the support of the prior.

== Why the Hertz potential is the right level

The Hertz potential $avec(Pi)$ is where the construction wants to sit,
one level deeper than the vector potential in the potential hierarchy.
Building the prior on $F$ directly requires enforcing $D F = 0$ as a constraint.
Building it on $avec(A)$ wastes probability on gauge directions.
The map $avec(Pi) |-> F = dif delta avec(Pi)$ satisfies Maxwell automatically
once $Delta avec(Pi) = 0$, which is enforced by restricting the spectral support
to the light cone.
The projector
$
  P(avec(k)) = -(avec(k) and iota_(avec(k)^sharp) (dot))
$
maps the six Hertz components to exactly the two physical polarizations,
with no surviving gauge freedom.
