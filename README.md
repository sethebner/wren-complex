# wren-complex
A module that implements complex numbers for the [Wren programming language](https://munificent.github.io/wren/).

```dart
    import "complex" for Complex
    var zero = Complex.new()
    zero.toString // "0 + 0i"

    var z = Complex.new(1, 2)
    z.toString // "1 + 2i"
    z.conjugate.toString // "1 - 2i"
```

## Running tests
To run tests, run this:

```dart
    wren test/test.wren
```