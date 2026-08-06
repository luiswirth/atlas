#import "/src/setup.typ": *
#show: note

= Itô's Formula

$
  Delta B tilde.op sqrt(Delta t), quad (Delta B)^2 = Delta t.
$

$
  Delta f(B_t)
  &= f'(B_t) Delta B + 1/2 f''(B_t) (Delta B)^2 + O(abs(Delta B)^3) \
  &= f'(B_t) Delta B + 1/2 f''(B_t) Delta t + O(Delta t^(3\/2)) \
  dif f(B_t)
  &= f'(B_t) dif B_t + 1/2 f''(B_t) dif t.
$

The last line abbreviates
$
  f(B_t) = f(B_0) + integral_0^t f'(B_s) dif B_s + 1/2 integral_0^t f''(B_s) dif s,
$
which is the statement being proved, by partitions. The step $(Delta B)^2 = Delta t$ holds
only after summing, so the expansion above is a mnemonic for that proof and not a
substitute. Finite quadratic variation is all that enters, no other property of the path
and no probability.

== Multiplication table

$
  dif B^i dif B^j = delta^(i j) dif t, quad dif B dif t = 0, quad dif t dif t = 0.
$
So for
$
  dif X_t = b dif t + sigma dif B_t,
$
the chain rule reads
$
  dif f(X_t) = (b dot grad f + 1/2 tr(sigma sigma^transp hess f)) dif t + (grad f)^transp sigma dif B_t.
$
The $dif t$ coefficient is the generator $cal(L) f$ and the $dif B$ coefficient integrates to a
martingale, so
$
  f(X_t) - integral_0^t cal(L) f(X_s) dif s
$
is a martingale.
