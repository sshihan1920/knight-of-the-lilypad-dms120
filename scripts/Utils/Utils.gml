// Function for the discrete real exponentiation operator
function power_ext(base, pow) {
	if (base >= 0) return power(base, pow);
	b = pow;
	c = 1;
	while(b % 1 != 0) {
		b *= 10;
		c *= 10;
	}
	return power(-1, b) * power(abs(base), b/c);
}