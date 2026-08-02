#import "/src/setup.typ": *
#show: note

= Solid State Physics

A crystal has a Bravais lattice
$
  Lambda = {n_1 avec(a)_1 + n_2 avec(a)_2 + n_3 avec(a)_3 | n_i in ZZ}
$

The space we are working with then is a quotient
$
  RR^3\/Lambda tilde.equiv TT^3
$
tilde.equivic to a 3-dimensional torus (periodic structure).

Periodic lattice leads to periodic poentential.
$
  V(r + R) = V(r)
$
for any lattice vector $R$.

== Reciprocal Lattice

We can do Fourier analysis on this space. Since it is periodic a Fourier series
exists. The natural Fourier basis consists of plane waves $e^(i avec(G) dot avec(r))$
with $G$ satisfiying $e^(i avec(G) dot avec(R)) = 1 <=> avec(G) dot avec(R) in 2 pi ZZ$.

All such $G$s form the *reciprocal lattice*
$
  Lambda^* = {avec(G) = m_1 avec(b)_1 + m_2 avec(b)_2 + m_3 avec(b)_3, m_i in ZZ}
$
with the reciprocal basis vectors fulfilling $avec(a)_i dot avec(b)_j = 2 pi delta_(i j)$.

The reciprocal lattice is the *Pontryagin dual* of the Bravais lattice.
-- the set of characters (homomorphisms to U(1)) of the translation
group $Lambda$.

The reciprocal lattice tiles $k$-space periodically. The wave vector
$avec(k)$ is only meaningful modulo $Lambda^*$.

The Fourier expansion of a periodic function on the space,
like the potential $V$ is then
$
  V(avec(r)) = sum_(avec(G) in Lambda^*) hat(V)_avec(G) e^(i avec(G) dot avec(r))
$


== Bloch's Theorem

Bloch's theorem (solid state analog of Floquet theory)
says that eigenfunctions of Schroedinger equation
then take the form
$
  psi_k(r) = e^(i k dot r) u_k(r)
$
where $u_k$ has the same periodicty as the lattice.

Here $k$ is the crystal momentum and labels the eigenstate.
Each eigenstate has an energy giving us $E = E(k)$.
That is the band structure. It's the dispersion relation in the periodic potential.

While in free space $planck k$ is the actual momentum, in a crystal
$planck k$ is the crystal momentum. It's not the real momentum (because
the electrons also exchange momentum with the lattice, but it plays the same kinematik role.
$dot(p) = planck dot(k) = F_"ext"$

Because of periodicity, $k$ is only defined up to a reciprocal lattice
vector. Values that differ by a reciprocal lattice vector give the
same physical state. Therefore $k$ is restricted to the first Brillouin zone,
to ensure uniqueness.

== Brillouin Zone

The *first Brillouin zone* (BZ) is the fundamental domain — it's the Wigner-Seitz cell of the reciprocal lattice: the set of points in
$k$-space closer to the origin than to any other reciprocal lattice point. Equivalently, it's a fundamental domain for the quotient $RR^3/Lambda^*$.

== Bands and Carriers

The periodic structure of a crystal forms energy bands for electrons.
Only wavefunctions of discrete non-zero energies act like free particles,
and wavefunctions at forbidden energies, which violate the periodic boundary conditions,
die off exponentially instead.
In the conduction and valence band they do not,
and a wavefunction in the conduction band can span forever.

Electrons in the valence band are stuck in bonds,
electrons in the conduction band are mobile and conduct current,
and the band gap between them is the forbidden zone.
In silicon $E_g approx 1.2 "eV" approx 50 k T$ at room temperature.
Metals have overlapping bands and no gap,
insulators have a gap too big to jump, $"SiO"_2$ has $8 "eV"$,
and semiconductors have a gap small enough to jump.

There are two kinds of charge carrier:
electrons in the conduction band, negative,
and holes in the valence band, positive,
a hole being the absence of an electron, a bubble in water, treated as a particle in its own right.

The density of states counts how many configurations exist at a given energy,
and it increases away from the edges of the forbidden band.
Multiplying it by the Fermi-Dirac distribution gives the actual occupancy.
For an undoped semiconductor this leaves two small hills,
one just above the conduction band edge and one just below the valence band edge.
The Fermi level is where the occupation probability is one half,
close to the conduction band in $n$-type material
and close to the valence band in $p$-type.

== Doping

Pure silicon is nearly an insulator, and doping makes it conductive.
Donors are group V elements, phosphorus or arsenic, whose fifth electron is free to move,
so the majority carriers are electrons.
Acceptors are group III elements, boron, which steal an electron from a neighbor
to complete a bond and leave a hole,
so the majority carriers are holes.
Only a fraction of $10^(-8)$ to $10^(-4)$ of the atoms are doped.

In equilibrium the law of mass action fixes the product,
$
  n p = n_i^2,
$
with $n_i$ the intrinsic carrier density.
Doping raises one hill and lowers the other, but never the product.

The binding energy of a donor atom is reduced from the free-atom value
roughly by the dielectric constant of silicon,
leaving only about $2 k T$, which is on the order of the thermal energy.
That the carriers are nevertheless free comes from counting:
there are far more ways to be free than to be bound.

== Drift and Diffusion

Carriers move in two ways.
Drift is caused by an electric field and is directed,
with velocity $v = mu xi$ and current $I = q N mu xi$.
Diffusion is caused by a concentration gradient and Brownian motion, and is undirected,
with current $I = q D (partial N)/(partial x)$.

The Einstein relation ties the two mechanisms together through the thermal voltage,
$
  D = (k T)/q mu = U_T mu,
$
where $U_T = k T \/ q approx 25 "mV"$ at room temperature
is the voltage an elementary charge falls through to pick up the thermal energy $k T$.
One coefficient, not two.

In a PN junction at equilibrium, electrons and holes diffuse across and recombine,
leaving a depletion region of fixed ions,
positive on the $n$ side and negative on the $p$ side.
Their field opposes further diffusion until drift and diffusion balance everywhere,
which is what the built-in potential is.
The bands bend accordingly, while the Fermi level stays flat,
which is what defines equilibrium.

== Why Transistors Look Like Neurons

Below threshold, in weak inversion, a transistor carries diffusion current only.
The carrier concentrations depend exponentially on the potential barriers,
$N = N_0 e^(-theta \/ U_T)$,
and the barriers are set linearly by the applied voltages,
so the current comes out exponential in the gate voltage,
$
  I = I_0 e^(psi_s \/ U_T)(e^(-V_d \/ U_T) - e^(-V_s \/ U_T)).
$
That exponential is the Boltzmann factor and nothing else.

This is Carver Mead's observation, the one neuromorphic engineering rests on:
the physics of a transistor in subthreshold
is identical to the physics of an ion channel in biology.
Both are populations of carriers crossing a barrier set by a voltage,
so both are exponential in that voltage for the same reason,
and a circuit built in this regime computes with the device physics
rather than against it.
