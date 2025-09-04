def puissance(a,b):
	x = -1
	if x < 0:
		raise Exception("desole, pas de chiffre en dessous de 0")

	if not type(a) is int:
		raise TypeError("Only integers are allowed")

	if not type(b) is int:
		raise TypeError("Only integers are allowed")
	return a**b 


