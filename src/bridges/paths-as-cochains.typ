#import "/src/setup.typ": *
#show: note

= Paths as Cochains

A uniform time grid is a one-dimensional simplicial complex,
and a discretized stochastic process is a cochain on it.
The degenerate case of the de Rham complex says everything about
what a path is, what its increments are, and why refining a grid is consistent.

== Values and increments

Nodes carry the states $X_0, dots, X_N$, a $0$-cochain,
and intervals carry the increments $Delta X_k = X_(k+1) - X_k$, a $1$-cochain.
The coboundary is the forward difference,
and its inverse is the partial sum,
$
  X_k = X_0 + sum_(j < k) Delta X_j.
$
The two representations carry the same information up to the kernel of $dif$,
which is the constants, so increments alone determine a path only up to $X_0$.
That is $frak(H)^0$ on a connected grid, and it is the initial condition:
the integration constant of the discrete fundamental theorem of calculus.

Brownian motion is stored as its increments because its defining structure lives there,
independence and stationarity being statements about the $1$-cochain,
while the solution of an SDE is stored as its values because a scheme produces those recursively.
The choice of representation follows where the simple structure sits, not what the object is.

== The complex stops at one

There are no $2$-cells, so the complex is $Lambda^0 -> Lambda^1$ and ends,
and $dif compose dif = 0$ holds vacuously.
Second differences are therefore not $dif^2$.
They are the round trip
$
  L = dif^star dif,
$
from nodes to intervals and back, which on a uniform grid is the stencil $(1, -2, 1) \/ h^2$.

The generator of a diffusion splits along that line.
The drift is the $dif$ part, staying in one degree and needing no metric,
and the diffusion is the $dif^star dif$ part, whose $dif^star$ carries the metric.
This is why $sigma sigma^top$ appears in the generator and in the Fokker-Planck equation
while $sigma$ alone never does.

== Coarsening commutes

Passing a path to a coarser grid is the de Rham map in each degree:
evaluation at the coarse nodes in degree $0$,
and integration over the coarse interval, so summation of the fine increments, in degree $1$.
The two commute with the coboundary,
$
  dif compose "restrict" = "coarsen" compose dif,
$
because a sum of fine increments telescopes to the difference of the coarse endpoint values.

The commuting square is what makes a coarsened Brownian path
a Brownian path on the coarse grid rather than an approximation of one.
Every argument comparing a scheme against itself across resolutions rests on it:
the strong order of a scheme, and the coupling between levels
that makes the differences of the multilevel estimator small.
