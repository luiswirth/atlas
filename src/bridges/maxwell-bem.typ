#import "/src/setup.typ": *
#show: note

= Maxwell and BEM

== The Structure of Electromagnetism

=== Sources

Only two things source EM fields: charge density $rho$ and current density $bold(J)$, bound by the continuity equation $partial_t rho + div bold(J) = 0$. Once you fix $bold(J)(x,t)$, the evolution of $rho$ is determined. So in a real sense, current is the single fundamental source.

There are no magnetic monopoles in our universe (empirical fact: $div bold(B) = 0$). This is the source of the asymmetry between $bold(E)$ and $bold(B)$ in Maxwell's equations.

=== The four regimes

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt,
  inset: 6pt,
  align: left,
  [*Regime*], [*Sources*], [*Fields*],
  [Electrostatics], [Static $rho$], [$bold(E)$ only, Coulombic, $1\/r^2$],
  [Magnetostatics], [Steady $bold(J)$ (neutral)], [$bold(B)$ only, no radiation],
  [Quasistatics], [Slowly varying], [Both, no radiation],
  [Full electrodynamics], [Time-varying], [Both, with radiation],
)

Magnetic field can exist without electric field (steady current in a neutral wire). Electric field can exist without magnetic field (point charge at rest). They are independent in the static limits, coupled by time variation.

=== Radiation

Radiation is energy carried to infinity. Operationally: nonzero Poynting flux through a sphere at infinity. Requires fields falling off as $1\/r$, with $bold(E)$ and $bold(B)$ in phase, perpendicular, equal magnitudes (in natural units).

Static fields fall off as $1\/r^2$ or faster, so no radiation. The time variation of sources is what enables the $1\/r$ tail.

=== Multipoles and dipoles

Localized sources expand in multipoles:

- *Electric monopole*: forbidden as a radiator (charge conservation).
- *Electric dipole* $bold(p) = integral bold(r) rho dif V$: leading-order radiator. Equivalent to a point current element $bold(J) = bold(p) delta(x-z) e^(-i omega t)$.
- *Magnetic dipole* $bold(m) = (1\/2) integral bold(r) times bold(J) dif V$: a current loop. Atomic unit of magnetism, cannot be decomposed further.
- Higher multipoles: corrections, suppressed by $(omega L \/ c)^2$ each step.

Dipoles dominate radiation from sources small compared to wavelength. For probing a cavity electromagnetically, point dipoles are the elementary inputs.

=== The asymmetry between $bold(E)$ and $bold(B)$

In source-free regions, Maxwell's equations are symmetric under $bold(E) <-> c bold(B)$, which is *electromagnetic duality*. Only the existence of electric (but not magnetic) charges breaks the symmetry.

Lorentz boosts mix $bold(E)$ and $bold(B)$: a pure $bold(E)$ field in one frame becomes a mixture of $bold(E)$ and $bold(B)$ in a boosted frame. The "magnetic force on a moving charge" in one frame is the "electric force on a stationary charge" in the charge's rest frame, made possible by length contraction creating an effective net charge density.

The Faraday 2-form $F$ in 4D Minkowski space is the genuinely fundamental object; $bold(E)$ and $bold(B)$ are observer-dependent slices. Maxwell's equations become $dif F = 0$ and $dif star F = J$. Lorentz invariants $bold(B)^2 - bold(E)^2\/c^2$ and $bold(E) dot bold(B)$ are observer-independent.

== The Curl-Curl PDE

=== Why this PDE

Source-free time-harmonic Maxwell, eliminating $bold(H)$:
$ curl curl bold(E) - k^2 bold(E) = 0. $

This is the natural PDE for the electric field 1-form. On divergence-free $bold(E)$, the operator $curl curl$ coincides with the Hodge–Laplacian $delta dif$. So the PDE is the Hodge–Helmholtz equation for 1-forms.

Maxwell BEM is essentially always about this curl-curl equation: different formulations (EFIE, MFIE, CFIE, PMCHWT) are all derived from it.

