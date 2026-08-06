#import "/src/setup.typ": *
#show: note

= Bayesian Linear Regression

Start from a basis expansion, where finding the optimal coefficients is least squares.
Weight space is feature space and kernel space is function space,
two readings of the same object.

Bayesian linear regression is uncertainty quantification for least squares.
Take regularized least squares,
$
  min_avec(c) norm(amat(A) avec(c) - avec(b))^2 + lambda norm(avec(c))^2,
$
put a Gaussian prior $avec(c) tilde cal(N)(0, sigma_c^2 amat(I))$
and a Gaussian likelihood on the residual.
The posterior mean over $avec(c)$ is the regularized least squares solution
with $lambda = sigma^2 \/ sigma_c^2$,
which is Tikhonov regularization read as the ratio of noise variance to prior variance.
The marginal likelihood then selects $lambda$, rather than it being tuned by hand.

Bayesian linear regression with a finite feature map and a Gaussian prior on the weights
is a Gaussian process with kernel
$
  k(avec(x), avec(y)) = psi(avec(x))^transp Sigma psi(avec(y)),
$
which is finite-rank, hence degenerate.
A Gaussian process is more general, admitting any valid kernel
including infinite-dimensional ones,
and weight-space regression is the special case of a finite-rank kernel.
