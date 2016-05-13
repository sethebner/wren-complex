class Complex {
	construct new() {
		_real = 0
		_imag = 0
		_mag = 0
		_angle = 0
	}

	construct new(real) {
		_real = real
		_imag = 0
		_mag = real.abs
		_angle = imag.atan(real)
	}

	construct new(real, imag) {
		_real = real
		_imag = imag
		_mag = ((real * real) + (imag * imag)).sqrt
		_angle = imag.atan(real)
	}

	real { _real }
	imag { _imag }
	magnitude { _mag }
	angle { _angle }
	conjugate { Complex.new(real, -imag) }
	
	+(other) {
		var result
		if (other is Num) {
			result = Complex.new(real + other, imag)
		} else if (other is Complex) {
			result = Complex.new(real + other.real, imag + other.imag)
		} else {
			result = Complex.new()
		}
		return result
	}

	- { Complex.new(-real, -imag) }
	-(other) { this + -other }
	*(other) {
		var result
		if (other is Num) {
			result = Complex.new(real * other, imag * other)
		} else if (other is Complex) {
			result = Complex.new((real * other.real) - (imag * other.imag), (real * other.imag) + (imag * other.real))
		} else {
			result = Complex.new()
		}
		return result
	}
	
	/(other) {
		var result
		if (other is Num) {
			if (other != 0) {
				result = this * (1 / other)
			} else {
				result = Complex.new()
			}
		} else if (other is Complex) {
			if (other.magnitude > 0) {
				result = Complex.new(((real * other.real) + (imag * other.imag)) / (other.magnitude * other.magnitude), ((imag * other.real) - (real * other.imag)) / (other.magnitude * other.magnitude))
			} else {
				result = Complex.new()
			}
		} else {
			result = Complex.new()
		}
		return result
	}

	==(other) { (real == other.real) && (imag == other.imag) }
	!=(other) { !(this == other) }
	
	toString {
		var result
		if (this.imag >= 0) {
			result = "%(_real) + %(_imag)i"
		} else {
			result = "%(_real) - %(-_imag)i"
		}
		return result
	}
	
	print() { System.print(toString) }
}