=== Helmholtz decomposition

Any vector field splits uniquely as
$ bold(F) = -grad phi + curl bold(A). $

The first piece is curl-free (longitudinal, Coulombic, non-radiating). The second is divergence-free (transverse, radiating). For time-harmonic Maxwell in Lorenz gauge:
$ bold(E) = i omega bold(A) - grad phi. $

This is the same decomposition. The transverse part carries radiation; the longitudinal part is electrostatic-like. The two pieces are $L^2$-orthogonal and capture independent geometric content.

In differential-form language, this generalizes to the *Hodge decomposition*: any form splits into exact, co-exact, and harmonic pieces.

== Boundary Trace Theory

=== De Rham complex restricted to the boundary

The 3D de Rham complex
$ H^1(Omega) attach(->, t: grad) bold(H)(curl, Omega) attach(->, t: curl) bold(H)(div, Omega) attach(->, t: div) L^2(Omega) $
restricts to the boundary $Gamma$, producing surface trace spaces.

A 2D manifold has 1-forms as the *self-dual middle degree* under the surface Hodge star $star_Gamma$. This is what produces *two distinct surface complexes on $Gamma$*, both arising from the 3D middle-degree forms ($Omega^1$ and $Omega^2$ in 3D) collapsing onto degree 1 on $Gamma$.

The general rule: in $n$-dim, the number of de Rham sub-complexes is 1 if $n$ is odd, 2 if $n$ is even (because $star^2 = plus.minus 1$ on middle forms, splitting them into two eigenspaces).

=== The two trace spaces

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt,
  inset: 6pt,
  align: left,
  [*Trace*], [*Definition*], [*Space*],
  [Tangential (Dirichlet)], [$bold(T)_D bold(u) = bold(n) times (bold(u) times bold(n))$], [$cal(X)_0 = H^(-1\/2)(curl_Gamma, Gamma)$],
  [Rotated tangential], [$bold(T)_tau bold(u) = bold(u) times bold(n)$], [$cal(X)_1 = H^(-1\/2)(div_Gamma, Gamma)$],
  [Neumann], [$bold(T)_N bold(u) = curl bold(u) times bold(n)$], [$cal(X)_1$],
)

The relation $bold(T)_tau = -bold(n) times bold(T)_D$ is the surface Hodge star $star_Gamma$ acting between the two trace spaces. The Neumann trace is $bold(T)_tau$ applied to $curl bold(u)$.

$cal(X)_0$ and $cal(X)_1$ are dual under the $L^2$ pairing, the Maxwell analogue of $H^(plus.minus 1\/2)$ duality in scalar BEM.

=== The cross product

The map $J_n : bold(u) -> bold(n) times bold(u)$ is a single linear operator that simultaneously kills the normal component and rotates the tangential part by $90 degree$. Eigenvalues ${0, +i, -i}$ confirm this: zero on the rotation axis, complex pair on the perpendicular plane.

Writing $Pi_t bold(u) = bold(n) times (bold(u) times bold(n))$ for the tangential projection, the rotation satisfies $J_n^2 = -Pi_t$, so it equips the tangential fields with a complex structure: a quarter turn in the tangent plane, squared, is minus the identity there.

Sandwich identity: $bold(n) times (bold(u) times bold(n)) = bold(u) - (bold(n) dot bold(u)) bold(n)$. Two cross products with opposite handedness cancel rotations but both kill the normal, yielding pure tangential projection. BAC-CAB is the formula behind this.

The cross product itself is "wedge then Hodge": $bold(a) times bold(b) = star(bold(a) and bold(b))$. It encodes the oriented parallelogram area as a perpendicular vector, a coincidence that only works in 3D, where bivectors and vectors have the same dimension.

== BEM for Maxwell

=== Stratton–Chu representation formula

