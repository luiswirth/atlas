#set page(
  margin: 1cm,
  paper: "a4"
)
#set text(
  font: "New Computer Modern Sans",
  size: 10pt,
  lang: "en"
)

#let fgcolor = black
#let bgcolor = white

#set text(fill: fgcolor)
#set page(fill: bgcolor)

#let weblink(..args) = text(
  fill: blue,
  link(..args)
)


#let avec(a) = math.bold(a)
#let grad = avec(math.op("grad"))
#let curl = avec(math.op("curl"))
#let scurl = math.op("curl")
#let div = math.op("div")
#let G = $cal(G)$
#let d_n = $partial_bold(n)$
#let Omega = $Omega$
#let dOmega = $partial Omega$
#let Gamma = $Gamma$

= Fundamental Solution

$ Delta_y G(x,y) = delta(x-y) $

$ G^Delta (x,y) = 1/(4 pi) 1/norm(x-y) quad Omega = RR^3 $
$ G^Delta (x,y) = -1/(2 pi) log norm(x-y) quad Omega = RR^2 $

= Newton Potential

$

$

== Green's Formulas

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

= Representation Formula

Use Green's 2nd formula with $v = G^L(x,y)$
and use $L Delta_y G^L (x,y) = delta (x-y)$ and $L u = 0$

$
  u(x) = -integral_Gamma u(y) partial_(n,y) G^L (x,y) dif S_y + integral_Gamma G^L (x,y) partial_n u(y) dif S_y
  = -(Psi^L_"DL" u)(x) + (Psi^L_"SL" (partial_avec(n) u))(x)
$

Dirichlet Data $u(y)$, and
Neumann Data $partial_avec(n) u(y)$
appears.


== 2. Representation Formula

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

= Traces

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

= Layer Potentials

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

= Layer Operators

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


= Boundary Integral Operatos

Take limit of representation formula moving to the boundary.
Replace layer potentials with layer operators.

$
  V(partial_n u) = (sigma + K) u
$
with $sigma = 1/2$
Fredholm integral equation of first kind

= Boundary Elements

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



== 3. Calderón Identities

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

== 4. Boundary Integral Operators

$
  V  &:= T_D   Psi_"SL": H^(-1/2)(Gamma) -> H^(+1/2)(Gamma) \
  W  &:= -T_N   Psi_"DL": H^(+1/2)(Gamma) -> H^(-1/2)(Gamma) \
  K  &:= {T_D} Psi_"DL": H^(+1/2)(Gamma) -> H^(+1/2)(Gamma) \
  K' &:= {T_N} Psi_"SL": H^(-1/2)(Gamma) -> H^(-1/2)(Gamma) \
$

== 5. Regularization of W

$
  W = -scurl_Gamma compose V compose curl_Gamma
$

In weak form for the variational formulation:
$ angle.l W u, v angle.r = angle.l curl_Gamma v, V curl_Gamma u angle.r $
