#import "/setup.typ": *
#show: note

= Thermodynamics

Thermodynamics relates heat to other forms of energy in macroscopic systems.
A thermodynamic system is a part of space of interest, separated by a boundary
from its environment, and a process is an evolution from a starting state to an end state
along a specified path.
Only equilibrium states are connected, and the time a process takes does not matter.

The subject characterizes three things:
how the variables of a system at equilibrium are connected to each other,
in which direction a process occurs spontaneously,
and what the system exchanges with its environment during a process.

Work is an organized form of energy exchange, involving coherent macroscopic forces.
Heat is a disorganized one, involving incoherent microscopic forces.

== State functions

The state of a system is characterized by a state vector $avec(Z)$,
a minimal set of variables unambiguously fixing the macroscopic state at a given time.
Once the independent variables are chosen,
every other macroscopic property is a state function $F(avec(Z))$.

The differential of a state function is always a total differential,
$
  dif F = sum_(i=1)^N (partial F)/(partial Z_i) dif Z_i,
$
and its partial derivatives are state functions again.
A single term of that sum,
$
  delta F_i = ((partial F)/(partial Z_i))_({Z_j}_(j != i)) dif Z_i,
$
is not.
That distinction between $dif$ and $delta$ is the whole bookkeeping of the subject.

An equation of state connects the state variables for a given type of system,
for instance $V(n, p, T) = n R T \/ p$ for a single-component ideal gas.

== Contacts and conjugate pairs

When two systems are brought into contact,
they spontaneously exchange the associated quantity $delta q$,
which flows from high to low potential,
until the corresponding potential no longer changes, $dif Phi = 0$,
and is the same on both sides.

#table(
  columns: 6,
  inset: 5pt,
  align: left,
  [contact], [exchanged $delta q$], [potential $Phi$], [forbidden], [allowed], [equilibrium],
  [mechanical], [volume work $delta W_v$], [pressure $P$], [isochoric], [diaerg], [isobaric],
  [thermal], [heat $delta Q$], [temperature $T$], [adiabatic], [diatherm], [isothermal],
  [physical], [diffusive matter $delta_d n$], [chemical potential $mu$], [closed], [open], [grand],
  [chemical], [chemical matter $delta_c n$], [chemical potential $mu$], [inactive], [active], [equichemical],
  [electrical], [non-volume work $delta W_n$], [electrical potential $phi$], [uncoupled], [coupled], [isoergonic],
)

Intensive and extensive quantities come in conjugate pairs
related by the Legendre transform, the intensive one being the potential of the extensive one,
$
  T = +(partial U)/(partial S), quad quad P = -(partial U)/(partial V), quad quad mu = +(partial U)/(partial N).
$

== The first law

For a closed system there exists an extensive state function, the internal energy $U$,
whose total differential is the sum of the supplied work and the supplied heat,
$
  dif U = delta W + delta Q.
$
A total and therefore path-independent differential stands on the left,
two path-dependent ones on the right,
and for a cyclic process $dif U = 0 = delta W + delta Q$.

== The second law

There exists an extensive state function, the entropy $S$,
whose total differential in a closed system is the supplied heat over the absolute temperature,
increased by an internal entropy production $delta Sigma >= 0$,
$
  dif S = (delta Q)/T + delta Sigma.
$
A reversible process has $delta Sigma = 0$, a spontaneous and irreversible one $delta Sigma > 0$,
and $delta Sigma < 0$ is unnatural and not observed.

Writing $I := integral (delta Q) \/ T$, a reversible path gives $Delta S = I_"rev"$,
so $I$ is path-independent there,
while an irreversible one gives $Delta S = I_gamma + Sigma_gamma$,
where both terms may be path-dependent.
Together,
$
  Delta S = I_"rev" = I_"irrev" + Sigma_"irrev", quad quad Sigma >= 0.
$
For an isolated system $dif S = delta Sigma$, zero if reversible and positive otherwise.
Local decreases of entropy are possible only at the cost of an equal or bigger increase
in the environment.

For a periodic process the entropy change over a cycle vanishes,
so $I_"rev" = 0$ and $I_"irrev" = -Sigma_"irrev"$,
and since $Sigma >= 0$ a machine must have $I_"irrev" <= 0$.
A closed machine in contact with a single heat reservoir
that takes in heat and converts it into work would need $I_"irrev" = Delta Q \/ T > 0$,
which is forbidden.
That machine is the perpetuum mobile of the second kind, and it is impossible.