Maxwell analogue of Green's third identity: any solution of curl-curl in $D$ is reconstructable from its boundary traces:
$ bold(E)^s (x) = -(bold(Psi)_"DL"^M bold(T)_D bold(E)^s)(x) + (bold(Psi)_"SL"^M bold(T)_N bold(E)^s)(x). $

The volume problem reduces to a boundary problem.

=== Layer potentials

*Maxwell single layer* $bold(Psi)_"SL"^M psi$: the field radiated by a surface current $psi$. Decomposes (Lorenz gauge) into vector-potential and scalar-potential pieces:
$ bold(Psi)_"SL"^M psi = Psi_"SL"^kappa psi + 1/k^2 grad Psi_"SL"^kappa (div_Gamma psi). $
The second term is *literally an embedded scalar Laplace BEM* operating on the surface charge accumulated by the current. The first term is the genuinely electromagnetic radiation piece.

*Maxwell double layer* $bold(Psi)_"DL"^M bold(v)$: produces a tangential E-field discontinuity $bold(v)$ across the surface. Maxwell analogue of the scalar capacitor-style normal dipole layer.

=== Boundary integral operators (Calderón system)

#table(
  columns: (auto, auto, 1fr),
  stroke: 0.5pt,
  inset: 6pt,
  align: left,
  [*Operator*], [*Mapping*], [*Meaning*],
  [$bold(V)$ (single layer)], [$cal(X)_1 -> cal(X)_0$], [Surface current → tangential E-field on the surface],
  [$bold(K)$ (double layer)], [$cal(X)_0 -> cal(X)_0$], [E-field jump → tangential E-field],
  [$bold(K)'$ (adj. double)], [$cal(X)_1 -> cal(X)_1$], [Surface current → curl-trace],
  [$bold(W)$ (hypersingular)], [$cal(X)_0 -> cal(X)_1$], [E-field jump → induced surface current],
)

These four operators package all boundary-to-boundary relationships. $bold(V)$ and $bold(W)$ are complex symmetric (not Hermitian).

=== Indirect EFIE

For the PEC scattering problem, the *indirect ansatz* is
$ bold(E)^s = bold(Psi)_"SL"^M psi $
for an unknown surface current $psi$. Enforcing the boundary condition $bold(T)_D bold(E)^s = -bold(T)_D bold(E)^i$ gives the EFIE:
$ bold(V) psi = -bold(T)_D bold(E)^i. $

Once $psi$ is solved, the scattered field is recovered by evaluating $bold(Psi)_"SL"^M psi$ at any interior point.

In the PEC case, $psi$ has direct physical meaning: it is (proportional to) the induced surface current.

=== Resonances

Interior eigenfrequencies of curl-curl on $D$ make $bold(V)$ non-injective. The CFIE (combination of $bold(V)$ and $bold(W)$) is immune.

== Discretization

=== Conforming spaces

The unknown surface current $psi in cal(X)_1$ is discretized using *Rao–Wilton–Glisson (RWG)* elements: the Whitney 1-forms on the surface in the $div_Gamma$-conforming representation. They have:
- Normal continuity across edges (essential for $div_Gamma$-conformity).
- Constant $div_Gamma$ within each triangle.
- Exact preservation of the surface de Rham complex structure at the discrete level.

The discrete commutative diagram mirrors the continuous one, preserving the FEEC structure.

=== Isogeometric variant

The triangulation can be replaced by NURBS patches, exact for quadrics, and an ellipsoid is the affine image of a sphere, so its control points scale and its weights stay unchanged. The same NURBS basis then carries both the geometry and the field, giving a $div_Gamma$-conforming Raviart–Thomas-type analogue of RWG.

=== Galerkin formulation

Find $psi_N$ in the discrete RWG space such that
$ chevron.l beta^k\, bold(V) psi_N chevron.r_Gamma = chevron.l beta^k\, frak(g) chevron.r_Gamma quad forall k. $

