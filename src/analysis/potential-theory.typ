#import "/src/setup.typ": *
#show: note

= Potential Theory

Here some probabilistic potential theory.

== Harmonic functions and Brownian motion

The Laplacian is the generator of Brownian motion, $cal(L) = 1/2 Delta$,
and everything below is a consequence of that one fact.
It is the Itô correction and nothing else:
the second-order term that survives because Brownian paths are too rough
for the ordinary chain rule.

For a function $f$ the following are the same statement seen from four sides:
$Delta f = 0$, so $f$ is harmonic;
$f(B_t)$ is a martingale, so Brownian motion gives it no drift;
$f$ has the mean value property, so a Brownian exit leaves it unchanged in expectation;
and $f$ is stationary under the generator.
Kakutani follows from the martingale characterization by optional stopping:
if $f(B_t)$ is a martingale and $tau$ is the first exit time,
then $f(x) = EE^x [f(B_0)] = EE^x [f(B_tau)]$.

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

Its existence is Riesz: for fixed $x$ the map $g |-> u(x)$ is a positive linear
functional on $C(partial Omega)$, so it is integration against a unique Borel measure.

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

This makes the identity $P = −partial_n G$ feel inevitable.
The Poisson kernel is the Green's function differentiated down to the boundary,
discarding all interior time and keeping only the final landing distribution.

The three objects are one chain.
The Green's function carries the interior influence and its singularity at the source,
the Poisson kernel is its normal derivative at the boundary and integrates to one,
and the harmonic measure is $omega_x = P(x, dot) dif sigma$.

== Feynman-Kac formula

For $-Delta u + V u = f$ with boundary data $g$,
the Brownian motion acquires a weight along its path,
$
  u(x) = EE^x [g(B_tau) e^(-integral_0^tau V(B_t) dif t)]
  + EE^x [integral_0^tau f(B_s) e^(-integral_0^s V(B_t) dif t) dif s].
$
The exponential kills paths passing through regions where $V > 0$.
This is the generalization Kakutani is a special case of:
every linear PDE whose operator generates a Markov process
can be solved by a weighted expectation over paths of that process.
The Green's function of $-Delta + V$ is that exponential weight
integrated against the unweighted Brownian kernel.

== Girsanov's theorem

Importance sampling for stochastic path integrals.

What's the measure change induced by changing the drift in a stochastic process.

Adding a drift $b$, so passing from $PP$ to $QQ$, relates the two path measures by
$
  (dif QQ)/(dif PP) = exp(integral_0^t b(B_s) dot dif B_s - 1/2 integral_0^t abs(b(B_s))^2 dif s),
$
which is the importance weight carried when the sampling distribution changes.
The structure is the Feynman-Kac weight again:
changing the potential is, through Girsanov, changing the drift,
so the PDE and the sampling strategy are interchangeable descriptions of the same object.

== Walk on Spheres

Efficient algorithm for solving Laplace using Monte Carlo
of Browninan Motion hitting the boundary.

What makes it work is that harmonic measure on a sphere seen from its center is uniform,
which is the mean value property.
So instead of simulating the diffusive path step by step,
one takes $r = op("dist")(x, partial Omega)$, jumps to a uniform point on the sphere of radius $r$,
and repeats until $r$ is below a tolerance.
Each jump is as large as it can be while staying inside $Omega$,
and each is a free sample from harmonic measure at that scale,
since the Poisson kernel of a ball is exactly the uniform measure on the sphere.
For $-Delta u = f$ each sphere additionally contributes a source term
weighted by the Green's function of the ball, which is the Feynman-Kac structure again.

== The central thread

Every linear PDE whose operator generates a Markov process
can be solved by Monte Carlo sampling of that process,
with the solution written as an expectation through Feynman-Kac.
The solution operator is integration against a measure, by Riesz;
that measure has a density, by Radon-Nikodym, which is the integral kernel;
and the kernel is the normal derivative of the Green's function.
Girsanov is importance sampling on path space,
and Walk on Spheres is the elliptic special case
where one large sample replaces infinitely many small steps.
