#import "/src/setup.typ": *
#show: note

= Semiconductors

The bandstructure says which states exist.
What follows is the statistics of filling them and the transport that results,
and it takes $E_n (avec(k))$ as given.

== Carriers

Electrons in the valence band are stuck in bonds,
electrons in the conduction band are mobile and conduct current,
and the gap between them is forbidden.
Metals have overlapping bands and no gap,
insulators have a gap too large to cross, $8 "eV"$ in $"SiO"_2$,
and semiconductors have a gap small enough that thermal excitation crosses it.
In silicon $E_g approx 1.2 "eV" approx 50 k T$ at room temperature.

There are two kinds of carrier.
Electrons in the conduction band are negative,
and holes in the valence band are positive,
a hole being the absence of an electron in an otherwise full band,
treated as a particle in its own right because a nearly full band
is described more economically by its few empty states.

The density of states counts how many states lie at a given energy,
and it grows away from the band edges.
Multiplying it by the Fermi-Dirac distribution gives the occupancy,
which for an undoped semiconductor leaves two small hills,
one just above the conduction band edge and one just below the valence band edge.
The Fermi level is where the occupation probability is one half,
close to the conduction band in $n$-type material
and close to the valence band in $p$-type.

== Doping

Pure silicon is nearly an insulator, and doping makes it conductive.
Donors are group V elements, phosphorus or arsenic,
whose fifth electron is free to move,
so the majority carriers are electrons.
Acceptors are group III elements, boron,
which steal an electron from a neighbor to complete a bond and leave a hole,
so the majority carriers are holes.
Only a fraction of $10^(-8)$ to $10^(-4)$ of the atoms are doped.

In equilibrium the law of mass action fixes the product,
$
  n p = n_i^2,
$
with $n_i$ the intrinsic carrier density.
Doping raises one hill and lowers the other, but never the product.

The binding energy of a donor is reduced from the free-atom value
roughly by the dielectric constant of silicon,
leaving about $2 k T$, on the order of the thermal energy.
That the carriers are nevertheless free comes from counting:
there are far more ways to be free than to be bound.

== Drift and diffusion

Carriers move in two ways.
Drift is caused by an electric field and is directed,
with velocity $v = mu xi$ and current $I = q N mu xi$.
Diffusion is caused by a concentration gradient and Brownian motion, and is undirected,
with current $I = q D (partial N)/(partial x)$.

The Einstein relation ties the two through the thermal voltage,
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
The bands bend accordingly while the Fermi level stays flat,
which is what defines equilibrium.
