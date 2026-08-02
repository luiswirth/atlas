#import "/src/setup.typ": *
#show: note

= Maxwell in Forms

Electromagnetism written in exterior calculus, where the structure that vector calculus
hides becomes the notation itself.

== The two layers

Maxwell's equations decompose into a topological layer,
$
  dif F = 0, quad dif G = J,
$
requiring only the differentiable structure,
and a metric layer,
$
  G = Z_0^(-1) hodge F,
$
requiring the Hodge star.
The topological equations express conservation and integrability,
the metric equation encodes the medium's response.
This separation is invisible in vector calculus but manifest in forms.

== The physical fields as forms

The electromagnetic field $F = avec(B) + avec(E) and dif t$
and the excitation $G = avec(D) - avec(H) and dif t$ are both 2-forms,
with swapped decompositions.
The Hodge star maps $F -> G$ by interchanging flux-type quantities,
living in $Lambda^2_"space"$ with no $dif t$,
with circulation-type quantities, living in $Lambda^1_"space"$ with $dif t$,
and so it swaps electric against magnetic at the same time.

== Why $avec(E)$ carries $dif t$ and $avec(B)$ does not

The electric field does work on charges, which is a temporal coupling,
while the magnetic field only redirects momentum without transferring energy,
$avec(F)_"mag" dot avec(v) = 0$.
The $dif t$ leg in $avec(E) and dif t$ is that temporal coupling.
Under Lorentz boosts $avec(E)$ and $avec(B)$ mix,
because the boost rotates the time direction into a spatial one.
Only the combined 2-form $F$ is frame-independent.

== The Hodge-Dirac operator

The Hodge-Dirac operator $D = dif + delta$ acts on differential forms.
The exterior derivative $dif$ is grade-raising and metric-free,
the codifferential $delta$ is grade-lowering and metric-dependent,
and both are nilpotent on their own, $dif^2 = 0$ and $delta^2 = 0$.
Their combination squares to the Hodge Laplacian, $D^2 = Delta$.
Its symbol
$
  sigma_D (k) = i(k and (dot) + iota_(k^sharp) (dot))
$
is Clifford multiplication by $k$, and $sigma_D (k)^2 = -g(k,k)$
is the defining Clifford relation.
The full Maxwell system unifies into $D F = 0$.

== The potential hierarchy

Each level of potential arises from the Poincaré lemma applied one more time,
$
  avec(Pi) in Lambda^2
  limits(->)^delta
  avec(A) in Lambda^1
  limits(->)^dif
  F in Lambda^2
  limits(->)^(Z_0^(-1) hodge)
  G in Lambda^2
  limits(->)^dif
  J in Lambda^3.
$
Gauge freedom $avec(A) |-> avec(A) + dif chi$ is a consequence of $dif^2 = 0$.
The Lorenz gauge $delta avec(A) = 0$ makes $avec(A)$ coclosed,
which allows $avec(A) = delta avec(Pi)$.
The Hertz potential $avec(Pi)$ is the deepest level
where both $dif$ and $delta$ remain nontrivial;
going deeper kills one path by nilpotency.
Self-consistency requires $Delta avec(Pi) = 0$.
