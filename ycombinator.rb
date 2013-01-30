y = ->(f) {
  (
    ->(x) { f.( ->(v) { x.(x).(v) } ) }
  ).(
    ->(x) { f.( ->(v) { x.(x).(v) } ) }
  )
}

factorial = y.(
  ->(factorial) {
    ->(n) { n == 0 ? 1 : n * factorial.(n - 1) }
  }
)

fib = y.(
  ->(fib) {
    ->(n) {
      (n == 0 or n == 1) ? 1 : fib.(n - 1) + fib.(n - 2)
    }
  }
)
