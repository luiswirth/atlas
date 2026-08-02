Brownian Motion has infinite total variation (path length) but finite ($t$) quadratic variation.
Deterministic functions have finite total variation and zero quadratic variation.

We therefore need to invent a new calculus.


The transition kernel (Markov process) for Browninan motion is exactly the fundamental solution of the heat equation.
Every diffusion PDE has a stochastic process underneath. This is the Feynman-Kac formula.
This powers numerical PDE methods like Walk-on-Spheres.

The Ito integral is defined at the left-endpoint of the rectangle, this makes it a martingale.

Ito isometry gives
$
  EE[integral_0^t sigma_s dif B_s] = 0
  \
  EE[(integral_0^t sigma_s dif B_s)^2] = integral_0^t EE[sigma_s^2] dif s
$
The stochastic integral preserves $L^2$-norms.


Ito's formula is a updated chain rule for stochastic processes that accounts for
the fact that we have the finite quadratic variation.
The Taylor expansion has an additional first order term, because of $(dif B_t)^2 = dif t$

== Continuous-time Markov Process

Markov Property
Expectation with Filtration is just Expectation of current time.

Transition Kernel
$p_s(x, A)$
Need to compose nicely (Chapman-Kolmogorov) $p_(s+t) (x,A) = integral p_t (x, dif y) p_s (y, A)$

Markov Operator
Evolves test functions forward in time
$
  P_t g(x) = EE[g(X_t) | X_0 = x] = integral_S f(y) p_t(x, dif y)
$

Form a Markov Semigroup, because of composition
continuous one-parameter semigroup of operators
not a group, because no inverse (inverting time not possible)
$
  P_0 = I, P_(t+s) = P_t P_s
$

Infinitesimal generator.
Describes the whole process.
$
  cal(L) g := lim_(t -> 0) (P_t g - g)/t
$
Recover semigroup via exponential
$
  P_t = e^(t cal(L))
$
just like for ODEs
$
  dot(x) = A x ==> x(t) = e^(t A) x_0
  \
  dot(x) = Delta x ==> u(t) = e^(t Delta) u_0
  \
  partial_t P_t g = cal(L) P_t g ==> P_t = e^(t cal(L))
$

Kolmogorov backward equation: Test function evolution.
Kolmogorov forward equation: Measure evolution. Adjoint of Markov operator. Fokker plank.

Langevin diffusion.


