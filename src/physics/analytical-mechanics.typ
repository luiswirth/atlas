#import "/setup.typ": *
#show: note

= Analytical Mechanics

Analytical mechanics is concerned with the analytical description of mechanical systems.
It uses different formulations to describe how particle systems move,
and the total energy is always $E = cal(K) + cal(V)$.

== The two spaces

Configuration space, also coordinate space, is the space of all coordinates of a system.
Phase space is the space describing the whole system,
consisting of both the coordinates and the momenta,
$avec(x)^(2M) = (avec(q)^M, avec(p)^M)^transp$,
and it is the microstate space.

The time evolution of the system is a curve in configuration space, called a trajectory,
and a curve in phase space, called an orbit.

== The three formulations

Newtonian mechanics works in Cartesian coordinates only.
Given a force field it gives a differential equation,
$
  dot(avec(p)) = m dot.double(avec(r)) = avec(F)(avec(r)),
$
and if the force field is conservative, hence rotation-free,
a potential exists with $avec(F) = -nabla V$.

Lagrangian mechanics uses generalized coordinates $avec(q)^M = (q_1, dots, q_M)^transp$,
where $M$ is the number of degrees of freedom, usually $M = 3N$.
With
$
  cal(L)(avec(q), dot(avec(q))) = cal(K)(avec(q), dot(avec(q))) - cal(V)(avec(q)),
$
the equations of motion are, for every $m$,
$
  dif/(dif t) (partial cal(L))/(partial dot(q)_m) = (partial cal(L))/(partial q_m).
$

Hamiltonian mechanics additionally introduces generalized conjugate momenta
$avec(p)^M = (p_1, dots, p_M)^transp$.
With
$
  cal(H)(avec(q), avec(p)) = cal(K)(avec(q), avec(p)) + cal(V)(avec(q)),
$
the equations of motion are, for every $m$,
$
  (partial cal(H))/(partial p_m) = dot(q)_m, quad quad (partial cal(H))/(partial q_m) = -dot(p)_m.
$

== What quantum mechanics replaces

The concept of a phase-space orbit is replaced by the wave function $Psi(avec(r)^N, t)$,
a complex amplitude on configuration space normalized by $integral abs(Psi)^2 = 1$.
Planck's constant is the smallest possible non-zero action,
and classical mechanics breaks down close to it.
