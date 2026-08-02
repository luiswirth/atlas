#import "/src/setup.typ": *
#show: note

= Waves

== Physics

Acoustic (scalar wave) or Maxwell (vector wave)

Obtain Wave Equation by elminating variables.

== Wave Equation to Helmoltz Equation

Wave equation
$
  nabla^2 u - 1/c^2 (partial^2 u)/(partial t^2) = 0
$

Assume steady state
$u(x,t) = U(x) e^(-i omega t)$

Obtain Helmholtz
$
  nabla^2 U + k^2 U = 0
$
with wavenumber $k = omega/c$


== Phenomena


Radiation: Forcing. Inhomogeneous equation.
Scattering: Incoming wave hitting passive object. Boundary conditions.

== Acoustics

Acoustics is the physics of pressure fluctuations in a fluid.

Derivation:
- Conservation of Mass $(partial rho)/(partial t) + nabla dot (rho v) = 0$
- Euler's Equation (Momentum): $rho (partial v)/(partial t) = -nabla p$
- State Equation $p = c^2 rho$

Wave Equation
$
  nabla^2 p - 1/c^2 (partial^2 p)/(partial t^2) = 0
$
