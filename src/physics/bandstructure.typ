#import "/src/setup.typ": *
#show: note

= Bandstructure

A crystal is one motif repeated on a regular grid.
The grid is the Bravais lattice
$
  Lambda = {n_1 avec(a)_1 + n_2 avec(a)_2 + n_3 avec(a)_3 | n_i in ZZ},
$
and the motif is the basis, the atoms sitting inside one unit cell.
Space is then the quotient $RR^3\/Lambda$, a three-dimensional torus.

Everything below rests on one equation,
$
  V(avec(r) + avec(R)) = V(avec(r)) quad "for all" avec(R) in Lambda,
$
and nothing else.
The wave vector, the Brillouin zone, the bands and the gaps are all consequences of it.

That there is a single potential $V$ at all is already two approximations.
Born-Oppenheimer freezes the nuclei, since they are some $10^4$ times heavier than the electrons,
which turns the ion cores into a static external potential.
A mean field, Hartree-Fock or DFT, then replaces the mutual interaction
of $10^(23)$ electrons by an average potential each one feels,
leaving a single-electron problem.
Perfect periodicity assumes on top of that
that the nuclei sit exactly at ideal lattice sites,
so phonons, defects and surfaces are absent.
They come back later as perturbations that scatter the states constructed here,
and that scattering is what resistance is.
In a perfect periodic crystal an electron propagates forever.

== Reciprocal lattice

A function with the periodicity of $Lambda$ has a Fourier series,
and the plane waves that survive the periodicity are those with
$e^(i avec(G) dot avec(R)) = 1$, that is $avec(G) dot avec(R) in 2 pi ZZ$.
Those $avec(G)$ form the reciprocal lattice
$
  Lambda^* = {m_1 avec(b)_1 + m_2 avec(b)_2 + m_3 avec(b)_3 | m_i in ZZ},
$
with the reciprocal basis fixed by $avec(a)_i dot avec(b)_j = 2 pi delta_(i j)$.
It is the Pontryagin dual of $Lambda$,
the group of characters of the translation group,
which is exactly the role it plays below.

The periodic potential expands as
$
  V(avec(r)) = sum_(avec(G) in Lambda^*) hat(V)_avec(G) e^(i avec(G) dot avec(r)).
$

== Translation symmetry

Let $T_avec(R)$ shift a wavefunction by a lattice vector,
$(T_avec(R) psi)(avec(r)) = psi(avec(r) - avec(R))$.

A symmetry acts on an operator by conjugation, not by multiplication:
an operator has an input slot and an output slot,
and both must be carried into the new frame,
so the transformed Hamiltonian is $T_avec(R) H T_avec(R)^(-1)$.
Conjugating shifts the argument of the potential,
$
  T_avec(R) H T_avec(R)^(-1) = -planck^2/(2m) nabla^2 + V(avec(r) - avec(R)),
$
the Laplacian being translation invariant already.
Periodicity of $V$ is therefore the same statement as
$
  [H, T_avec(R)] = 0.
$
Commutation is invariance.

Its use is that commuting operators admit a common eigenbasis,
so an energy eigenstate may be chosen to also carry an eigenvalue of every $T_avec(R)$.
That eigenvalue is a new label on the state, a quantum number,
and it is conserved because $dot(T) prop [H, T] = 0$.

== Bloch's theorem

Ask what the eigenvalues of the shifts can be.
Two constraints settle it.
The $T_avec(R)$ are unitary, so the eigenvalue is a pure phase,
and $T_avec(R) T_avec(R') = T_(avec(R) + avec(R'))$ forces that phase to be additive in $avec(R)$.
An additive phase is linear, so
$
  T_avec(R) psi = e^(i avec(k) dot avec(R)) psi
$
for some vector $avec(k)$, the wave vector.
It is not an ansatz.
The only phases available are the characters of $Lambda$,
and $avec(k)$ is the vector that names one.

Additivity also explains why three numbers suffice for infinitely many shifts.
A character is determined by its values on the three primitive vectors,
$e^(i theta_j)$ with $theta_j = avec(k) dot avec(a)_j$,
and the reciprocal basis exists precisely to repackage those three angles as one vector.

The familiar form follows by defining $u_avec(k)(avec(r)) = e^(-i avec(k) dot avec(r)) psi(avec(r))$,
which the phase form makes lattice-periodic:
$
  psi_avec(k)(avec(r)) = e^(i avec(k) dot avec(r)) u_avec(k)(avec(r)).
