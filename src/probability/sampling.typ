#import "/setup.typ": *
#show: note

= Sampling

Generating uniformly distributed pseudo random numbers is relatively easy,
and every other distribution is reached from those.

== Inversion

For a distribution function $F: RR -> [0,1]$, the generalized inverse is
$
  I_F (y) = inf { x in RR : F(x) >= y } = inf(F^(-1)([y, 1])).
$
Distribution functions are non-decreasing and càdlàg,
inverse distribution functions are non-increasing and càglàd.

For $U tilde cal(U)_((0,1))$,
$
  PP(I_F (U) <= x) = PP(U <= F(x)) = F(x),
$
so $I_F (U)$ has distribution function $F$.
Take uniform realizations, push them through the inverse distribution function,
and what comes out is distributed according to $F$.

== Acceptance and rejection

Given $A subset.eq B$, draw a realization uniform on $B$ and accept it if it lies in $A$.
What survives is uniform on $A$.

The subgraph of $f: RR^d -> RR^+_0$ is
$
  op("subgraph")(f) = { (x,y) in RR^d times RR : 0 <= y <= f(x) },
$
whose Lebesgue measure is $integral_(RR^d) f dif x$.
To generate a uniform random variable on it,
take an arbitrary $X$ and a uniform $U$ and set $Y = (X, f(X) U)$.
That is the whole trick behind rejection sampling:
uniformity on the subgraph is the same information as the density.

== Monte Carlo integration against quadrature

The point of Monte Carlo is to rewrite an integral as an expectation.
For a measure space with $mu(A) != 0$ and $f in L^1(mu)$,
build a probability space by normalizing, $PP(B) := mu(B) \/ mu(A)$,
so that $Y$ is uniform on $A$, and set $X = mu(A) f(Y)$.
Then $EE[X] = integral_A f dif mu$, and the empirical mean estimates it.

The deterministic competitor is quadrature,
and the comparison is entirely about how the error scales with dimension.
The rectangle method on $[a,b]^d$ with $n$ nodes and an $alpha$-Hölder integrand gives
$
  epsilon <= ((b-a)^(d+alpha) d^(alpha \/ 2) abs(f)_(cal(C)^alpha))/(n^alpha),
$
so the exponent is set by the regularity and the constant grows with the dimension.
The role of $alpha$ is visible in $x |-> x^beta in cal(C)^alpha([0,1])$
holding exactly when $alpha <= beta$,
and $alpha = 1$ is the Lipschitz case.
The Monte Carlo error is $O(K^(-1 \/ 2))$ in the number of samples,
with no dimension in the exponent at all.
