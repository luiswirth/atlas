#import "/src/setup.typ": *
#show: note

= Probability is Hilbert Geometry

Random variables are vectors over the index set $Omega$, with inner product $EE[X Y]$,
so the measure is the weight and therefore the metric.
The constants are the subspace of zero information,
which is why $EE[X]$ is the projection onto it.
A sigma-algebra is a partition is a subspace,
and conditional expectation is the orthogonal projection onto it, that is, block averaging.
The tower property is composition of nested projections,
and the law of total variance is Pythagoras.

== Conditional expectation is Galerkin

The defining property $EE[(Y - Z) g(X)] = 0$ for all $g$ is a Galerkin condition,
so conditional expectation is a Galerkin projection:
$V_h$ corresponds to the functions of $X$,
Céa to least squares landing on the conditional mean,
refinement to more information.
A martingale is projection onto an increasing family,
which is why such arguments telescope without cross terms.

== Where the picture stops

It covers the second-order theory only.
Almost sure convergence, tails and $L^1$ conditional expectation need measure theory,
which is why courses build on Radon-Nikodym instead.

$Omega$ carries no linear structure, so random variables are vectors, not covectors.
The genuine duality is functions against measures, $integral f dif mu$,
with the generator on one side and its adjoint on the other,
and $PP$ as the metric identifying them.
Densities are $n$-forms, and Radon-Nikodym a ratio of them.

== The spaces in play

State, noise, time, $Omega$, path space, $L^2(Omega)$, $cal(P)(RR^n)$,
functions and their dual, parameters.
A process is a random variable valued in path space, with law $QQ$,
and $q_t = (pi_t)_\# QQ$ integrates out the positions at all other times.

The family ${q_t}$ does not determine $QQ$:
an SDE and an ODE are distinct points of $cal(P)("path space")$
lying over the same curve in $cal(P)(RR^n)$.
Since KL decreases under marginalization,
one bounds on paths and harvests on marginals.
