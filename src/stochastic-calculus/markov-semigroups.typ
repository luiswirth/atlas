#import "/src/setup.typ": *
#show: note

= Markov Semigroups

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
