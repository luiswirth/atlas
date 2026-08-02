#import "/src/setup.typ": *
#show: note

= Cohomology

== Exact against closed

A fundamental fact about exterior differentiation is that $dif(dif omega) = 0$
for any sufficiently smooth form.
Under restrictions on the topology of $Omega$ the converse holds too,
the exact sequence property,
$
  omega in Lambda^k: quad dif omega = 0 => omega = dif eta quad "when" beta_k = 0.
$
In vector calculus this is the familiar list,
$
  grad F = 0 &=> F = "const" quad &&beta_0 = 0, \
  curl F = 0 &=> F = grad f quad &&beta_1 = 0, \
  div F = 0 &=> F = curl A quad &&beta_2 = 0,
$
and the obstruction is measured by the quotient
$
  frak(H)^k = {omega | dif omega = 0} \/ {omega | omega = dif eta}.
$

Poincaré's lemma is the sufficient condition:
on a contractible domain $Omega subset.eq RR^n$,
every $omega in Lambda^l (Omega)$ with $l >= 1$ and $dif omega = 0$
is the exterior derivative of an $(l-1)$-form over $Omega$.

== Chain complexes and homology

A chain complex is a sequence of spaces and linear maps
$
  dots.c -> V_(k+1) ->^(partial_(k+1)) V_k ->^(partial_k) V_(k-1) -> dots.c,
  quad partial_k compose partial_(k+1) = 0,
$
equivalently a graded space $V = xor.big_k V_k$
with a graded operator of degree $-1$ squaring to zero.

The vocabulary: $V_k$ are the $k$-chains,
$partial_k$ the $k$-th boundary operator,
$frak(Z)_k = ker partial_k$ the cycles,
$frak(B)_k = im partial_(k+1)$ the boundaries,
and
$
  frak(H)_k = frak(Z)_k \/ frak(B)_k
$
the $k$-th homology space, the object everything is built for.
Its dimension is the $k$-th Betti number,
so knowing the homology gives the holes of the space.

Cohomology is homology on the dual side, on the cochains,
which are functions on the simplices.
De Rham cohomology is the instance built from differential forms,
and it makes statements about the existence of antiderivatives of forms.

== The two are the same

Singular cohomology with real coefficients is isomorphic to de Rham cohomology,
which is the de Rham theorem:
the homology of a PDE domain and the cohomology of the differential forms on it agree.
The de Rham map is the projection of differential $k$-forms onto $k$-cochains,
the functions on the $k$-simplices of a mesh,
and that is the map along which forms are discretized.

Hodge theory is the metric refinement of the same statement:
given a Riemannian metric, every cohomology class has a canonical representative,
the form annihilated by the Laplacian of that metric, called harmonic.
