#import "/setup.typ": *
#show: note

= Fluid Dynamics

== The two views

In the Lagrangian view a single fluid particle $p$ is described by time-parametric functions:
the trajectory by the position function $avec(xi)_p (t)$,
the velocity by $avec(u)_p = dot(avec(xi))_p$
and the acceleration by $avec(a)_p = dot.double(avec(xi))_p$,
and in general any fluid property $psi_p (t)$ is such a parametrization.

All particle trajectories at once are one function
$
  avec(xi)(t; avec(x)_0, t_0) eq.triple avec(xi)_p (t),
$
since every particle is uniquely specified by a position and time pair $(avec(x)_0, t_0)$,
and any fluid property carries along trajectories in the same way.

In the Eulerian view we do not follow individual particles
but describe the motion by a velocity field $avec(u)(avec(x), t)$,
and any fluid property by a field $psi(avec(x), t)$.

=== Switching views

Given a Lagrangian trajectory function, one can sometimes derive the Eulerian velocity field
by expressing the Lagrangian velocity
$avec(u)(t; avec(x)_0, t_0) = dif/(dif t) avec(xi)(t; avec(x)_0, t_0)$
as a function of $avec(xi)$ instead, and then setting
$avec(u)(avec(x), t) := avec(u)(avec(xi), t)$ with $avec(x) = avec(xi)$.

The other direction uses the flow map, the evolution operator of the pathline ODE,
$
  cases(
    dot(avec(xi))(t) = avec(u)(avec(xi), t),
    avec(x)(0) = avec(x)_0
  )
  quad <==> quad
  avec(xi)(t) = amat(Phi)^t avec(x)_0.
$
If the flow is stationary rather than transient, the ODE is autonomous.

=== Distinguished lines

A pathline is the trajectory of a fluid particle,
what the Lagrangian view studies,
the solution of the initial value problem of the pathline ODE.

A streamline is a line $avec(x)_s$ parallel to the velocity field at a fixed time $t$,
so streamlines change with time,
$
  (dif avec(x)_s)/(dif s) = avec(u)(avec(x)_s, t)
  quad <==> quad
  dif avec(x) times avec(u) eq.triple 0
  quad <==> quad
  (dif x)/u = (dif y)/v = (dif z)/w.
$

A streakline is the set of positions of all particles
that went through a common reference point.
A smoke probe generates one.

== The material derivative

$
  (D avec(phi))/(D t) := (partial avec(phi))/(partial t) + (avec(u) dot nabla) avec(phi).
$
The local derivative captures the time evolution of the field,
and the convective derivative captures the change as the particle moves through the field,
where $avec(u) dot nabla eq.triple norm(u) partial_avec(u)$ is a scaled directional derivative.

The material derivative is what relates the two views.
For acceleration,
$
  avec(a)_p (t) = (dif avec(u)_p)/(dif t)(t) = (D avec(u))/(D t)(avec(xi)_p (t), t).
$

== Reynolds transport theorem

A statement about the time derivative of an integral over a moving volume.
Given a volume $tilde(V)(t)$ moving with the velocity field $avec(u)$
and its boundary with outward normal field $avec(n)$,
$
  dif/(dif t) integral_(tilde(V)(t)) psi dif avec(x)
  = integral_(tilde(V)(t)) (partial psi)/(partial t) dif avec(x)
  + integral_(partial tilde(V)(t)) psi (avec(u) dot avec(n)) dif avec(x).
$

== Stream function

An incompressible flow can be described by a vector-valued stream function,
defined so that its curl is the velocity field,
$
  avec(u) = curl avec(Psi).
$
Such a field satisfies the incompressibility condition automatically,
since $div curl avec(Psi) = 0$.
In two dimensions $avec(u) = ((dif avec(Psi))/(dif y), -(dif avec(Psi))/(dif x))^transp$.

Along streamlines $avec(Psi)$ is constant.
The volume flux between two streamlines is the difference of the stream function,
$avec(j)_V = avec(Psi)_2 - avec(Psi)_1$,
and the mass flux is $avec(j)_m = rho b (avec(Psi)_2 - avec(Psi)_1)$
with $b$ the width of the fluid layer.

== The universally valid equations

Mass conservation, the continuity equation,
$
  (partial rho)/(partial t) + nabla dot (rho avec(u)) = 0.
$
Momentum conservation, the Cauchy momentum equation,
$
  rho (D avec(u))/(D t) = -nabla p + rho avec(f) + nabla dot amat(tau).
$
Energy conservation,
$
  (D E)/(D t) = -1/rho nabla dot avec(q) - p (D avec(v))/(D t) + 1/rho amat(tau) : amat(nabla u).
$

An incompressible fluid has $rho$ constant, an incompressible flow has $div avec(u) = 0$,
and an inviscid fluid has $mu = 0$.

== Navier-Stokes and the Reynolds number

$
  rho (D avec(u))/(D t) = rho avec(f) - nabla p + mu Delta avec(u),
$
which non-dimensionalizes with
$avec(x)^* = avec(x) \/ L$, $t^* = U t \/ L$, $avec(u)^* = avec(u) \/ U$
and $p^* = (p - P) \/ (rho U^2)$ into
$
  (D avec(u)^*)/(D t^*) = -nabla_(avec(x)^*) p^* + "Re"^(-1) Delta avec(u)^*.
$

The Reynolds number is the ratio of the convective to the viscous term,
equivalently of inertia to viscous force,
$
  "Re" = (rho (D avec(u))/(D t))/(mu Delta avec(u))
  = (rho U^2 \/ L)/(mu U \/ L^2) = (rho U L)/mu = (U L)/nu.
$

For $"Re" -> oo$ the flow is inviscid and turbulent,
with $U$ and $L$ large and $nu$ tiny,
and Navier-Stokes becomes the Euler equation
$
  (D avec(u)^*)/(D t^*) = -nabla_(avec(x)^*) p^*.
$

For $"Re" -> 0$ the flow is creeping and laminar,
with $U$ and $L$ tiny and $nu$ large,
and Navier-Stokes becomes the Stokes equation
$
  nabla_(avec(x)^*) p^* = Delta avec(u)^*,
$
which is linear and has analytic solutions.
For creeping flow around a sphere of radius $a$ the drag force comes out as
$F_D = 6 pi mu a U$.