$
A plane wave carrying the phase bookkeeping,
times something with the periodicity of the crystal.
The content of the theorem is the phase form, that a shift only multiplies the state by a phase.
The product form is a rewriting, and it is the rewriting that introduces an ambiguity.

Read $avec(k)$ as phase advance per unit cell.
All cells are identical, and $avec(k)$ says by which angle the state is rotated
in the complex plane on stepping from one to the next.
At $avec(k) = 0$ every cell is in phase.
In one dimension at $k = pi\/a$ the sign alternates from cell to cell,
which is the fastest alternation the lattice can resolve.
Nothing in $avec(k)$ describes what happens inside a cell; that is $u_avec(k)$.

== Brillouin zone

Since $avec(G) dot avec(R) in 2 pi ZZ$, the states $avec(k)$ and $avec(k) + avec(G)$
produce the identical phase and are the same state.
So $avec(k)$ does not live in $RR^3$ but in $RR^3\/Lambda^*$, again a torus,
and the Brillouin zone is a choice of fundamental domain.
The first Brillouin zone is the Wigner-Seitz cell of $Lambda^*$,
the points closer to the origin than to any other reciprocal lattice point,
chosen because it respects the point symmetry of the crystal.
In one dimension it is $-pi\/a < k <= pi\/a$.

The identification is aliasing.
The lattice samples space at discrete sites,
and a phase advance of $theta$ and of $theta + 2 pi$ leave identical readings there,
so no measurement distinguishes them.
The Brillouin zone is the Nyquist range of that sampling.

Nothing is lost in the identification, because the product form is not unique.
Shifting $avec(k)$ by $avec(G)$ and multiplying $u$ by $e^(-i avec(G) dot avec(r))$,
which is itself lattice-periodic, leaves $psi$ untouched.
The short-wavelength content moves between the envelope and the periodic part,
and restricting $avec(k)$ to the Brillouin zone fixes which reading is used.

The invariant statement is in Fourier space.
Expanding the periodic $u_avec(k) = sum_avec(G) c_avec(G) e^(i avec(G) dot avec(r))$ gives
$
  psi_avec(k)(avec(r)) = sum_(avec(G) in Lambda^*) c_avec(G) e^(i (avec(k) + avec(G)) dot avec(r)).
$
A Bloch state is a superposition of plane waves
whose wave vectors form a single comb spaced by the reciprocal lattice.
The comb is the physical object, and $avec(k)$ names it by choosing a representative.
A crystal potential generically makes every $c_avec(G)$ nonzero;
that is what structure inside the unit cell means.

That $planck avec(k)$ is defined only modulo $planck avec(G)$
is why it is called crystal momentum rather than momentum.
It is not the mechanical momentum, since the lattice absorbs momentum in units of $planck avec(G)$,
but it plays the same kinematic role, $planck dot(avec(k)) = avec(F)_"ext"$.

== Bands

Substituting the product form into $H psi = E psi$ and stripping the exponential,
using $nabla(e^(i avec(k) dot avec(r)) u) = e^(i avec(k) dot avec(r))(nabla + i avec(k)) u$,
leaves an equation for the periodic part alone,
$
  H_avec(k) u_avec(k) = E u_avec(k), quad
  H_avec(k) = planck^2/(2 m) (-i nabla + avec(k))^2 + V(avec(r)).
$
Two things have happened.
The wave vector is now a parameter rather than an unknown,
so there is one separate problem per $avec(k)$,
and $u$ is periodic, so the problem lives on a single unit cell
with periodic boundary conditions.
The infinite domain is gone.

A self-adjoint operator on a bounded domain has discrete spectrum,
so each $avec(k)$ carries a ladder
$
  E_1(avec(k)) <= E_2(avec(k)) <= E_3(avec(k)) <= dots.h,
$
indexed by the band index $n$.
The full label on an eigenstate is the pair $(avec(k), n)$,
and the two indices have separate origins:
$avec(k)$ is continuous and comes from the translation symmetry,
$n$ is discrete and comes from confinement to one cell.
Letting $avec(k)$ sweep the Brillouin zone traces each $E_n$ into a curve, a band,
and the collection of all of them is the bandstructure.

