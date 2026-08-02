#import "/src/setup.typ": *
#show: note

= Electromagnetism Equations

== Maxwell's Equations
$ nabla times bold(H) = bold(J) + frac(partial bold(D), partial t) $
$ nabla times bold(E) = - frac(partial bold(B), partial t) $
$ nabla dot bold(B) = 0 $
$ nabla dot bold(D) = rho $

== Lorentz Force Law
$ bold(F) = q (bold(E) + bold(v) times bold(B)) $

== Continuity Equation
$ nabla dot bold(J) + frac(partial rho, partial t) = 0 $

== Constitutive Relations
$ bold(D) = epsilon bold(E) $
$ bold(B) = mu bold(H) $
$ bold(J) = sigma bold(E) $

== Potential Definitions
$ bold(E) = - nabla phi - frac(partial bold(A), partial t) $
$ bold(B) = nabla times bold(A) $

== The Vector Wave Equation

Take the curl of Faraday,
$
  curl curl bold(E) = -partial_t curl bold(B)
  = -partial_t (mu_0 bold(J) + mu_0 epsilon_0 partial_t bold(E)),
$
so that
$
  (1/c^2 partial_t^2 + curl curl) bold(E) = -mu_0 partial_t bold(J).
$
Using $curl curl = grad div - Delta$ and then Gauss gives the Maxwell wave equation
$
  square bold(E) = (1/c^2 partial_t^2 - Delta) bold(E)
  = -grad rho/epsilon_0 - mu_0 partial_t bold(J).
$

== Time-Harmonic Form

Pass to fields of angular frequency $omega$ under the $e^(-i omega t)$ convention,
so that $partial_t$ acts as $-i omega$.
In a source-free region the two curl equations become
$
  curl bold(E) = i omega bold(B), quad quad curl bold(H) = -i omega bold(D),
$
and eliminating the magnetic field gives the time-harmonic curl-curl equation
$
  curl curl bold(E) - k^2 bold(E) = 0, quad quad k := omega sqrt(epsilon_0 mu_0) = omega \/ c.
$
The electric field is divergence-free, so $curl curl = grad div - Delta$
reduces this to the vector Helmholtz equation
$
  Delta bold(E) + k^2 bold(E) = 0,
$
and each Cartesian component solves the scalar Helmholtz equation,
which is the starting point for plane-wave representations.
