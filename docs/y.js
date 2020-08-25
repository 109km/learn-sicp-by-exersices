const fib = (n) => {
  n <= 2 ? n : (fib(n - 1) + fib(n - 2))
}

console.log((f =>
  n =>
    n <= 2 ?
      1
      :
      f(f)(n - 1) + f(f)(n - 2)
)(
  f =>
    n =>
      n <= 2 ? 1 : f(f)(n - 1) + f(f)(n - 2)
)(5)) // 5

// λf.(λx.(f (x x)) λx.(f (x x)))

function outer(f) {

}

console.log(
  (f =>
    (g =>
      f(x => g(g)(x))
    )
      (g =>
        f(x => g(g)(x))
      )
  )
    (f => n => n <= 2 ? 1 : f(n - 1) + f(n - 2))
    (3) // 2
);



