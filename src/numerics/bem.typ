#import "/setup.typ": *
#show: note

#let G = $cal(G)$
#let d_n = $partial_bold(n)$
#let Omega = $Omega$
#let dOmega = $partial Omega$
#let Gamma = $Gamma$

= Boundary Element Method

== The Nature of BEM

=== The boundary as a window

The boundary is not a container, it is an information gateway.
It has measure zero, no thickness and no volume,
so it cannot store energy itself and acts purely as a transmitter.
It is a window where the boundary conditions of the outside world
meet the projections of the inside world,
and the entire 3D physics of the volume is encoded on this 2D surface.

=== Source causality and extinction

Fields are always created by volume sources,
even when those sources are hidden behind the boundary.
From the inside, the boundary conditions $u$ and $partial_n u$ are seen
because sources in the exterior cast their influence onto the window.
From the outside, assuming no sources inside the object,
the same boundary conditions must cancel out to produce zero field.
The boundary sources one computes are exactly the ones required to mimic the void:
they create the correct field on one side
while ensuring perfect cancellation, extinction, on the side where no sources exist.

=== Cauchy data is overdetermined

In equilibrium (elliptic) physics, the state $u$ and the flux $partial_n u$ are rigidly locked together.
A standard BVP prescribes only one half of the pair,
and the sole purpose of BEM is to reconstruct the missing half.
The full Cauchy pair then reconstructs the field anywhere through the representation formula.

=== Layers as charges and dipoles

The operators correspond directly to physical distributions of charge.
The single layer $V$ corresponds to surface point charges
and takes the flux (Neumann trace) as input,
which is natural because $partial_n u$ is proportional to the surface charge density $sigma$.
The double layer $K$ corresponds to surface dipoles
and takes the potential (Dirichlet trace) as input,
which is natural because a layer of dipoles creates a jump in potential,
so the potential value describes the dipole strength.

=== The double layer measures curvature

On a flat infinite plane $K$ vanishes: dipoles do not see neighbors on the same flat wall.
On a curved boundary $K$ measures how much the boundary illuminates itself through its shape.

=== The Sobolev ladder

Operators move functions up or down the ladder of smoothness.
The single layer $V$ acts as integration:
it maps rough flux in $H^(-1/2)$ to smooth potential in $H^(1/2)$,
adding $+1$ to the regularity index.
The hypersingular operator $W$ acts as differentiation and takes $-1$ away.

Regularity has two axes, smoothness $s$ and integrability $p$.
Objects like $1/x^2$ fail the $L^1$ test and sit at negative $s$,
among the distributions rather than among the functions.

=== Solvability

A unique and stable solution (Lax–Milgram) requires the operator to be sandwiched between two bounds:
continuity from above, so it does not explode to infinity,
and ellipticity from below, so it does not collapse to zero energy.

=== The Calderón projector

The matrix operator $cal(C)$ acts as a filter for physical reality.
It takes any pair of boundary data and projects it onto the nearest valid physical solution,
in the energy norm.
Solving a BVP is equivalent to finding a vector in the range of the Calderón projector
matching the prescribed boundary conditions.

=== Stability of identity plus compact

Indirect methods, using an ansatz for a fictitious density,
lead to Fredholm equations of the second kind,
of the form identity plus compact operator, $I + K$.
The identity provides a stable diagonal and the compact part clusters the eigenvalues,
which makes numerical inversion fast and stable
and avoids the roughening instability of the direct method's hypersingular operator.

=== Saturation

Smoother inputs do not always yield better answers.
The convergence speed is limited by the polynomial degree $p$ of the elements,
not just by the smoothness $s$ of the solution.
Piecewise constants ($p = 0$) saturate at $s = 1$:
they capture value but not slope,
and even where the function has curvature the element is stuck fighting the slope error.
Piecewise linears ($p = 1$) saturate at $s = 2$ for the same reason one degree up.
The rate is governed by the weakest link, $mu = min(p+1, s) - m$ (Bramble–Hilbert).

=== Boundary elements as traces of volume elements

The discrete boundary spaces are not arbitrary, they are the traces of standard 3D finite elements.
The Dirichlet space $S^0_1$ is the trace of nodal ($H^1$-conforming) elements
and preserves continuity because potentials are continuous 0-forms.
The Neumann space $S^(-1)_0$ is the trace of Raviart–Thomas ($H(div)$-conforming) elements
and preserves normal continuity, flux conservation, because fluxes are 2-forms.

