#import "/src/setup.typ": *
#show: note

= Statistical Mechanics

Statistical mechanics derives thermodynamic rules from statistical arguments
about analytical mechanics for a huge number of particles.

== Microstate, macrostate, ensemble

A microstate is a microscopic specification of a system,
containing all information about its state.
Classically it is a phase space point $avec(x)^(2N) = [avec(r)^N, avec(p)^N]$,
quantum mechanically a wave function.
Either way it involves zillions of parameters.

A macrostate is a macroscopic specification,
containing just enough information to describe the system macroscopically,
usually a triplet such as $(N, P, T)$.

An ensemble is a hypothetical construct of $K$ macroscopically identical
but microscopically different systems, in the limit $K -> oo$.
The systems are in equilibrium, so the ensemble is time-independent,
and the ensemble as a whole represents one macrostate.
Constraints are imposed to ensure the microstates are compatible with it.

== Assignments and populations

Consider assigning $M$ states to $K$ systems,
a map $m: {1, dots, K} -> {0, dots, M-1}$ read as an assignment vector,
of which there are $N_"ass" = M^K$.

Consider instead the populations, a map $n: {0, dots, M-1} -> NN$
counting how many systems occupy each state, subject to $sum_m n_m = K$,
read as a population vector, of which there are
$
  N_"dis" = binom(K+M-1, K).
$

There is a natural map from assignments to populations,
and it is far from injective, since it reduces dimension.
For that reason it is a projection,
and the statistical weight
$
  W_K (avec(n)) = (K!)/(product_(m=0)^(M-1) n_m !)
$
counts how many assignments correspond to the same population.

== Entropy is the weight of a projection

The general form of the same statement.
There is a high-dimensional microstate space and a low-dimensional macrostate space,
with a projection $Q$ between them.
Because it lowers dimension, many microstates collapse onto one macrostate,
and the weight of a macrostate under $Q$ counts them,
$
  Omega_Q (avec(M)) = C integral delta(Q(avec(m)) - avec(M)) dif avec(m).
$
The entropy with respect to that projection is
$
  S_Q (avec(M)) = k_B ln Omega_Q (avec(M)).
$
Entropy is therefore not a property of the system alone but of the projection chosen,
and every coarse-graining carries its own.
