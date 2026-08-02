#import "/setup.typ": *
#show: note

= Measures and Distributions

== The mental model

Both are measuring devices, and the roughness of the object is paid for by the smoothness of the probe.
Neither is ever seen directly, only through its readings $inner(T, f)$ against test functions,
and there is a budget of regularity conserved across the pairing:
concentrate the object further and the probe must be smoother to compensate.

#table(
  columns: 3,
  [object], [probe needed], [reads],
  [function], [integrable], [weighted average],
  [measure, $delta$], [continuous], [value at a point],
  [distribution, $delta'$], [differentiable], [slope at a point],
)

Physically, $delta$ is a point charge and a probe placed under it reports the field there,
while $delta'$ is a dipole, whose two opposite values cancel and leave the derivative.
Each derivative moved onto the object is one derivative moved onto the probe,
which is what integration by parts says,
$
  inner(T', f) = -inner(T, f').
$
That identity is the definition of the derivative of a distribution,
not a limit but the demand that integration by parts keep holding.
Distributions are therefore the completion of functions under whatever makes differentiation always work,
and measures are the stage of that completion at which nonnegativity and total mass still make sense.

== The hierarchy

$
  "functions" subset "measures" subset "distributions".
$

Both extremes act on test functions by $f |-> integral f dif mu$,
so the difference lies only in how much regularity the pairing demands.
A measure needs $f$ continuous and bounded and is controlled by $norm(f)_infinity$ alone,
whereas a general distribution needs derivatives of $f$ controlled as well.
The smallest object that is not a measure is $delta'$, with $inner(delta', f) = -f'(0)$,
which sees the slope, and no distribution of mass can do that.

Two characterizations sharpen the inclusion.
Measures are exactly the distributions of order zero, those bounded by the sup norm of $f$ with no derivatives.
Every nonnegative distribution is automatically a measure,
so the entire gap between the two consists of objects that fail to be nonnegative.
That is why probability never leaves the measure world,
while white noise, whose covariance is $delta$ and which carries a derivative, does.

== Representing a functional

Both Riesz representation theorems answer the same question,
namely what a continuous linear functional looks like.
On a Hilbert space every such $L: H -> RR$ is an inner product against a unique $v in H$,
so $H$ is its own dual.
On $C(X)$ for compact Hausdorff $X$, every positive linear functional
is integration against a unique Borel measure,
$
  L(f) = integral_X f dif mu.
$

The measure version gives existence without a reference measure,
and the Hilbert version is what it becomes once a reference measure is chosen.
If $nu << mu$, meaning every $mu$-null set is $nu$-null,
Radon--Nikodym produces a density $p >= 0$ with $nu(A) = integral_A p dif mu$,
written $p = (dif nu) \/ (dif mu)$,
and the functional turns into
$
  L(f) = integral f p dif mu = inner(f, p)_(L^2(mu)).
$
The Radon--Nikodym derivative is exactly the Hilbert space representer,
and every probability density is one, taken against Lebesgue measure.
The measure version is the more intrinsic statement, the Hilbert version the more concrete.

== The two senses of the word

Schwartz distributions and probability distributions are different notions with a shared root,
both taken from the physical picture of a quantity spread out over a space.
Schwartz took the name from charge and mass distributions,
where a point charge is spread over nothing at all, so it has a total but no density, and that is $delta$.
A probability distribution is the same picture with total mass one.

The senses overlap without coinciding.
Every probability distribution is a Schwartz distribution, of order zero.
The converse fails at $delta'$.
A random distribution uses both senses at once:
a probability distribution on a space of Schwartz distributions.
