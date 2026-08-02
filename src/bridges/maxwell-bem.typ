#set document(title: "Maxwell + BEM: A Conceptual Summary")
#set page(margin: 2.5cm, numbering: "1")
#set par(justify: true, leading: 0.65em)
#set heading(numbering: "1.")
#show heading.where(level: 1): it => [
  #v(0.5em)
  #text(size: 14pt, weight: "bold")[#it]
  #v(0.3em)
]
#show heading.where(level: 2): it => [
  #v(0.3em)
  #text(size: 11pt, weight: "bold", style: "italic")[#it]
  #v(0.2em)
]

#align(center)[
  #text(size: 18pt, weight: "bold")[Maxwell + BEM: A Conceptual Summary]
  #v(0.3em)
  #text(size: 10pt, style: "italic")[Notes from a theory session, for later reference]
]

#v(1em)

= The Structure of Electromagnetism

== Sources

Only two things source EM fields: charge density $rho$ and current density $bold(J)$, bound by the continuity equation $partial_t rho + div bold(J) = 0$. Once you fix $bold(J)(x,t)$, the evolution of $rho$ is determined. So in a real sense, current is the single fundamental source.

There are no magnetic monopoles in our universe (empirical fact: $div bold(B) = 0$). This is the source of the asymmetry between $bold(E)$ and $bold(B)$ in Maxwell's equations.

== The four regimes

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

== Radiation

Radiation is energy carried to infinity. Operationally: nonzero Poynting flux through a sphere at infinity. Requires fields falling off as $1\/r$, with $bold(E)$ and $bold(B)$ in phase, perpendicular, equal magnitudes (in natural units).

Static fields fall off as $1\/r^2$ or faster — no radiation. The time variation of sources is what enables the $1\/r$ tail.

== Multipoles and dipoles

Localized sources expand in multipoles:

- *Electric monopole*: forbidden as a radiator (charge conservation).
- *Electric dipole* $bold(p) = integral bold(r) rho dif V$: leading-order radiator. Equivalent to a point current element $bold(J) = bold(p) delta(x-z) e^(-i omega t)$.
- *Magnetic dipole* $bold(m) = (1\/2) integral bold(r) times bold(J) dif V$: a current loop. Atomic unit of magnetism — cannot be decomposed further.
- Higher multipoles: corrections, suppressed by $(omega L \/ c)^2$ each step.

Dipoles dominate radiation from sources small compared to wavelength. For probing a cavity electromagnetically, point dipoles are the elementary inputs.

== The asymmetry between $bold(E)$ and $bold(B)$

In source-free regions, Maxwell's equations are symmetric under $bold(E) <-> c bold(B)$ — this is *electromagnetic duality*. Only the existence of electric (but not magnetic) charges breaks the symmetry.

Lorentz boosts mix $bold(E)$ and $bold(B)$: a pure $bold(E)$ field in one frame becomes a mixture of $bold(E)$ and $bold(B)$ in a boosted frame. The "magnetic force on a moving charge" in one frame is the "electric force on a stationary charge" in the charge's rest frame, made possible by length contraction creating an effective net charge density.

The Faraday 2-form $F$ in 4D Minkowski space is the genuinely fundamental object; $bold(E)$ and $bold(B)$ are observer-dependent slices. Maxwell's equations become $dif F = 0$ and $dif star F = J$. Lorentz invariants $bold(B)^2 - bold(E)^2\/c^2$ and $bold(E) dot bold(B)$ are observer-independent.

= The Curl-Curl PDE

== Why this PDE

Source-free time-harmonic Maxwell, eliminating $bold(H)$:
$ curl curl bold(E) - k^2 bold(E) = 0. $

This is the natural PDE for the electric field 1-form. On divergence-free $bold(E)$, the operator $curl curl$ coincides with the Hodge–Laplacian $delta dif$. So the PDE is the Hodge–Helmholtz equation for 1-forms.

Maxwell BEM is essentially always about this curl-curl equation — different formulations (EFIE, MFIE, CFIE, PMCHWT) are all derived from it.

== Helmholtz decomposition

Any vector field splits uniquely as
$ bold(F) = -grad phi + curl bold(A). $

The first piece is curl-free (longitudinal, Coulombic, non-radiating). The second is divergence-free (transverse, radiating). For time-harmonic Maxwell in Lorenz gauge:
$ bold(E) = i omega bold(A) - grad phi. $

This is the same decomposition. The transverse part carries radiation; the longitudinal part is electrostatic-like. The two pieces are $L^2$-orthogonal and capture independent geometric content.

In differential-form language, this generalizes to the *Hodge decomposition*: any form splits into exact, co-exact, and harmonic pieces.

= Boundary Trace Theory

== De Rham complex restricted to the boundary

The 3D de Rham complex
$ H^1(Omega) attach(->, t: grad) bold(H)(curl, Omega) attach(->, t: curl) bold(H)(div, Omega) attach(->, t: div) L^2(Omega) $
restricts to the boundary $Gamma$, producing surface trace spaces.

A 2D manifold has 1-forms as the *self-dual middle degree* under the surface Hodge star $star_Gamma$. This is what produces *two distinct surface complexes on $Gamma$*, both arising from the 3D middle-degree forms ($Omega^1$ and $Omega^2$ in 3D) collapsing onto degree 1 on $Gamma$.

The general rule: in $n$-dim, the number of de Rham sub-complexes is 1 if $n$ is odd, 2 if $n$ is even (because $star^2 = plus.minus 1$ on middle forms, splitting them into two eigenspaces).

