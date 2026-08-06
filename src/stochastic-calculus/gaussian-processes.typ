#import "/src/setup.typ": *
#show: note

= Gaussian Processes

A process is Gaussian when every finite collection $(X_(t_1), ..., X_(t_k))$ is jointly
Gaussian. Joint Gaussianity is determined by first and second moments, so the process is
determined by the mean $m(t) = EE[X_t]$ and the covariance kernel
$
  k(s,t) = EE[(X_s - m(s))(X_t - m(t))].
$
Any symmetric positive semidefinite $k$ occurs, since the finite-dimensional laws it
prescribes are consistent, and Kolmogorov extension turns a consistent family into a
process. Path regularity is not part of that statement and has to be bought separately,
by Kolmogorov continuity from a moment bound on increments.

#table(
  columns: 2,
  table.header([process], [kernel]),
  [Brownian motion], [$min(s,t)$],
  [white noise], [$delta(s-t)$],
  [Ornstein-Uhlenbeck], [$e^(-abs(s-t))$],
  [Brownian bridge on $[0,1]$], [$min(s,t) - s t$],
)

The properties usually assumed of Brownian motion are properties of $min(s,t)$.
Increments over disjoint intervals are uncorrelated, and for jointly Gaussian variables
uncorrelated means independent, so independence of increments is not an extra axiom here.

Stationarity is $k(s,t) = k(t-s)$, and by Bochner such a $k$ is the Fourier transform of a
finite positive measure, the spectral measure. Brownian motion is not stationary, its
increments are. White noise has flat spectral density, which is $delta(s-t)$ read on the
Fourier side.

== As a Hilbert space

The span of ${X_t}$ closed in $L^2(Omega)$ is a Gaussian Hilbert space, a closed subspace
in which every element is Gaussian. The process is a map from the index set into that
space with
$
  inner(X_s, X_t)_(L^2(Omega)) = k(s,t),
$
so a Gaussian process is a kernel written as an inner product, and the kernel is positive
semidefinite because Gram matrices are. Extending the map from points to all of $L^2(T)$
gives the isonormal process, which is white noise.
