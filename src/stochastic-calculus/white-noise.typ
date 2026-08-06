#import "/src/setup.typ": *
#show: note

= White Noise

White noise is the derivative of Brownian motion,
$
  W = dif B \/ dif t,
$
taken in the sense of distributions. The pairing needs no limit theory, only continuity of
the paths:
$
  W(f) := -integral_0^infinity f'(t) B_t dif t, quad f in C_c^infinity.
$
One derivative is lost as always, $B in C^alpha$ for $alpha < 1/2$ and $W$ locally in
$H^(-1/2-epsilon)$.

== Covariance and isometry

$W$ is the centered Gaussian process with covariance
$
  EE[W_s W_t] = delta(s - t),
$
a standard Gaussian attached to every time, all of them uncorrelated and hence independent.
Integrating both arguments against test functions performs the delta,
$
  EE[W(f) W(g)] = inner(f, g),
$
which is the same statement with the distribution already applied,
and extends the pairing from $C_c^infinity$ to all $f in L^2$.

So $W$ is an isometric embedding of $L^2$ of the index set into $L^2(Omega)$,
landing in the Gaussian subspace,
which is the measure-as-metric picture of probability read in the other direction.
Brownian motion is the image of the indicator family, $B_t = W(bb(1)_([0,t]))$,
and its defining properties are properties of that family:
the covariance is $inner(bb(1)_([0,s]), bb(1)_([0,t])) = min(s,t)$,
the variance is $norm(bb(1)_([0,t]))^2 = t$,
and independence of increments over disjoint intervals is orthogonality of their indicators,
which for jointly Gaussian variables is independence.
Read this way the Itô isometry holds for deterministic integrands by construction.

== Why the theory is written with $B$ instead

The integrands that matter are random and adapted, so they are as rough as $B$ itself,
and pairing a distribution against them is a product of distributions.
Itô's formula adds a second obstruction, since $f(B_t)$ is not a linear functional of the
noise and therefore lies outside what $W(dot)$ can express.
Finally $L^2$ of the index set carries no order, whereas adaptedness, filtrations and the
martingale property all need one, which is also why the Itô and Stratonovich conventions
coincide for deterministic integrands and separate once the integrand depends on the path.

White noise is defined on any measure space and needs no ordering,
and Brownian motion is white noise plus the linear order of time,
which is what buys the filtration and the martingale toolbox.
The white noise formulation stays the right language wherever that order is absent,
in spatial problems and stochastic PDEs, and wherever the Gaussian structure itself is the subject.
