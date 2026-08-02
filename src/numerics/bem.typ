#import "/setup.typ": *
#show: note

#let G = $cal(G)$
#let d_n = $partial_bold(n)$
#let Omega = $Omega$
#let dOmega = $partial Omega$
#let Gamma = $Gamma$

= Boundary Element Method

== The Nature of BEM

=== I. The Core Philosophy: Holography & Causality

==== 1. The Holographic Principle (The "Window")
- *Realization:* The boundary is not a container; it is an *Information Gateway*.
- *The Nature:* The boundary has "measure zero" (no thickness or volume). It cannot store energy itself; it acts purely as a transmitter. It is a window where the "shadows" of the outside world (boundary conditions) meet the "projections" of the inside world. The entire 3D physics of the volume is encoded on this 2D surface.

==== 2. Source Causality & Extinction
- *Realization:* Fields are always created by *Volume Sources*, even if those sources are hidden behind the boundary.
- *The Perspective:*
  - *From the Inside:* We see Boundary Conditions ($u, partial_n u$) because there are sources in the exterior universe casting their influence onto our window.
  - *From the Outside:* If we assume there are *no* sources inside the object, then the boundary conditions (as seen from the outside) must effectively cancel out to produce zero field. The boundary sources we calculate are exactly the ones required to "mimic" the void—creating the correct field on one side while ensuring perfect cancellation (extinction) on the side where no sources exist.

==== 3. Cauchy Data is "Overdetermined"
- *Realization:* In equilibrium (Elliptic) physics, the "State" ($u$) and the "Flux" ($partial_n u$) are rigidly locked together.
- *The Goal:* Standard BVPs only give one half of the data (e.g., Dirichlet). The sole purpose of BEM is to reconstruct the *Missing Half*. Once you have the full pair (Cauchy Data), you hold the "DNA" of the solution and can reconstruct the field anywhere using the Representation Formula.

=== II. The Physical Machinery: Charges & Dipoles

==== 4. Physical Interpretation of Layers
- *Realization:* The mathematical operators correspond directly to physical distributions of charge.
  - *Single Layer ($V$):* Corresponds to *Surface Point Charges*.
    - _Input:_ Mathematically, it takes *Flux* (Neumann trace) as input. This is natural because flux $partial_n u$ is proportional to surface charge density $sigma$.
  - *Double Layer ($K$):* Corresponds to *Surface Dipoles*.
    - _Input:_ Mathematically, it takes *Potential* (Dirichlet trace) as input. This is natural because a layer of dipoles creates a "step" or jump in potential, so the potential value describes the dipole strength.