That confinement is the same fact as the discrete levels of an isolated atom.
Bringing $N$ atoms together splits each atomic level into $N$ nearby levels,
and for $N approx 10^(23)$ the spacing is unresolvable and the level becomes a band.
The counting is exact and matches the wave vector.
On a ring of $N$ cells the phase must close, $e^(i k N a) = 1$,
so there are precisely $N$ allowed $avec(k)$ in the Brillouin zone
and precisely $N$ states in a band.
The wave vector is not bookkeeping attached afterwards, it enumerates the band.
Energies no band passes through are gaps.

== Dispersion

The bandstructure is the dispersion relation of the crystal,
energy against wave vector, and it belongs to the material.
Its two derivatives are the physics.

The slope is a velocity,
$
  avec(v)_n (avec(k)) = 1/planck nabla_avec(k) E_n (avec(k)).
$
It is a group velocity, the speed of a wave packet built from states near $avec(k)$,
as opposed to the phase velocity of the carrier wave inside it.
The two agree only where $E$ is linear in $avec(k)$,
and it is the group velocity that transports charge and energy.
At a band extremum the slope vanishes, and a flat band carries nothing at any $avec(k)$.

The curvature is an inverse mass,
$
  (1/m^*)_(i j) = 1/planck^2 (partial^2 E)/(partial k_i partial k_j).
$
Near a band edge the expansion
$E(avec(k)) approx E_0 + planck^2 (avec(k) - avec(k)_0)^2 \/ 2 m^*$
is the free-electron dispersion with $m$ replaced by $m^*$,
so the entire crystal potential has been absorbed into one tensor.
Sharp curvature means light and fast carriers, flat means heavy and slow.
In silicon the constant-energy surfaces near the conduction band minimum are ellipsoids,
so $m^*$ is anisotropic.

At a band maximum the curvature is negative.
That is not pathological: a nearly full band is better described by its few empty states,
which behave as positive charges of positive mass.

A band edge is an extremum of a band.
The two that matter in a semiconductor are the valence band maximum and the conduction band minimum,
whose separation is the gap.
At ordinary temperatures carriers sit near band edges,
so the quadratic expansion there describes nearly every carrier in a device.

== Current of a Bloch state

A Bloch state is stationary, and $|psi_avec(k)|^2 = |u_avec(k)|^2$ is lattice-periodic
and independent of time.
It nevertheless carries current.
Stationary means the density does not change, not that nothing flows:
continuity $partial_t rho + nabla dot avec(j) = 0$
is satisfied by a constant density with constant nonzero flux,
as in steady flow through a pipe.
For a plane wave
$
  avec(j) = planck/m "Im"(psi^* nabla psi) = (planck avec(k))/m |psi|^2,
$
and in a crystal $planck avec(k)\/m$ is replaced by $avec(v)_n (avec(k))$.

No current leaves a crystal at rest because of time-reversal symmetry.
It gives $E_n (-avec(k)) = E_n (avec(k))$ and hence $avec(v)_n (-avec(k)) = -avec(v)_n (avec(k))$,
and in equilibrium both are equally occupied,
so the contributions cancel exactly.
Every electron moves and the sum does not.
An applied field shifts the occupation in $avec(k)$-space,
the cancellation fails, and net current flows.
That is where transport begins.

== The same theorem for other waves

Nothing above used quantum mechanics beyond the identification of $H$ with an energy.
The argument needs only a self-adjoint operator commuting with a lattice of translations,
so it applies to any wave equation on a periodic domain.

With $V = 0$ the stationary Schrödinger equation is the Helmholtz equation,
$nabla^2 psi + k^2 psi = 0$ with $k^2 = 2 m E \/ planck^2$,
and the free dispersion $E = planck^2 k^2 \/ 2m$ is that relation read backwards.
With $V != 0$ it is Helmholtz with a spatially varying wavenumber
$k^2(avec(r)) = 2 m (E - V(avec(r)))\/planck^2$,
and the classically forbidden region is where $k^2 < 0$ and solutions turn evanescent,
as below cutoff in a waveguide.

Maxwell in a periodic $epsilon$ gives
$
  nabla times 1/epsilon(avec(r)) nabla times avec(H) = omega^2/c^2 avec(H),
$
so Bloch's theorem applies verbatim,
with a Brillouin zone, bands $omega_n (avec(k))$ and photonic band gaps.
Two differences are worth holding.
Maxwell has no intrinsic length, so scaling the lattice only rescales all frequencies,
whereas $planck^2\/2m$ fixes a scale in the Schrödinger case.
And the eigenvalue multiplies $epsilon$ rather than entering additively,
making it a generalized eigenproblem,
on a vector field constrained by $nabla dot (epsilon avec(E)) = 0$.
