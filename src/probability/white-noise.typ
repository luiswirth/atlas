#import "/setup.typ": *
#show: note

= White Noise

White noise is the object Brownian motion is built from,
and it admits two definitions that describe the same thing with different amounts of honesty.

== As a Gaussian process

White noise is the centered Gaussian process with covariance
$
  EE[W_s W_t] = delta(s - t),
$
that is, a standard Gaussian attached to every time, all of them uncorrelated and hence independent.
Brownian motion is its running integral, $B_t = integral_0^t W_s dif s$,
and the variance check returns the right answer,
$
  EE[B_t^2] = integral_0^t integral_0^t EE[W_s W_u] dif s dif u = integral_0^t integral_0^t delta(s - u) dif s dif u = t.
$

The kernel is a distribution and not a function, so setting $s = t$ would give $"Var"(W_t) = infinity$.
White noise has no pointwise values, and the definition only means something
once both arguments have been integrated against something.

== As an isometry

The second definition skips the broken step.
Rather than naming values that do not exist and repairing them by integration afterwards,
it names only the smeared quantities, which do exist:
to each $f in L^2$ it assigns a centered Gaussian $W(f)$, thought of as $integral f(t) W_t dif t$, with
$
  EE[W(f) W(g)] = inner(f, g).
$
This is the first definition with the $delta$ integral already performed,
since $integral integral f(s) g(u) delta(s - u) dif s dif u = inner(f, g)$,
and no distribution appears anywhere in it.

So white noise is an isometric embedding of $L^2$ of the index set into $L^2(Omega)$,
landing in the Gaussian subspace,
which is the measure-as-metric picture of probability read in the other direction.
Brownian motion is the image of the indicator family, $B_t = W(bb(1)_([0,t]))$,
and its defining properties are properties of that family rather than of the noise.
The covariance is $inner(bb(1)_([0,s]), bb(1)_([0,t])) = min(s,t)$,
the variance is $norm(bb(1)_([0,t]))^2 = t$,
and independence of increments over disjoint intervals is orthogonality of their indicators,
which for jointly Gaussian variables is independence.
Read this way the Itô isometry is not a theorem but the definition,
holding for deterministic integrands by construction.

== What kind of object it is

$W$ is a random distribution, meaning a probability distribution
on a space of Schwartz distributions: for each outcome it is a linear functional, not a function of $t$.
The two senses of the word collide here and are genuinely different, see the note on distributions.

It is not a jump process, and it is not a process at all.
The compensated Poisson process also has independent increments and is also a martingale,
and its derivative is also not a function, but it is a measure,
a sum of Diracs at jump times that can be located.
White noise is one order rougher than a measure and has no locatable features whatsoever.
The picture of many tiny independent kicks is a limit of jump processes
in which the individual kicks are destroyed rather than made small,
and Brownian paths are continuous, so there is nothing left to jump.

One refinement is worth keeping.
Distributions normally pair against smooth compactly supported test functions,
whereas here the test space is all of $L^2$, which is far larger.
That is possible only because the pairing is random and the bound is in mean square,
$EE[W(f)^2] = norm(f)^2$, rather than pointwise.

== Why the theory is written with $B$ instead

Three obstructions, and they compound.

The integrands that matter are random and adapted, not test functions.
Pairing a distribution against something requires that something to be smooth,
and an adapted integrand is as rough as $B$ itself,
so $W dot H$ is a product of distributions, which is the operation distribution theory does not have.
Itô's formula makes it worse, since $f(B_t)$ is not a linear functional of the noise
and therefore lies outside anything $W(dot)$ can express.

Finally, $L^2$ of the index set carries no order.
Adaptedness, filtrations, the martingale property and the left endpoint convention
are extra structure imposed on top of the noise and invisible in the isometry,
which is why the Itô and Stratonovich conventions coincide for deterministic integrands
and separate only once the integrand depends on the path.

The trade is the usual one.
White noise is the more general and more symmetric object, defined on any measure space with no ordering,
and Brownian motion is white noise plus the linear order of time,
which is what buys the filtration and the whole martingale toolbox.
The white noise formulation stays the right language wherever that order is absent,
in spatial problems and stochastic PDEs, and wherever the Gaussian structure itself is the subject.
Its name is spectral: the density is flat, all frequencies carrying equal power,
which is the Fourier statement of $delta(s-t)$ and hence of disjoint sets being orthogonal.
