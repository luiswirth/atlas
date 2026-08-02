#import "/setup.typ": *
#show: note

= Potential Theory

Here some probabilistic potential theory.

== Kakutani

$
  u(x)=EE^x [g(B_tau)]
$
where $tau$ is the first exit time of Brownian motion.

The solution $u$ is the expectation of the boundary data
evaluated where a browninan motion hit it.

$
  u(x)=∫_(partial Omega)​f(ξ) dif PP^x(B_tau​in dif xi)
$

== Harmonic measure

Similar to Green's function / fundamental solution but doesn't describe how
source function generates solution, but how boundary values generate solution.

So we have a Laplace problem $-Delta u = 0$ with $u = g$ on the boundary.

It's a measure $omega(x, Omega)$ that is associated with a point $x$ inside
the domain $Omega$, measuring a part $B$ of the boundary $partial Omega$.
Now this measure is the probability of a brownian motion starting at x to hit
the boundary part B.

Harmonic measure is the exit distribution of Brownian motion in a bounded domain.

The harmonic measure than gives the following representation formula
of the solution $u$:
$
  u(x) = integral_(partial Omega) g(y) dif omega(x, Omega)(y)
$

== Poisson Kernel


The Poisson Kernel is an integral kernel and is the Radon–Nikodym derivative of
harmonic measure with respect to the surface measure (Lebesgue measure).
$
  P(x, xi) = (dif omega_x)/(dif sigma) (xi)
$

So the harmonic measure is absolutely continous wrt the lebesgue measure
and the scaling is given by the poisson kernel.
$
  dif omega_x (xi) = P(x, xi) dif sigma (xi)
$

The representation formula then becomes
$
  u(x) = integral_(partial Omega) P(x, xi) g(xi) dif sigma(xi)
$


== Green's function

The Green's function has the probabilistic meaning:
$G(x,y)$ is proportional to the
expected time Brownian motion started at
$x$ spends near $y$ before exiting:
$
  G(x,y) prop EE^x [integral_0^tau​delta(B_t​− y)dif t]
$
More precisely, $G(x,y)dif y$ is the expected amount of time spent in a small
ball around $y$. The Green's function is the occupation time density of
Brownian motion.

This makes the identity $P = −partial_n G$ feel inevitable. The
The Poisson kernel is the Green's function differentiated down to the boundary,
discarding all interior time and keeping only the final landing distribution.

== Girsanov's theorem

Importance sampling for stochastic path integrals.

What's the measure change induced by changing the drift in a stochastic process.

== Walk on Spheres

Efficient algorithm for solving Laplace using Monte Carlo
of Browninan Motion hitting the boundary.
