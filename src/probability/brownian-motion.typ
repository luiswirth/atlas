#import "/src/setup.typ": *
#show: note

= Brownian Motion

The roughness of Brownian motion is not an extra assumption.
It follows from independence of the increments alone,
and everything peculiar about stochastic calculus is downstream of it.

== Why the exponent is one half

Independence means that variances add, not standard deviations.
Splitting $[0,t]$ into $N$ increments gives $"Var"(B_t) = N "Var"(Delta B)$,
so the typical size, which is the standard deviation, grows like $sqrt(N)$.
A deterministic quantity, whose pieces all pull in the same direction, would grow like $N$.
The gap between $1/2$ and $1$ is the entire pathology.

Counting the pieces of a partition into steps of size $Delta t$,
there are $N = t \/ Delta t$ of them, each of typical size $abs(Delta B) tilde.op sqrt(Delta t)$.
The three natural sums then separate.

#table(
  columns: 3,
  table.header([sum], [scaling], [limit]),
  [$sum Delta B_i$], [cancellation, so $sqrt(N Delta t) = sqrt(t)$], [finite, random],
  [$sum abs(Delta B_i)$], [$N sqrt(Delta t) = t \/ sqrt(Delta t)$], [$infinity$],
  [$sum (Delta B_i)^2$], [$N Delta t = t$], [finite, deterministic],
)

So the path has infinite length and finite quadratic variation $[B]_t = t$,
and the limit in the last line is not merely in mean:
a random object becomes a deterministic one.
The exponent $2$ is the borderline, since any power above it gives $N Delta t^(>1) -> 0$,
which is why the Taylor expansion along a Brownian path stops at second order
and why $dif B dif B = dif t$ is the only new rule.
In $n$ dimensions each coordinate contributes, $[B]_t = n t$ and $dif B^i dif B^j = delta^(i j) dif t$,
and that per-coordinate accumulation is the $n$ that appears in discretization bounds.

== Why no derivative exists

Differentiability is a statement about zooming in:
a function is differentiable where magnifying time and space by the same factor straightens the graph.
Brownian motion is self-similar with the wrong pairing,
$
  B_(c t) eq^d sqrt(c) B_t,
$
so seeing the same picture again costs a magnification $sqrt(c)$ in space against $c$ in time.
The difference quotient therefore scales like $sqrt(c) \/ c = 1 \/ sqrt(c)$, which diverges as $c -> 0$.
A smooth function has a scale below which it is boring; Brownian motion has none.

Structurally, a velocity is information that survives across scales,
since it asserts that the next increment continues the last one,
and independent increments assert exactly the opposite.
Continuity with independent stationary increments and the existence of a derivative
are incompatible demands, and Brownian motion is what remains when the first is kept.

The scope of the argument is the same as its input.
It applies to anything driven by white noise and stops as soon as increments are correlated
over a finite time $tau$, below which the path looks smooth again.
Physical noise is of that kind, and Brownian motion is its $tau -> 0$ idealization.

== Why the pathology is useful

Because $sqrt(Delta t)$ sits above $Delta t$, the noise dominates the drift over a single small step,
which is why a diffusion explores its neighborhood regardless of where the drift points.
Because squares accumulate deterministically, the aggregate effect of that same noise is not random:
it is the second-order term of the generator.
The exploration is random and its bookkeeping is not,
and every operator built on the process is the deterministic residue of that cancellation.
