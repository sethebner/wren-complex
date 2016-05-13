import "../complex" for Complex
import "please" for Please

// Test constructors
var zero = Complex.new()
Please.equal(zero.real, 0)
Please.equal(zero.imag, 0)
Please.equal(zero.magnitude, 0)
Please.equal(zero.angle, 0)
Please.equal(zero.conjugate, Complex.new(0, 0))

var c1 = Complex.new(4, 3)
Please.equal(c1.real, 4)
Please.equal(c1.imag, 3)
Please.equal(c1.magnitude, 5)
Please.equal(c1.conjugate, Complex.new(4, -3))

var c2 = Complex.new(-7)
Please.equal(c2.real, -7)
Please.equal(c2.imag, 0)
Please.equal(c2.magnitude, 7)
Please.equal(c2.angle, Num.pi)
Please.equal(c2.conjugate, Complex.new(-7, 0))

// Test +
Please.equal(zero + zero, zero)
Please.equal(zero + c1, c1)
Please.equal(zero + c2, c2)
Please.equal(c1 + c2, Complex.new(c1.real + c2.real, c1.imag + c2.imag))
Please.equal(zero + 5, Complex.new(5))
Please.equal(c1 + 10, Complex.new(c1.real + 10, c1.imag))

// Test -
Please.equal(zero - zero, zero)
Please.equal(c1 - zero, c1)
Please.equal(zero - c1, -c1)
Please.equal(c2 - zero, c2)
Please.equal(zero - c2, -c2)
Please.equal(c1 - c2, Complex.new(c1.real - c2.real, c1.imag - c2.imag))
Please.equal(zero - 5, Complex.new(-5))
Please.equal(c1 - 10, Complex.new(c1.real - 10, c1.imag))

// Test *
Please.equal(zero * zero, zero)
Please.equal(c1 * zero, zero)
Please.equal(c2 * zero, zero)
Please.equal(c1 * c2, Complex.new(-28, -21))
Please.equal(zero * 3, zero)
Please.equal(c1 * -2, Complex.new(c1.real * -2, c1.imag * -2))

// Test /
Please.equal(zero / zero, zero)
Please.equal(zero / c1, zero)
Please.equal(zero / c2, zero)
Please.equal(c1 / c2, Complex.new(-4/7, -3/7)) /* FIXME */
Please.equal(zero / 3, zero)
Please.equal(c1 / 2, Complex.new(c1.real / 2, c1.imag / 2))
Please.equal(c1 / 2, c1 * (1/2))

// Test ==, !=
Please.equal(true, zero == zero)
Please.equal(true, zero == -zero)
Please.equal(true, zero == zero.conjugate)
Please.equal(true, c1 == c1)
Please.equal(true, c2 == c2)
Please.equal(true, zero == Complex.new())
Please.equal(true, zero == Complex.new(0))
Please.equal(true, zero == Complex.new(0, 0))
Please.equal(false, zero != zero)
Please.equal(false, c1 != c1)
Please.equal(false, c2 != c2)
Please.equal(false, zero == c1)
Please.equal(false, zero == c2)
Please.equal(false, c1 == c2)

System.print("All tests passed.")
