#import "/src/setup.typ": *
#show: note

= Brownian Motion

Centered Gaussian process on $[0,infinity)$ with kernel
$
  k(s,t) = min(s,t),
$
and continuous paths. Equivalently $B_0 = 0$ with independent increments
$
  B_t - B_s tilde cal(N)(0, t-s), quad s < t,
$
independence being orthogonality of the indicators, $inner(bb(1)_((s,t]), bb(1)_((u,v])) = 0$
for disjoint intervals.

Continuity is not implied by the kernel and comes from Kolmogorov continuity applied to
$
  EE[abs(B_t - B_s)^(2k)] = c_k abs(t-s)^k,
$
which gives a modification with paths in $C^alpha$ for every $alpha < 1/2$.

== Invariances

#table(
  columns: 2,
  table.header([transformation], [statement]),
  [scaling], [$B_(c t) eqdist sqrt(c) B_t$],
  [symmetry], [$-B_t eqdist B_t$],
  [time inversion], [$t B_(1\/t) eqdist B_t$],
  [shift], [$B_(t+s) - B_s eqdist B_t$, independent of $cal(F)_s$],
)

Scaling pairs $sqrt(c)$ in space with $c$ in time, so the difference quotient scales like
$sqrt(c)\/c = 1\/sqrt(c) -> infinity$ and no derivative exists at any point.

== Variation

Variances add, not standard deviations, so $N$ increments of a partition of $[0,t]$ have
typical size $abs(Delta B) tilde.op sqrt(Delta t)$ with $N = t\/Delta t$.

#table(
  columns: 3,
  table.header([sum], [scaling], [limit]),
  [$sum Delta B_i$], [$sqrt(N Delta t) = sqrt(t)$, by cancellation], [finite, random],
  [$sum abs(Delta B_i)$], [$N sqrt(Delta t) = t\/sqrt(Delta t)$], [$infinity$],
  [$sum (Delta B_i)^2$], [$N Delta t = t$], [$t$, deterministic],
  [$sum abs(Delta B_i)^p$, $p > 2$], [$N Delta t^(p\/2) -> 0$], [$0$],
)

$
  quadvar(B)_t = t, quad dif B dif B = dif t.
$
Infinite total variation, so no pathwise Riemann-Stieltjes integral.
Finite deterministic quadratic variation, so the calculus is repaired in $L^2(Omega)$.
Exponent $2$ is the borderline, so Taylor expansion along a Brownian path stops at second
order.

In $n$ dimensions each coordinate contributes,
$
  dif B^i dif B^j = delta^(i j) dif t, quad quadvar(B)_t = n t,
$
and that per-coordinate accumulation is the $n$ appearing in discretization bounds.

== Martingales

$
  B_t, quad B_t^2 - t, quad exp(lambda B_t - lambda^2 t \/ 2)
$
are martingales for the Brownian filtration. The second compensates the quadratic
variation, the third generates the moments and gives
$
  PP(sup_(s <= t) B_s >= a) = 2 PP(B_t >= a) <= e^(-a^2 \/ (2t)),
$
the equality by the reflection principle.

== Consequences

Over one step the noise $sqrt(Delta t)$ dominates the drift $Delta t$, so a diffusion
explores its neighborhood regardless of the drift. Squares accumulate deterministically,
so the aggregate noise contributes the second-order term of the generator.
