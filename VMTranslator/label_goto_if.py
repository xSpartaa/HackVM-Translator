class Statements :
	id_counter = 0
	
	def _commandlabel(self, command):
		"""Recupère le parametre de la fonction et empile le local """
		parameter = command['label']
		return f"""\t//
		({parameter})
		\n"""

	def _commandgoto(self, command):
		"""Recupère le parametre de la fonction et empile le local """
		parameter = command['label']
		return f"""\t//
		@{parameter}
		0;JMP
		\n"""

	def _commandifgoto(self, command):
		"""Recupère le label et fait un saut conditionnel avec un label de sortie unique"""
		parameter = command['label']

		unique_id = self.id_counter
		self.id_counter += 1

		return f"""\t// if-goto {parameter}
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.{unique_id}  
		D;JEQ       
		@{parameter} 
		0;JMP       

		(ENDIFGOTO.{unique_id}) 
		\n"""