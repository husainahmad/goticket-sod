package util

type Rounding struct {
}

func (Rounding) RoundHalfDownInt(value int) int {
	defaultValue := 10
	if value <= 10 {
		return defaultValue
	}
	quotient := value % defaultValue
	var finalValue = value - quotient

	if quotient > 5 {
		finalValue = (value - quotient) + defaultValue
	}

	return finalValue
}
