= Solid State Physics

A crystal has a Bravais lattice
$
  Lambda = {n_1 avec(a)_1 + n_2 avec(a)_2 + n_3 avec(a)_3 | n_i in ZZ}
$

The space we are working with then is a quotient
$
  RR^3\/Lambda isomorph TT^3
$
isomorphic to a 3-dimensional torus (periodic structure).

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
  Lambda^* = {avec(G) = m_1 avec(b)_1 + m_2 avec(b)_2 + m_3 avec(b)_3i, m_i in ZZ}
$
with the reciporcal basis vector fulfilling $avec(a)_i dot avec(b)_j = 2 pi delta_(i j)

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
