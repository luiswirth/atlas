#import "/src/setup.typ": *
#show: note

= Collocation and Galerkin

Two ways of turning an equation into finitely many conditions.

Collocation enforces the equation, whether the PDE or a boundary condition,
by pointwise evaluation at discrete points.
With more points than variables this is least squares on the residual,
with as many points as variables it is a linear system, an exact interpolation.
The finite difference method is collocation.

Galerkin enforces the equation in the weak integral sense.
Multiply the residual by test functions and require the integral to vanish
for all of them, so that the residual is orthogonal to the test space.
The finite element method is Galerkin.

Starting from
$
  min_u J(u) = norm(L u - f)^2 = integral (L u - f)^2 dif x,
$
the normal equation is $L^* L u = L^* f$,
or, written with test functions and the adjoint,
$inner(L u, L v) = inner(f, L v)$,
which is Galerkin with the test functions run through $L$.
