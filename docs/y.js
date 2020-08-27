// Common recursion function with a name.
var fib = (n) => {
  return n <= 2 ? n : (fib(n - 1) + fib(n - 2))
}
// Step 1: add a level of abstraction and make `fib` as an argument.
(function (fib) {
  return function (n) {
    n <= 2 ? n :
      (fib(n - 1) + fib(n - 2))
  }
});

// Step 2: copy itself and pass it as an argument.
(function (fib) {
  return function (n) {
    return n <= 2 ? n :
      (fib(n - 1) + fib(n - 2))
  }
})(function (fib) {
  return function (n) {
    return n <= 2 ? n :
      (fib(n - 1) + fib(n - 2))
  }
});

// Step 3: `fib`'s first argument must be itself.
(function (fib) {
  return function (n) {
    return n <= 2 ? n :
      (fib(fib)(n - 1) + fib(fib)(n - 2))
  }
})(function (fib) {
  return function (n) {
    return n <= 2 ? n :
      (fib(fib)(n - 1) + fib(fib)(n - 2))
  }
});

// Step 4: Extract the outer self-application part.
(function (u) {
  return u(u);
})(function (fib) {
  return function (n) {
    return n <= 2 ? n :
      (fib(fib)(n - 1) + fib(fib)(n - 2))
  }
});

// Step 5: Extract the inner self-application parts.
// And because Javascript is a call-by-value language, 
// we must change `fib(fib)` to `fib(fib)(v)` or it
// will cause maximum call stack error.
(function (u) {
  return u(u);
})(function (fib) {
  return (function (g) {
    return function (n) {
      return n <= 2 ? n :
        (g(n - 1) + g(n - 2))
    }
  })(function (v) {
    return fib(fib)(v);
  })
});

// Step 6: Extract the real algorithm part.
(function (f) {
  // Here is the real Y Combinator !
  return (function (u) {
    return u(u);
  })(function (fib) {
    return (f(function (v) {
      return fib(fib)(v);
    }))
  })
})(function (g) {
  return function (n) {
    return n <= 2 ? n :
      (g(n - 1) + g(n - 2))
  }
});
// Let's change the Y combinator to a familiar format.
// Replace the `u(u)` part with its argument.
// In lambda calculus format: 
// lambda y. (lambda x. y (x x)) (lambda x. y (x x))
var Y = function (y) {
  return (function (x) {
    return (y(function (v) {
      return x(x)(v);
    }))
  })(function (x) {
    return (y(function (v) {
      return x(x)(v);
    }))
  })
};