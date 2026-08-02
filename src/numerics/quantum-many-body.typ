#import "/setup.typ": *
#show: note

= Quantum Many-Body Numerics

The whole subject is organized by one obstruction:
the state space of $N$ particles is a tensor product, so its dimension grows exponentially in $N$,
and every method is a choice of which small corner of it to keep.

A system is genuinely quantum exactly when there are observables
that do not commute with the Hamiltonian.
Then they share no eigenbasis, the ground state is a superposition,
and no single configuration represents it.
Classically that never happens and a state is one deterministic configuration,
which is why the classical problem is the cheap one.

== Imaginary time

Substituting $t = -i tau$ turns the evolution operator into
$
  e^(-i H t) |-> e^(-H tau),
$
which is no longer unitary but contracting:
it damps every eigenstate by its energy,
so any initial state converges to the ground state as $tau -> oo$,
provided it was not orthogonal to it.
Ground state search is therefore time evolution with the clock turned sideways,
and the same code serves both.

The thermal density matrix is the same object,
$
  hat(rho)_beta = 1/Z e^(-beta H), quad Z = tr e^(-beta H),
$
with the inverse temperature $beta$ in the role of imaginary time.
Equilibrium statistical mechanics and ground state search are one computation
read at finite and at infinite $tau$.

In coordinate representation the kernel $chevron.l R | e^(-beta H) | R' chevron.r$
is the Green's function of the Schrödinger equation in imaginary time,
that is, of a heat equation with a potential.
This is why the quantum problem admits a probabilistic representation at all,
and the representation is Feynman-Kac.

== The classical system one dimension up

Quantum Monte Carlo maps a $d$-dimensional quantum system
to a $(d+1)$-dimensional classical one,
the extra dimension being imaginary time,
after which the classical machinery applies unchanged:
Markov chains, detailed balance, Metropolis, cluster updates.

Which continuum is discretized differs by problem.
For spins the space is already discrete and imaginary time stays continuous;
for particles the space is continuous and imaginary time is discretized into $beta = M dif tau$.
Path-integral Monte Carlo targets thermal equilibrium,
diffusion Monte Carlo targets the ground state with no thermodynamics involved,
and only the former is available for spins.

== What you attack

The methods separate by which object they represent, not by which approximation they make.

Attack the partition function and you get quantum Monte Carlo.
Attack the density and you get density functional theory,
resting on the Hohenberg-Kohn theorem that every property of the ground state
is a functional of its density, so a function of $3N$ variables is replaced by one of three.
Attack the wave function and you get exact diagonalization,
honest and exponential, or a variational family.

Variational methods differ only in the parametrization.
Neural quantum states parametrize the amplitudes by a network and descend the energy.
Matrix product states rewrite the tensor product state as a contraction of three-tensors,
one per site, and truncate the Schmidt decomposition at each cut by singular value decomposition.
The truncation is justified by the area law:
the entanglement entropy across a cut of a gapped one-dimensional ground state
scales with the size of the cut rather than the volume it separates,
so the physical states occupy a vanishing corner of the Hilbert space
and the bond dimension needed to reach them is bounded.

The area law is also where the method stops.
A two-dimensional lattice can be swept into a one-dimensional chain,
but the interactions become non-local and the entropy then scales with the volume,
so the bond dimension explodes.
The honest two-dimensional generalization is a tensor network with the geometry of the lattice,
and it has no canonical form, which is what made the one-dimensional algorithms efficient.