==== 5. Geometric Self-Interaction
- *Realization:* The Double Layer operator ($K$) measures *Curvature*.
  - On a flat infinite plane, $K$ vanishes (dipoles don't "see" neighbors on the same flat wall).
  - On a curved boundary, $K$ calculates the "background echo"—how much the boundary "illuminates" itself due to its shape.

=== III. The Mathematical Mechanics: Regularity & Operators

==== 6. Integration vs. Differentiation (The $H^s$ Ladder)
- *Realization:* Operators are mechanisms that move functions up or down the "ladder" of smoothness (Sobolev spaces $H^s$).
  - *$V$ (Single Layer):* Acts as *Integration*. It maps rough inputs (Flux, $H^(-1/2)$) to smooth outputs (Potential, $H^(1/2)$), adding $+1$ to the regularity index.
  - *$W$ (Hypersingular):* Acts as *Differentiation*. It maps smooth inputs (Potential, $H^(1/2)$) to rough outputs (Flux, $H^(-1/2)$), taking away $-1$ from the regularity index.

==== 7. The "Sandwich" of Solvability
- *Realization:* To guarantee a unique, stable solution (Lax-Milgram), an operator must be sandwiched between two bounds:
  - *Upper Bound (Continuity):* Ensures the operator doesn't explode to infinity.
  - *Lower Bound (Ellipticity/Coercivity):* Ensures the operator doesn't collapse to zero energy.

==== 8. The 2D Map of Singularities
- *Realization:* Regularity is defined by two axes: *Smoothness* ($s$, derivatives) and *Integrability* ($p$, decay).
  - Standard functions live on the "main floor."
  - Singular objects like $1/x^2$ live in the "basement" of Distributions (negative $s$) because they fail the integrability test ($L^1$) for functions.

=== IV. The Strategy: Solving the Problem

==== 9. The Calderón Projector (The "Validator")
- *Realization:* This matrix operator $cal(C)$ acts as a filter for physical reality.
  - It takes *any* pair of boundary data and projects it onto the "nearest" valid physical solution (in the energy norm).
  - Solving a BVP is mathematically equivalent to finding a vector that lies in the *Range of the Calderón Projector* while matching your prescribed boundary conditions.

==== 10. Stability of "Identity + Compact"
- *Realization:* Engineers prefer *Indirect Methods* (using an ansatz for a fictitious density) because they lead to *Fredholm Second Kind* equations.
  - These take the form *Identity + Compact Operator* ($I + K$).
  - The "Identity" provides a stable diagonal, and the "Compact" part ensures eigenvalues cluster nicely. This makes numerical inversion fast and stable, avoiding the "roughening" instability of the Direct Method's Hypersingular operator.

=== V. The Discretization: From Theory to Computation

==== 11. The Saturation Phenomenon (The "Taylor Limit")
- *Realization:* Smoother inputs do not always yield better answers. Convergence speed is limited by the *Polynomial Degree ($p$)* of your elements, not just the smoothness ($s$) of the solution.
- *The Intuition:*
  - *Piecewise Constants ($p=0$):* Saturate at *$s=1$* ($H^1$). They can capture value but fail to capture *Slope*. Even if the function has curvature ($H^2$), the element is stuck fighting the slope error.
  - *Piecewise Linears ($p=1$):* Saturate at *$s=2$* ($H^2$). They can capture slope but fail to capture *Curvature*. Even if the function has changing curvature ($H^3$), the element is stuck fighting the curvature error.
- *The Rule:* The convergence rate is governed by the "weakest link" formula: $mu = min(p+1, s) - m$ (Bramble-Hilbert).

==== 12. The Ancestry of Boundary Elements (Traces of Volume)
- *Realization:* The discrete boundary spaces we use are not arbitrary; they are the "shadows" (traces) of standard 3D Finite Elements.
  - *Dirichlet ($S^0_1$):* Is the trace of *Nodal Elements* ($H^1$ conformal). It preserves continuity because potentials are continuous 0-forms.
  - *Neumann ($S^(-1)_0$):* Is the trace of *Raviart-Thomas Elements* ($H("div")$ conformal). It preserves "normal continuity" (flux conservation) because fluxes are 2-forms.

==== 13. The Geometric Nature of Flux (The Hodge Star)
- *Realization:* We use $H("div")$ and Raviart-Thomas elements because *Flux is a 2-form*, not a 1-form.
  - While the Gradient ($nabla u$) is a 1-form (line-integrated), the *Hodge Star* operator ($star$) transforms it into a 2-form (surface-integrated) to create physical flux.
  - The *Neumann Trace* is the geometric "pullback" of this 2-form to the boundary, which physically manifests as the normal component $bold(v) dot bold(n)$.

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

=== 2. Representation Formula

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
CPV symmetry (odd function cancellation) ensures existance of limit.
result: average of interior and exterior limits (half the jump).

== Boundary Integral Operatos

Take limit of representation formula moving to the boundary.
Replace layer potentials with layer operators.

$
  V(partial_n u) = (sigma + K) u
$
with $sigma = 1/2$
Fredholm integral equation of first kind

== Boundary Elements

Mesh Boundary.

Use discontinious piecewise-constant function space.
$S^(-1)_0 (Gamma)$

- Collocation Method:
  Enforce equation in collocation points.
  Only one integral.
  Straight-Forward
  Little theory and gurantees.
- Galerkin Method:
  Enforce equation in average sense.
  Form L^2 inner product with test function
  Introduces second integral
  S.p.d.
  Good convergence theory

=== 3. Calderón Identities

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

=== 4. Boundary Integral Operators

$
  V  &:= T_D   Psi_"SL": H^(-1/2)(Gamma) -> H^(+1/2)(Gamma) \
  W  &:= -T_N   Psi_"DL": H^(+1/2)(Gamma) -> H^(-1/2)(Gamma) \
  K  &:= {T_D} Psi_"DL": H^(+1/2)(Gamma) -> H^(+1/2)(Gamma) \
  K' &:= {T_N} Psi_"SL": H^(-1/2)(Gamma) -> H^(-1/2)(Gamma) \
$

=== 5. Regularization of W

$
  W = -scurl_Gamma compose V compose curl_Gamma
$

In weak form for the variational formulation:
$ chevron.l W u, v chevron.r = chevron.l curl_Gamma v, V curl_Gamma u chevron.r $