That flux is a 2-form is the reason for $H(div)$ in the first place.
The gradient $grad u$ is a 1-form, integrated along lines,
and the Hodge star turns it into a 2-form, integrated over surfaces, which is the physical flux.
The Neumann trace is the pullback of that 2-form to the boundary,
manifesting as the normal component $bold(v) dot bold(n)$.

== Fundamental Solution

$ Delta_y G(x,y) = delta(x-y) $

$ G^Delta (x,y) = 1/(4 pi) 1/norm(x-y) quad Omega = RR^3 $
$ G^Delta (x,y) = -1/(2 pi) log norm(x-y) quad Omega = RR^2 $

== Newton Potential

$

$

=== Green's Formulas

Product rule for divergence with scalar field times vector field.
$ div(bold(j) v) = (div bold(j)) v + bold(j) dot grad v $

Integrate and use Divergence Theorem:
$ integral_dOmega (bold(j) dot bold(n))v dif S(x) = integral_Omega (div bold(j)) v dif x + integral_Omega bold(j) dot grad v dif x $

*First Green's Formula* \
Set $bold(j) := grad(u)$
$ integral_dOmega (grad u dot n)v dif S(x) = integral_Omega (Delta u) v dif x + integral_Omega grad u dot grad v dif x $

*Second Green's Formula* \
Subtract swapped version from normal version.
$ integral_Omega (u Delta v - v Delta u) dif x = integral_dOmega (u T_n v - v T_n u) dif s $

== Representation Formula

Use Green's 2nd formula with $v = G^L(x,y)$
and use $L Delta_y G^L (x,y) = delta (x-y)$ and $L u = 0$

$
  u(x) = -integral_Gamma u(y) partial_(n,y) G^L (x,y) dif S_y + integral_Gamma G^L (x,y) partial_n u(y) dif S_y
  = -(Psi^L_"DL" u)(x) + (Psi^L_"SL" (partial_avec(n) u))(x)
$

Dirichlet Data $u(y)$, and
Neumann Data $partial_avec(n) u(y)$
appears.

=== Representation Formula

Let $u$ be harmonic ($Delta u = 0$). Let $v(x) = G(x,y)$ be the fundamental solution satisfying $-Delta_x G(x,y) = delta_y(x)$.
Substitute into Second Green's Identity:
$ integral_Omega (u(x)(-delta_y(x)) - 0) dif x = integral_dOmega (u(x) d_n G(x,y) - G(x,y) d_n u(x)) dif s_x $

The LHS evaluates to $-u(y)$. Multiplying by $-1$:
$ u(y) = integral_dOmega G(x,y) d_n u(x) dif s_x - integral_dOmega d_n G(x,y) u(x) dif s_x $

We define the Layer Potentials:
$ (Psi_"SL" psi)(y) &= integral_dOmega G(x,y) psi(x) dif s_x \
  (Psi_"DL" phi)(y) &= integral_dOmega d_n G(x,y) phi(x) dif s_x $

Thus, the representation formula is:
$ u = Psi_"SL"(T_N u) - Psi_"DL"(T_D u) $
where $T_D u = u|_Gamma$ and $T_N u = d_n u|_Gamma$.

== Traces

Norms are defined as infimum of the $H(d; Omega)$ norm of all $C^oo (Omega)$ functions that have this trace.

Dirichlet Trace
$
  (T_D u)(x) := lim_(x' -> x) u(x')
  quad x in Gamma, x' in Omega
$

Dirichlet Trace Space
$
  H^(1/2) Gamma = T_D H^1 (Omega) subset L^2 (Gamma)
$

$
  T_D: H^1 (Omega) -> H^1/2 (Gamma)
$

Normal Trace (for vector fields)
$
  (T_n u)(x) := lim_(x' -> x) n(x) dot u(x')
  quad x in Gamma, x' in Omega
$

Neumann Trace Space
$
  H^(-1/2) Gamma = T_n H (div; Omega) subset L^2 (Gamma)
$

$
  T_n: H (div; Omega) -> H^(-1/2) (Gamma)
$

== Layer Potentials

Produces a function on the whole domain.

