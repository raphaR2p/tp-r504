def puissance(a,b):
	if not type(a) is int:
		raise TypeError("Only integers are allowed")

	if not type(b) is int:
		raise TypeError("Only integers are allowed")


	if a == 0 and b < 0:
		raise ZeroDivisionError("division de 0 impossible ")

	result = 1

	if b == 0:
		return 1 

	elif b > 0:
		for _ in range(b):
			result *= a
		return result

	else: # b < 0
		for _ in range(-b):
			result *= a
		return 1 / result
