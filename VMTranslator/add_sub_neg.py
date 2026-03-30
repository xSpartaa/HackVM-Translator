def _commandadd(self,command):
	"Dépile les 2 dernière valeurs et empile le résultat de leur addition"
	return f"""\t//
	// on dépile la première  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on récupère la deuxième valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la dernière position
	@SP
	M=M+1
	\n"""

def _commandsub(self,command):
	"Dépile les 2 dernière vvaleur et empile le résultat de leur soustraction"
	return f"""\t//
	// on dépile la première  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on récupère la deuxième valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la dernière position
	@SP
	M=M+1
	\n"""

def _commandneg(self,command):
	"Récupère la valeur située au sommet de la pile et lui afecte sa valeur négatif"
	return f"""\t//
	// on récupère valeur stocker au sommet de la pile qu'on afecte a D, multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	A=D
	A=D+A
	D=D-A
	@SP
	A=M
	M=D
	\n"""