Single Layer Potential
(G not diff, u diff)
$
  Psi^L_"SL": H^(-1/2) (Gamma) -> H^1 (Omega)
  \
  (Psi^L_"SL" (partial_avec(n) u))(x) =
  integral_Gamma G^L (x,y) partial_n u(y) dif S_y
$
Surface Point charges.
Potential doesn't jump -> No Dirichlet Jump
But Electric field points in opposite direction -> Neumann Jump

Double Layer Potential
(G diff, u not diff)
$
  (Psi^L_"DL" u)(x)
  integral_Gamma u(y) partial_(n,y) G^L (x,y) dif S_y
$
Surface Dipole charges.
Potential Jumps (like infinitely thin capacitor with finite voltage drop) -> Dirichlet Jump
No Electric Field outside -> No Neumann jump (gradient zero everywhere)

== Layer Operators

Produces a function on only the boundary.

Move layer potentials to boundary.

Single Layer Operator
$
  V: H^(-1/2) (Gamma) -> H^1/2 (Gamma)
$
Coincides with Single Layer Potential on boundary, due to continuity.
The 1st order singularity (1/r) of the Green's function cancels with
the surface element (r dr dphi). Weak singularity. Integral converges absolutely.

Double Layer Operator
$
  lim_(x |-> Gamma) Psi^L_"DL" = (K - 1/2 I)psi
$
Does not coincide with Double Layer Potential on boundary due to jump.
The 2nd order singularity ($(r dot n)/r^3$ of the derivative of the Green's function does NOT cancels with the surface element (r dr dphi).
Strong singularity.
The Fix: Use Cauchy Principal Value (CPV) integral:
Remove $epsilon$-sphere around singularity and let $epsilon -> 0$.
Convergence by geometric argument: As $x->y$ we have $n perp x-y$ therefore $r dot n prop r^2$ lifting the singularity.
CPV symmetry (odd function cancellation) ensures existence of limit.
result: average of interior and exterior limits (half the jump).

== Boundary Integral Operators

Take limit of representation formula moving to the boundary.
Replace layer potentials with layer operators.

$
  V(partial_n u) = (sigma + K) u
$
with $sigma = 1/2$
Fredholm integral equation of first kind

== Boundary Elements

Mesh Boundary.

Use discontinuous piecewise-constant function space.
$S^(-1)_0 (Gamma)$

- Collocation Method:
  Enforce equation in collocation points.
  Only one integral.
  Straight-forward
  Little theory and guarantees.
- Galerkin Method:
  Enforce equation in average sense.
  Form L^2 inner product with test function
  Introduces second integral
  S.p.d.
  Good convergence theory

=== Calderón Identities

Take traces of the representation formula as $y -> Gamma$.

*Dirichlet Trace ($T_D$):*
$Psi_"SL"$ is continuous. $Psi_"DL"$ jumps by $1/2 I$.
$ T_D u = V(T_N u) - (-1/2 I + K)(T_D u) $
$ T_D u = (1/2 I - K) T_D u + V T_N u $

*Neumann Trace ($T_N$):*
$d_n Psi_"SL"$ jumps by $-1/2 I$ (Adjoint DL). $d_n Psi_"DL"$ becomes Hypersingular $W$.
$ T_N u = (1/2 I + K') T_N u - (-W) T_D u $
$ T_N u = W T_D u + (1/2 I + K') T_N u $

*Matrix Form:*
$ vec(T_D u, T_N u) = mat(1/2 I - K, V; W, 1/2 I + K') vec(T_D u, T_N u) $

=== Boundary Integral Operators

$
  V  &:= T_D   Psi_"SL": H^(-1/2)(Gamma) -> H^(+1/2)(Gamma) \
  W  &:= -T_N   Psi_"DL": H^(+1/2)(Gamma) -> H^(-1/2)(Gamma) \
  K  &:= {T_D} Psi_"DL": H^(+1/2)(Gamma) -> H^(+1/2)(Gamma) \
  K' &:= {T_N} Psi_"SL": H^(-1/2)(Gamma) -> H^(-1/2)(Gamma) \
$

=== Regularization of W

$
  W = -scurl_Gamma compose V compose curl_Gamma
$

In weak form for the variational formulation:
$ chevron.l W u, v chevron.r = chevron.l curl_Gamma v, V curl_Gamma u chevron.r $
