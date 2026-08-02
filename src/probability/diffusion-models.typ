#import "/setup.typ": *
#show: note

= Diffusion Models

== Langevin is MCMC

The dictionary is exact.
The transition matrix corresponds to $P_t = e^(t cal(L))$,
invariance $pi P = pi$ to $cal(L)^* mu = 0$,
detailed balance to self-adjointness in $L^2(mu)$,
the spectral gap to the Poincaré constant,
and the mixing time to the inverse gap.
ULA discretizes, and MALA adds the Metropolis correction.

== ODE and flow

Diffusion and deterministic transport produce the same marginals and different path laws.
The transporting velocity is $-grad log q$, pointing outward, opposite to the score.
The family
$
  dif Y = [Y + (1 + eta^2) grad log q_(T-t)] dif t + sqrt(2) eta dif tilde(B)
$
runs from the reverse SDE at $eta = 1$ to the probability flow ODE at $eta = 0$,
and the $2 -> 1$ on the score is that same sign rather than a constant to memorize.

DDPM and DDIM are those two ends discretized by an exponential integrator,
integrating the affine part exactly and freezing only the score,
so they agree with Euler to first order only.

Flow matching drops the diffusion:
take any path from a cheaply samplable law to the data
and obtain $v_t (x) = EE[u_t (x | Z) | X_t = x]$ by least squares,
which computes the conditional expectation on its own.

Rectified flow uses straight interpolations,
whose crossings make the averaged field curved.
Since ODE trajectories cannot meet,
the learned flow induces a non-crossing coupling,
and retraining on it straightens the paths without moving either marginal.
The perfectly straight flow exists and is the optimal transport map,
because paths crossing at equal times can be swapped to cut the cost,
but reflow need not reach it.
Exponential integrators fit the solver to the dynamics,
rectified flow fits the dynamics to the solver,
and sampling remains $N$-step Euler,
with $N = 1$ the point where straightness is assumed.

== Conditioning: Doob and Feynman-Kac

Conditioning is by definition rejection:
keep the paths whose endpoint satisfies the condition.
Among the survivors, Bayes gives the density at every time separately,
$rho_t = p_t h_t \/ Z$ with $h_t (x) = EE[G(Y_T) | Y_t = x]$
the chance of eventual acceptance,
so the product is prior times likelihood rather than a definition anyone chose.
$Z$ is the acceptance probability and the same number at every $t$, by the tower property.

Only the drift may change, and this is forced:
reweighting paths cannot create paths,
so the conditioned law is absolutely continuous with respect to the original,
while different diffusion coefficients would make the two mutually singular
through quadratic variation.
Since $grad log rho = grad log p + grad log h$, the correction is $b -> b + a grad log h$.
The initial law is tilted by $h_0$ as well,
which is trivial for guidance because pure noise carries no label information.

Comparing the two evolutions leaves the surplus $p_t (partial_t + cal(L)_t) h_t$, a source term.
Drift only transports mass,
so exactness requires the harmonicity constraint $(partial_t + cal(L)_t) h_t = 0$.
By Itô, $partial_t + cal(L)_t$ is the drift of $h$ along the process,
so this says $h_t (Y_t)$ is a martingale,
which the construction gives for free by the tower property:
your current best estimate of a fixed future quantity has no predictable trend.
That operator is the generator of the space-time process,
and the constraint is the backward Kolmogorov equation with terminal data $h_T = G$.
The name is classical: $Delta u = 0$ iff $u(B_t)$ is a martingale
iff $u$ has the mean value property,
and $cal(L)$-harmonicity generalizes it from $Delta$ to any generator.

Feynman-Kac is the general bridge from linear parabolic PDEs to path integrals:
$partial_t u + cal(L) u - V u = 0$ with $u_T = G$
solves as $EE[exp(-integral V) G(Y_T) | Y_t = x]$,
where $V$ is a killing rate, positive $V$ destroying mass and negative $V$ creating it.
It enters because a non-harmonic $h$ has a defect $V = (partial_t + cal(L))h \/ h$,
so $h$ is the conditional expectation of a terminal weight times a running discount.
Doob is the case $V = 0$, where steering suffices;
otherwise the drift is only a proposal,
and Feynman-Kac weights with resampling correct it,
which is inherently a particle method.

Guidance at scale $gamma$ uses $psi = h^gamma$, and the chain rule gives
$
  V^((gamma)) = 1/2 gamma(gamma - 1) norm(sigma^transp grad log h)^2,
$
zero exactly at $gamma in {0, 1}$.
So $gamma > 1$ samples a Feynman-Kac tilted law
and not the terminal power tilt $q_0 r_0^gamma$.
Classifier-free guidance follows from
$grad log r = grad log q(dot | c) - grad log q$:
the classifier gradient is the gap between the conditional and unconditional scores,
and guidance extrapolates along that segment, exact at $gamma = 1$.

