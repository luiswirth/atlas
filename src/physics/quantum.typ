#import "/src/setup.typ": *
#show: note

= Quantum Mechanics

== Hamiltonian Mechanics

Quantum Mechanics is all about Hamiltonian mechanics.
We have position $r$ and momenum $k$.

=== Momentum Operator

Einstein showed that photons (quanta of light) carry momentum $p = E/c = h nu/c = h/lambda$.
De Broglie postulated that particles (quanta of matter) behave as waves just like photons do.
Therefore particles with momentum $p$ shoould have a wavelength $lambda = h/p$.

We have uncertainity in $r$ and $k$ because we are considering
wave functions that are waves. The Heisenberg uncertainity principle
is a property of wave in general and can be seen using the Fourier transform.

A plane wave $psi(r) = e^(i k dot r)$ represents a state of definite momentum
$p = planck k$ and infinite uncertainty in position (stretching all of space).

$hat(p) = -i planck nabla$ is the momentum operator, because
it's the unique differential operator whose eigenfunctions are plane
waves and whose eigenvalues are momenta.
$
  hat(p) psi =
  -i planck nabla e^(i k dot r) =
  -i planck dot i k e^(i k dot r) =
  planck k e^(i k dot r) =
  p psi
$
The $-i$ is forced to make the operator Hermitian, such that
eigenvalues and therefore momenta are real, as they should be.

==== Representation Theoretic View

The momentum oeprator is the infintesimal generator of spatial translations.
Translations act on wave functions as
$
  T_a psi(r) = psi(r - a) = e^(-i a dot hat(p)\/planck) psi(r).
$
which makes $hat(p) = -i planck nabla$.

=== De Broglie Wavelength

Material particles have an associated wave with this wavelength.

Spatial wavelength of a plane wave $e^(i k x)$ is $lambda = 2 pi/k$.
Because of $p = planck k$, we get $lambda = h/p$.

=== Density of States

How many quantum states are avialable per unit energy at energy E?
