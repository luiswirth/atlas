#import "/setup.typ": *
#show: note

= Numerics of SDEs

Two notions of convergence, and every scheme is a truncated stochastic Taylor series.

== Strong and weak

Strong approximation asks the discrete path to follow the exact path,
weak approximation only asks the law to be right,
so only expectations of functionals are compared.
The distinction is not a technicality:
a scheme can be first order weakly and half order strongly at the same time,
and which one matters is decided by what the quantity of interest is.

== Euler-Maruyama

With timestep $h = T \/ N$,
$
  Y_(n+1) = Y_n + mu(Y_n) T/N + sigma(Y_n) (W_((n+1)T \/ N) - W_(n T \/ N)),
$
which is a discrete-time stochastic process.
For $mu, sigma$ globally Lipschitz and enough polynomial regularity,
it converges weakly with order one.

Richardson extrapolation combines two runs with steps $2N$ and $N$
into second order weak convergence,
$
  abs(EE[f(X_T)] - EE[2 f(Y_T^(2N)) - f(Y_T^N)]) <= C N^(-2).
$

== The generator and the noise operators

The generator, also the zeroth noise operator, is
$
  (cal(L)^0_(mu,sigma) f)(x) = f'(x) mu(x) + 1/2 sum_(i=1)^m f''(x)(sigma_i (x), sigma_i (x)),
$
and it gives the drift term of Itô's formula.
The noise operators $(cal(L)^i_(mu,sigma) f)(x) = f'(x) sigma(x)$
give the diffusion term.
Together Itô's formula reads
$
  f(X_t) = f(X_0) + integral_0^t (cal(L)^0_(mu,sigma) f)(X_s) dif s
  + sum_(i=1)^m integral_0^t (cal(L)^i_(mu,sigma) f)(X_s) dif W_s^((i)).
$

== Stochastic Taylor

Truncated Taylor series give rise to the schemes:
first order gives Euler-Maruyama, second order gives Milstein,
whose extra term is the iterated stochastic integral
$
  sum_(i,j=1)^m sigma'_i (Y_n) sigma_j (Y_n)
  integral_(n T \/ N)^((n+1) T \/ N) integral_(n T \/ N)^s dif W_u^((j)) dif W_s^((i)).
$
That double integral is what makes Milstein expensive in more than one noise dimension,
since it cannot be written in terms of the increments alone.

== Multilevel Monte Carlo

A plain Monte Carlo estimator over Euler paths pays for accuracy twice,
in the timestep and in the sample count.
The multilevel estimator instead telescopes over a hierarchy of timesteps,
$
  E_"ML" = 1/K_0 sum_(k=1)^(K_0) f(macron(Y)^(N_0,k,0))
  + sum_(l=1)^L 1/K_l sum_(k=1)^(K_l)
  (f(macron(Y)^(N_l,k,l)) - f(macron(Y)^(N_(l-1),k,l))),
$
where the Brownian motions must be the same within a level,
so that the differences are small and few samples suffice on the fine levels.
The coarse level carries the bulk of the samples and none of the cost.
