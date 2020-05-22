

Prove Fib(n) is the nearest integer to ϕ^n / sqrt(5), ϕ = (1 + sqrt(5)) / 2, ψ = (1 - sqrt(5)) / 2


Tips: Prove `Fib(n) = (ϕ^n - ψ^n)/sqrt(5)`.

First step:

```
Fib(n + 1) = (ϕ^n * ϕ - ψ^n * ψ) / sqrt(5)
           = 1/2 * (Fib(n) + ϕ^n + ψ^n)

Fib(n + 2) = (ϕ^n * ϕ - ψ^n * ψ) / sqrt(5)
           = 3/2 * Fib(n) + 1/2 * (ϕ^n + ψ^n)

Fib(n + 2) = Fib(n) + Fib(n+1)

3/2 * Fib(n) + 1/2 * (ϕ^n + ψ^n) = Fib(n) + 1/2 * (Fib(n) + ϕ^n + ψ^n)

(ϕ^0 - ψ^0)/sqrt(5) = Fib(0) = 0
(ϕ^1 - ψ^1)/sqrt(5) = Fib(1) = 1
```
so `Fib(n) = (ϕ^n - ψ^n)/sqrt(5)` proved.

```
1/sqrt(5) < 1/2

|ψ| = |(1 - sqrt(5)) / 2| < 1

|ψ^n / sqrt(5)| < 1/2

|Fib(n) - ϕ^n/sqrt(5)| < 1/2

```

so Fib(n) is the nearest integer to ϕ^n/sqrt(5).