== The two trace spaces

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

$cal(X)_0$ and $cal(X)_1$ are dual under the $L^2$ pairing — the Maxwell analogue of $H^(plus.minus 1\/2)$ duality in scalar BEM.

== The cross product

The map $J_n : bold(u) -> bold(n) times bold(u)$ is a single linear operator that simultaneously kills the normal component and rotates the tangential part by $90 degree$. Eigenvalues ${0, +i, -i}$ confirm this: zero on the rotation axis, complex pair on the perpendicular plane.

Sandwich identity: $bold(n) times (bold(u) times bold(n)) = bold(u) - (bold(n) dot bold(u)) bold(n)$. Two cross products with opposite handedness cancel rotations but both kill the normal — yielding pure tangential projection. BAC-CAB is the formula behind this.

The cross product itself is "wedge then Hodge": $bold(a) times bold(b) = star(bold(a) and bold(b))$. It encodes the oriented parallelogram area as a perpendicular vector — a coincidence that only works in 3D, where bivectors and vectors have the same dimension.

= BEM for Maxwell

== Stratton–Chu representation formula

Maxwell analogue of Green's third identity: any solution of curl-curl in $D$ is reconstructable from its boundary traces:
$ bold(E)^s (x) = -(bold(Psi)_"DL"^M bold(T)_D bold(E)^s)(x) + (bold(Psi)_"SL"^M bold(T)_N bold(E)^s)(x). $

The volume problem reduces to a boundary problem.

== Layer potentials

*Maxwell single layer* $bold(Psi)_"SL"^M psi$: the field radiated by a surface current $psi$. Decomposes (Lorenz gauge) into vector-potential and scalar-potential pieces:
$ bold(Psi)_"SL"^M psi = Psi_"SL"^kappa psi + 1/k^2 grad Psi_"SL"^kappa (div_Gamma psi). $
The second term is *literally an embedded scalar Laplace BEM* operating on the surface charge accumulated by the current. The first term is the genuinely electromagnetic radiation piece.

*Maxwell double layer* $bold(Psi)_"DL"^M bold(v)$: produces a tangential E-field discontinuity $bold(v)$ across the surface. Maxwell analogue of the scalar capacitor-style normal dipole layer.

== Boundary integral operators (Calderón system)

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

== Indirect EFIE

For the PEC scattering problem, the *indirect ansatz* is
$ bold(E)^s = bold(Psi)_"SL"^M psi $
for an unknown surface current $psi$. Enforcing the boundary condition $bold(T)_D bold(E)^s = -bold(T)_D bold(E)^i$ gives the EFIE:
$ bold(V) psi = -bold(T)_D bold(E)^i. $

Once $psi$ is solved, the scattered field is recovered by evaluating $bold(Psi)_"SL"^M psi$ at any interior point.

In the PEC case, $psi$ has direct physical meaning: it is (proportional to) the induced surface current.

== Resonances

Interior eigenfrequencies of curl-curl on $D$ make $bold(V)$ non-injective. The CFIE (combination of $bold(V)$ and $bold(W)$) is immune.

= Discretization

== Conforming spaces

The unknown surface current $psi in cal(X)_1$ is discretized using *Rao–Wilton–Glisson (RWG)* elements: the Whitney 1-forms on the surface in the $div_Gamma$-conforming representation. They have:
- Normal continuity across edges (essential for $div_Gamma$-conformity).
- Constant $div_Gamma$ within each triangle.
- Exact preservation of the surface de Rham complex structure at the discrete level.

The discrete commutative diagram mirrors the continuous one, preserving the FEEC structure.

== Galerkin formulation

Find $psi_N$ in the discrete RWG space such that
$ angle.l beta^k\, bold(V) psi_N angle.r_Gamma = angle.l beta^k\, frak(g) angle.r_Gamma quad forall k. $

Yields a complex symmetric (not Hermitian) linear system. Use *GMRES*, not CG. Convergence rate $O(h^(3\/2))$ in the $cal(X)_1$ norm for smooth solutions.

= Comparison with Scalar Laplace BEM

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

Maxwell BEM contains a scalar Laplace BEM piece (the scalar potential / charge contribution embedded in $bold(Psi)_"SL"^M$), plus a transverse vector-potential piece with no scalar analogue. The relationship is "one rung up the de Rham ladder" — exterior differentiation $dif$ taking 0-forms to 1-forms.

= Implementation Notes (Bembel-specific)

- Geometry: NURBS patches, exact for quadrics. Ellipsoid is affine image of sphere; control points scale, weights unchanged.
- Isogeometric ansatz space: same NURBS basis used for geometry and field, $div_Gamma$-conforming RT-type analogue of RWG.
- $H_2$-matrix compression: $O(N^2)$ dense matrix replaced by $O(N log N)$ hierarchical approximation.
- Solver: GMRES with restart, no preconditioner adequate for moderate problem sizes; Calderón preconditioning needed for serious refinement.
- Sign convention: verify Bembel kernel exponent ($e^(plus.minus i k r)$) against intended convention.
- Resonance check: condition number of $bold(V)$ for the chosen $k$ on the cavity geometry.

= The One-Sentence Summary

Maxwell BEM is the systematic discretization of the boundary integral equations derived from the curl-curl equation, formulated on the two surface de Rham complexes that emerge from the $H(curl)$ trace structure, with surface currents as the natural unknowns and dipoles as the elementary radiators — a direct vectorial generalization of scalar Laplace BEM, sitting one rung up the de Rham ladder.
