#import "/setup.typ": *
#show: note

= Continuity Equation

$partial_t rho = -div avec(J)$ with $avec(J) = rho avec(v)$ is the local form of conservation,
and $integral div avec(J) = 0$ gives preservation of probability for free.
Only $div avec(J)$ is determined, which is the gauge freedom
behind same marginals with different paths.
Eulerian is the PDE, Lagrangian the ODE,
and the density is the pushforward under the flow map.

The heat equation is this with $avec(J) = -grad q$,
so its velocity is $avec(J) \/ q = -grad log q$:
the score is the diffusive flux per unit density,
and the logarithm is the division by $q$.
In general $avec(v) = avec(b) - grad log q$.

What probability adds over the fluid picture is the path law.
Noise buys distributional targets from local information, which is why MCMC exists,
whereas the ODE has to know $q$ instead.
Determinism gains invertibility and exact likelihood,
and loses path functionals and the forgetting of errors.
Linearity of Fokker-Planck in $q$ is the independence of the particles.

== Measures, densities, KL

A measure assigns numbers to sets,
a density represents it relative to a reference, $rho = dif mu \/ dif x$,
and exists exactly under absolute continuity.
Allowing distributional densities gains nothing,
since every measure already is a distribution.
What fails is the nonlinear operations,
and $grad log q$ is nonlinear in the density,
which is why data on a manifold has no score
and every theorem stops at $t = delta$.

Bayes in its general form is a change of measure,
$dif pi \/ dif pi_0 = L \/ Z$ with $Z = integral L dif pi_0$:
reweight by a nonnegative function and renormalize.
Conditioning on an event is the case $L = bb(1)_B$,
and the density form is the case where both measures have densities.
The joint is the primitive object and conditioning is disintegrating it.

$op("KL")(p bar.double q) = EE_p [log(p \/ q)]$ is the expected log-likelihood ratio,
hence the exponential rate at which samples distinguish the two.
Girsanov produces the Radon-Nikodym derivative of two path laws
and KL is its expected logarithm, so nothing conceptually new happens there.
It is asymmetric, infinite without absolute continuity, and
$
  op("KL")(cal(N)(m_1, sigma^2 I) bar.double cal(N)(m_2, sigma^2 I)) = norm(m_1 - m_2)^2 \/ (2 sigma^2).
$
It is used through nonnegativity, data processing,
additivity over independent components, and Pinsker.