The recipe is always the same: choose $G$, set $h_t = EE[G(Y_T) | Y_t]$,
and add $a_t grad log h_t$.
Labels give guidance, $G = e^R$ reward tilting, $G = q_0^(beta - 1)$ annealing.

== Where the error comes from

Three errors and nothing else, because nothing else was approximated:
initialization, score estimation, discretization.
Girsanov turns the drift mismatch into path-space KL,
$op("KL") = integral EE norm(Delta_t)^2 dif t$,
because over one step both laws are Gaussians with equal variance and different means,
so the cost is quadratic in the gap and divided by the noise.
Equal diffusion coefficients are essential:
with different ones the path laws are mutually singular,
since quadratic variation is measurable from a single trajectory.
Marginalization only shrinks KL, so one bounds on paths and harvests at time $T$.

The mismatch splits as wrong function, stale time, stale place,
matching the three errors.
The dimension enters exactly once, through
$EE abs(bar(X)_t - bar(X)_s)^2 lt.tilde n delta + m_2^2 delta^2$,
that is, $n$ Brownian coordinates each wandering.
Assuming a globally Lipschitz score pays $tilde(O)(L^2 n \/ epsilon^2)$,
but $L$ diverges as $t -> 0$, of order $n$ for a separated two-mode mixture.
Following the score along the trajectory instead of bounding it over space
drops the assumption and pays $tilde(O)(n log^2(1 \/ delta) \/ epsilon^2)$,
nearly linear in $n$.

== The manifold hypothesis

Data concentrates near a $d$-dimensional submanifold of $RR^D$ with $d << D$.
It has Lebesgue measure zero, so $q_0$ has no density and no score,
and stopping at $t = delta$ is structural rather than technical.
The forward noise is isotropic in all $D$ directions,
but displacement normal to the manifold is independent of $X_0$,
so the denoising problem is $d$-dimensional:
in the flat model $A(tau) = EE norm(X_0 - m_tau (X_tau))^2 lt.tilde d tau$,
and the curved case matches locally
because the process only explores a radius of order $sqrt(tau)$.

The ambient dimension enters through what the analysis freezes, not through the algorithm.
Freezing the score compares noisy $D$-dimensional vectors and pays $D$.
Freezing the denoised guess and rebuilding the score by Tweedie cancels $x_tau$,
leaving only the movement of the posterior mean.
DDPM already discretizes this way, so only the analysis had to change.

$M_tau = m_tau (X_tau)$ is a martingale in the direction of decreasing noise,
since $X_0 -> X_tau -> X_(tau')$ is Markov and the tower property applies.
The residual $X_0 - M_tau$ is orthogonal to every function of $(X_tau, X_(tau'))$,
so Pythagoras gives $EE norm(M_tau - M_(tau'))^2 = A(tau') - A(tau)$,
the same identity as nested finite element spaces, and a difference telescopes over the grid.
Hence $tilde(O)(d \/ epsilon^2)$,
with $D$ surviving only inside a logarithm through the initialization term.

== Discrete state spaces

Discrete data has no vector structure,
so gradients and Brownian motion are unavailable.
On the Boolean cube $Omega = {0,1}^d$, write $sigma_i (x)$ for flipping bit $i$.
What the theory actually needed was never differential:
a forward process converging to something samplable,
a generator, an adjoint, a stationary measure, a time reversal.
Those are Markov notions, and a continuous-time Markov chain has all of them,
with the generator a rate matrix,
$
  (cal(L) g)(x) = sum_y cal(L)(x,y)(g(y) - g(x)),
$
differences over neighbors instead of derivatives.
Forward, each coordinate flips at rate $1 \/ 2$, so
$(cal(L)_t g)(x) = 1/2 sum_i (g(sigma_i (x)) - g(x))$
and $X_t = X_0 xor xi_t$ with flip probability $(1 - e^(-t)) \/ 2$,
converging to the uniform measure,
which plays the role of $cal(N)(0, I)$ and satisfies $cal(L)^* pi = 0$.
Only $grad log q_t$ genuinely breaks.

== The exterior calculus reading

On the analytic side the whole subject sits inside exterior calculus.
Densities are $n$-forms, functions $0$-forms, the flux an $(n-1)$-form,
and the continuity equation is $partial_t rho + dif J = 0$
with the divergence theorem as Stokes.
The score is a $1$-form, obtained as the differential of a log density ratio,
and $a$ raises its index,
which is why the score never appears without $a$ in front of it.
The pathwise side is not geometric unless one moves to Stratonovich.
