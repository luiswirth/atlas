#import "/src/setup.typ": *
#show: note

= The Itô Integral

Brownian paths have infinite total variation, so
$
  integral_0^T H_s dif B_s
$
is no Riemann-Stieltjes integral for any fixed path. They have finite quadratic variation,
so the repair happens in $L^2(Omega)$ rather than pathwise.

Defined on step processes and extended by density. For $H$ adapted, piecewise constant,
$
  integral_0^T H_s dif B_s := sum_i H_(t_i) (B_(t_(i+1)) - B_(t_i)).
$
The left endpoint makes $H_(t_i)$ known before its own increment, so every term is a
martingale increment. Distinct terms are then orthogonal and the squares add:
$
  EE[integral_0^T H_s dif B_s] = 0,
  quad
  EE[(integral_0^T H_s dif B_s)^2] = integral_0^T EE[H_s^2] dif s.
$
This is the Itô isometry, an isometry
$
  L^2([0,T] times Omega) -> L^2(Omega)
$
on adapted integrands. Step processes are dense and an isometry is uniformly continuous,
so the definition extends uniquely to all adapted $H$ with $integral EE[H^2] < infinity$.
The isometry is used to construct the integral, before it is a property of it.
