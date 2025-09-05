import fonctions as f 
while True:
	try:
		a=int(input("entrer la premiere valeur\n"))
		b=int(input("entrer la seconde valeur\n"))
		res = f.puissance(a,b)
		print(res)
	except ValueError:
		print("erreur")

"""try:
	a=int(input("entrer la premiere valeur\n"))
	b=int(input("entrer la seconde valeur\n"))
	res = f.puissance(a,b)

except SomeException:
	print("Erreur : division par zéro interdite.")

else:
	print(res)

finally:
	print ("fin du programme")
"""