Yields a complex symmetric (not Hermitian) linear system. Use *GMRES*, not CG. Convergence rate $O(h^(3\/2))$ in the $cal(X)_1$ norm for smooth solutions.

The matrix is dense, $O(N^2)$, and is replaced in practice by an $H_2$-matrix, a hierarchical approximation of $O(N log N)$. Restarted GMRES without a preconditioner carries moderate problem sizes; serious refinement needs Calderón preconditioning.

== The Reaction Field Problem

The concrete problem that the whole machinery gets pointed at.

The free-space response to a point source is the fundamental solution of the Helmholtz operator,
$
  Phi(bold(x), bold(z)) = 1/(4 pi) exp(i k norm(bold(x) - bold(z)))/norm(bold(x) - bold(z)),
$
satisfying $(-Delta - k^2) Phi(dot, bold(z)) = delta_bold(z)$ with the outgoing condition at infinity. The field radiated by a point dipole at $bold(z)$ with polarization $bold(p)$ follows by applying the dyadic curl-curl operator,
$
  bold(E)^i (bold(x); bold(z), bold(p)) = i/k curl_bold(x) curl_bold(x) (Phi(bold(x), bold(z)) bold(p)),
$
which solves the time-harmonic curl-curl equation away from the source. The boundary-adapted Green's function of a cavity, which would itself satisfy the conducting-wall condition, is a distinct object one never needs to form.

Let $D subset.eq RR^3$ be a bounded cavity with perfectly electrically conducting boundary $partial D$, and $Lambda subset.eq D$ an interior surface carrying the sources and the measurements. A dipole at $bold(z) in Lambda$ radiates the incident field above, whose tangential trace on the wall induces the boundary forcing
$
  bold(h) = -bold(n)_(partial D) times bold(E)^i quad "on" partial D.
$
The scattered field is the response restoring the conducting-wall condition,
$
  curl curl bold(E)^s - k^2 bold(E)^s = 0 "in" D, quad quad bold(n)_(partial D) times bold(E)^s = bold(h) "on" partial D,
$
and the total field $bold(E) = bold(E)^i + bold(E)^s$ then has vanishing tangential trace on the wall. The measured data is the rotated tangential trace of the scattered field on $Lambda$,
$
  bold(y)(bold(x)) = bold(n)_Lambda (bold(x)) times bold(E)^s (bold(x)), quad bold(x) in Lambda,
$
and collecting these over all dipole excitations defines the reaction operator. Both the forcing and the measurement are rotated traces, which is why they are related through $J_n$.

== Comparison with Scalar Laplace BEM

Maxwell BEM is the form-degree-1 analogue of scalar (form-degree-0) Laplace BEM. Every object lifts:

#table(
  columns: (auto, 1fr, 1fr),
  stroke: 0.5pt,
  inset: 6pt,
  align: left,
  [], [*Laplace (degree 0)*], [*Maxwell (degree 1)*],
  [PDE], [$Delta phi = 0$], [$curl curl bold(E) - k^2 bold(E) = 0$],
  [Fundamental sol.], [$Phi = 1\/(4 pi r)$], [Dyadic $bold(G)$],
  [Single-layer density], [Surface charge], [Surface current],
  [Double-layer density], [Normal dipole layer], [Tangential E-field jump],
  [Discrete space], [Nodal $P_1$], [RWG],
)

Maxwell BEM contains a scalar Laplace BEM piece (the scalar potential / charge contribution embedded in $bold(Psi)_"SL"^M$), plus a transverse vector-potential piece with no scalar analogue. The relationship is "one rung up the de Rham ladder", exterior differentiation $dif$ taking 0-forms to 1-forms.

== Summary

Maxwell BEM is the systematic discretization of the boundary integral equations derived from the curl-curl equation, formulated on the two surface de Rham complexes that emerge from the $H(curl)$ trace structure, with surface currents as the natural unknowns and dipoles as the elementary radiators, a direct vectorial generalization of scalar Laplace BEM, sitting one rung up the de Rham ladder.
