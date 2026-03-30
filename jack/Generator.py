"""No comment"""
import sys
import Parser


class Generator:
    """No comment"""

    def __init__(self, file=None):
        if file is not None:
            self.parser = Parser.Parser(file)
            self.arbre = self.parser.jackclass()
            self.nameClass = self.arbre[0]['name']
            self.vmfile = open(self.arbre[0]['name'] + '.vm', "w")
            self.symbolClassTable = []
            self.symbolRoutineTable = []
            self.label_counter = 0
           

    def jackclass(self):
        """
            {'line': line, 'col': col, 'type': 'class', 'name': className,
            'varDec': [variable], 'subroutine':[subroutine]}
        """
        class_name = self.arbre[0]['name']

        for var in self.arbre[0]['class_vars']:
            self.variable(var)

        for subroutine in self.arbre[0]['subroutines']:
            self.subroutine(subroutine)



    def variable(self, var):
        """
        {'line': line, 'col': col, 'name': varName, 'kind': kind, 'type': type}
        """
        if not all(key in var for key in ('name', 'type', 'kind')):
            self.error(f"Variable mal formée : {var}")

        if var['kind'] in {'static', 'field'}:
            table = self.symbolClassTable
        else: 
            table = self.symbolRoutineTable

        for entry in table:
            if entry['name'] == var['name']:
                self.error(f"Variable déjà éxistante : {var['name']}")

        index = len([entry for entry in table if entry['kind'] == var['kind']])

        entry = {
            'name': var['name'],
            'type': var['type'],
            'kind': var['kind'],
            'index': index
        }

        table.append(entry)


    def subroutine(self, routine):
        """
        {'line':line, 'col': col,'type': 'constructor'|'function'|'method',
            'return' : 'void| 'int'|'char'|'boolean'|className',
            'name': subroutineName, 'argument': [variable],'local': [variable],
            'instructions' : [instruction]
        """

        subroutine_name = routine['name']
        subroutine_type = routine['subroutine_type']  
        return_type = routine['return_type']
        parameters = routine['parameters']['parameters']
        local_vars = routine['body']['local_vars']

        self.symbolRoutineTable = []

        if subroutine_type == 'method':
            self.symbolRoutineTable.append({
                'name': 'this',  
                'type': self.arbre[0]['name'],  
                'kind': 'argument',  
                'index': 0  
            })

        
        for i, param in enumerate(parameters, start=1 if subroutine_type == 'method' else 0):
            self.symbolRoutineTable.append({
                'name': param['name'],  
                'type': param['type'],  
                'kind': 'argument', 
                'index': i  
            })

        for var in local_vars:
            self.variable(var)

        num_locals = len(local_vars)
        self.vmfile.write(f"function {self.arbre[0]['name']}.{subroutine_name} {num_locals}\n")

        if subroutine_type == 'method':
            self.vmfile.write("push argument 0\n")  
            self.vmfile.write("pop pointer 0\n")  
        elif subroutine_type == 'constructor':
            num_fields = len([v for v in self.symbolClassTable if v['kind'] == 'field'])
            self.vmfile.write(f"push constant {num_fields}\n")  
            self.vmfile.write("call Memory.alloc 1\n")  
            self.vmfile.write("pop pointer 0\n")  

        for statement in routine['body']['statements']:
            self.statement(statement)

    def statement(self, inst):
        """
        statement : letStatements|ifStatement|whileStatement|doStatement|returnStatement
        """
        match inst['type']:
            case 'letStatement':
                self.letStatement(inst)
            case 'ifStatement':
                self.ifStatement(inst)
            case 'whileStatement':
                self.whileStatement(inst)
            case 'doStatement':
                self.doStatement(inst)
            case 'return':
                self.returnStatement(inst)
            case _:
                self.error(f"Type d'instruction inconnu : {inst['type']}")

        


    def letStatement(self, inst):
        """
        {'line':line, 'col': col,'type': 'let',
        'variable': varName, 'indice': expression, 'valeur': expression
        """
        if 'value_expression' not in inst or inst['value_expression'] is None:
            self.error("value_expression manquant dans letStatement.")

        value_expression = inst['value_expression']

        if inst['array_expression']:
            array_expression = inst['array_expression']  
            var_entry = next(
                (v for v in self.symbolRoutineTable + self.symbolClassTable if v['name'] == inst['var_name']),
                None)
            if not var_entry:
                self.error(f"Variable {inst['var_name']} non trouvée.")

            segment = {
                'static': 'static',
                'field': 'this',
                'local': 'local',
                'argument': 'argument'
            }[var_entry['kind']]
            self.vmfile.write(f"push {segment} {var_entry['index']}\n")  
            self.expression(array_expression)  
            self.vmfile.write("add\n")  

            self.expression(value_expression)
            self.vmfile.write("pop temp 0\n")  

            self.vmfile.write("pop pointer 1\n")
            self.vmfile.write("push temp 0\n")
            self.vmfile.write("pop that 0\n")

        else:
            var_entry = next(
                (v for v in self.symbolRoutineTable + self.symbolClassTable if v['name'] == inst['var_name']),
                None)
            if not var_entry:
                self.error(f"Variable {inst['var_name']} non trouvée.")

            if value_expression['type'] in {'integerConstant', 'varName', 'keywordConstant', 'stringConstant'}:
                self.term(value_expression)
            elif value_expression['type'] == 'expression':
                self.expression(value_expression)
            elif value_expression['type'] == 'unaryOp':
                operator = value_expression['operator']
                term = value_expression['term']
                self.term(term)
                if operator == '-':
                    self.vmfile.write("neg\n")
                elif operator == '~':
                    self.vmfile.write("not\n")
            elif value_expression['type'] == 'binaryOp':  
                left = value_expression['left']
                operator = value_expression['operator']
                right = value_expression['right']
                self.term(left)
                self.term(right)
                self.vmfile.write({
                                      '+': 'add',
                                      '-': 'sub',
                                      '*': 'call Math.multiply 2',
                                      '/': 'call Math.divide 2',
                                      '&': 'and',
                                      '|': 'or',
                                      '<': 'lt',
                                      '>': 'gt',
                                      '=': 'eq',
                                  }[operator] + "\n")
            elif value_expression['type'] == 'subroutineCall':
                self.subroutineCall(value_expression)

            segment = {
                'static': 'static',
                'field': 'this',
                'local': 'local',
                'argument': 'argument'
            }[var_entry['kind']]
            self.vmfile.write(f"pop {segment} {var_entry['index']}\n")




    def ifStatement(self, inst):
        """
        {'line':line, 'col': col,
        'type': 'if', 'condition': expression, 'true': [instruction],
        'false': [instruction]}
        """
        label_true = f"IF_TRUE{self.label_counter}"
        label_end = f"IF_END{self.label_counter}"
        self.label_counter += 1

        self.expression(inst['condition'])
        
        # --- CORRECTION : UNE SEULE LIGNE ---
        self.vmfile.write(f"if-goto {label_true}\n")
        # ------------------------------------

        if inst['else_statements']:
            self.statement_list(inst['else_statements'])

        self.vmfile.write(f"goto {label_end}\n")

        self.vmfile.write(f"label {label_true}\n")
        self.statement_list(inst['if_statements'])

        self.vmfile.write(f"label {label_end}\n")

    def whileStatement(self, inst):
        """
        {'line':line, 'col': col,
        'type': 'while', 'condition': expression,
        'instructions': [instruction]}
        """
        while_counter = self.label_counter
        self.label_counter += 1

        label_start = f"WHILE_EXP{while_counter}"
        label_end = f"WHILE_END{while_counter}"

        self.vmfile.write(f"label {label_start}\n")

        self.expression(inst['condition'])
        self.vmfile.write("not\n")  
        self.vmfile.write(f"if-goto {label_end}\n")  

        for statement in inst['statements']:
            self.statement(statement)

        self.vmfile.write(f"goto {label_start}\n")

        self.vmfile.write(f"label {label_end}\n")


    def doStatement(self, inst):
        """
        {'line':line, 'col': col,
        'type': 'do', 'classvar': className ou varName,
        'name': subroutineName, 'argument': [expression]}
        """
        self.subroutineCall(inst['subroutine'])
        self.vmfile.write("pop temp 0\n")

    def returnStatement(self, inst):
        """
        {'line':line, 'col': col, 'type': 'return', 'valeur': expression}
        """
        if inst.get('value'):  
            self.expression(inst['value'])  
        else:
            self.vmfile.write("push constant 0\n")  
        self.vmfile.write("return\n")

    def expression(self, exp):
        """
        [term op ...]
            avec op : '+'|'-'|'*'|'/'|'&'|'|'|'<'|'>'|'='
        """

        if 'value' in exp and exp['type'] == 'expression':
            exp = exp['value']  

        # Cas : Accès à un tableau
        if isinstance(exp, dict) and exp.get('type') == 'arrayAccess':
            self.handleArrayAccess(exp)
            return

        # Cas : Constantes, variables ou termes simples
        if exp['type'] in {'varName', 'integerConstant', 'stringConstant', 'keywordConstant'}:
            self.term(exp)  
            return

        # Cas : Opérateurs unaires
        if exp['type'] == 'unaryOp':
            operator = exp['operator']
            term = exp['term']
            self.term(term)  
            if operator == '-':
                self.vmfile.write("neg\n")
            elif operator == '~':
                self.vmfile.write("not\n")
            else:
                raise ValueError(f"Opérateur unaire inconnu : {operator}")
            return

        # Cas : Appel de sous-routine
        if exp['type'] == 'subroutineCall':
            self.subroutineCall(exp) 
            return

        # Cas : Expressions complexes avec opérateurs binaires
        if 'parts' in exp:
            parts = exp['parts']
            if len(parts) % 2 == 0:
                raise ValueError("Expression mal formée : nombre pair d'éléments dans 'parts'.")

            self.term(parts[0])

            for i in range(1, len(parts), 2):
                operator = parts[i]
                next_term = parts[i + 1]

                self.term(next_term)

                op_map = {
                    '+': "add\n",
                    '-': "sub\n",
                    '*': "call Math.multiply 2\n",
                    '/': "call Math.divide 2\n",
                    '&': "and\n",
                    '|': "or\n",
                    '<': "lt\n",
                    '>': "gt\n",
                    '=': "eq\n"
                }
                if operator in op_map:
                    self.vmfile.write(op_map[operator])
                else:
                    raise ValueError(f"Opérateur inconnu : {operator}")
        else:
            raise ValueError(f"Expression mal formée ou inconnue : {exp}")



    def term(self, t):
        """
        {'line':line, 'col': col,
        'type': 'int'| 'string'| 'constant'| 'varName'|'call'| 'expression'|'-'|'~',
         'indice':expression, 'subroutineCall': subroutineCall}
        """

        if isinstance(t, dict):
            if t['type'] == 'keywordConstant':
                # Traitement des constantes mot-clés
                if t['value'] == 'true':
                    self.vmfile.write("push constant 1\n")
                    self.vmfile.write("neg\n")  # true est représenté par -1
                elif t['value'] in {'false', 'null'}:
                    self.vmfile.write("push constant 0\n")  # false et null sont identiques
                elif t['value'] == 'this':
                    self.vmfile.write("push pointer 0\n")  # this est représenté par pointer[0]
            elif t['type'] == 'integerConstant':
                self.vmfile.write(f"push constant {t['value']}\n")
            elif t['type'] == 'stringConstant':
                self.handleStringConstant(t['value'][1:-1])  # Enlève les guillemets
            elif t['type'] == 'varName':
                var_entry = next(
                    (v for v in self.symbolRoutineTable + self.symbolClassTable if v['name'] == t['value']), None)
                if not var_entry:
                    self.error(f"Variable {t['value']} non trouvée.")
                segment = {
                    'static': 'static',
                    'field': 'this',
                    'local': 'local',
                    'argument': 'argument'
                }[var_entry['kind']]
                self.vmfile.write(f"push {segment} {var_entry['index']}\n")
            elif t['type'] == 'unaryOp':
                self.term(t['term'])
                if t['operator'] == '-':
                    self.vmfile.write("neg\n")
                elif t['operator'] == '~':
                    self.vmfile.write("not\n")
            elif t['type'] == 'expression':
                self.expression(t)
            elif t['type'] == 'subroutineCall':
                self.subroutineCall(t)
            elif t['type'] == 'arrayAccess':
                # Gestion des accès aux tableaux
                self.handleArrayAccess(t)
            else:
                self.error(f"Type de terme inconnu : {t['type']}")
        else:
            self.error(f"Objet inattendu dans term : {t}")

    def subroutineCall(self, call):
        """
        {'line':line, 'col': col, 'classvar': className ou varName,
        'name': subroutineName, 'argument': [expression]}
        """

        class_or_var = call['classOrVar']  
        subroutine_name = call['subroutineName']  
        arguments = call['arguments']  
        num_args = 0  

        if class_or_var:
            var_entry = next(
                (x for x in self.symbolRoutineTable + self.symbolClassTable if x['name'] == class_or_var),
                None
            )

            if var_entry:
                segment = {
                    'static': 'static',
                    'field': 'this',
                    'local': 'local',
                    'argument': 'argument'
                }[var_entry['kind']]
                self.vmfile.write(f"push {segment} {var_entry['index']}\n")
                num_args += 1
                class_name = var_entry['type']  
            else:
                
                class_name = class_or_var
        else:
            
            self.vmfile.write("push pointer 0\n")
            num_args += 1
            class_name = self.arbre[0]['name'] 

        for arg in arguments:
            self.expression(arg)
            num_args += 1

        self.vmfile.write(f"call {class_name}.{subroutine_name} {num_args}\n")


    def statement_list(self, statements):
        """
        Gère une liste d'instructions Jack et génère le code VM correspondant.
        :param statements: Liste de dictionnaires représentant les instructions.
        """
        for statement in statements:
            self.statement(statement)


    def handleStringConstant(self, string):
        """
        Gère les chaînes de caractères en générant le code VM pour créer et initialiser la chaîne.
        :param string: La chaîne de caractères à traiter (type `str`).
        """
      
        if not isinstance(string, str):
            raise ValueError(f"Invalid string constant: {string}")

        
        self.vmfile.write(f"push constant {len(string)}\n")  
        self.vmfile.write("call String.new 1\n") 

  
        for char in string:
            ascii_value = ord(char)  
            self.vmfile.write(f"push constant {ascii_value}\n")  
            self.vmfile.write("call String.appendChar 2\n")  

    def handleArrayAccess(self, t):
        """
        Génère le code VM pour un accès à un tableau.
        :param t: Dictionnaire représentant un accès à un tableau.
            {
                'varName': 'nomDuTableau',
                'index': dict,  # Expression représentant l'indice
                'isAssignment': bool  # Indique si c'est une affectation (optionnel)
            }
        """
        var_name = t['varName']
        index_expression = t['index']

        var_entry = next((v for v in self.symbolRoutineTable + self.symbolClassTable if v['name'] == var_name), None)
        if not var_entry:
            raise ValueError(f"Variable {var_name} non trouvée.")
        if var_entry['type'] != 'Array':
            raise TypeError(f"Variable {var_name} n'est pas de type Array.")

        segment = {
            'static': 'static',
            'field': 'this',
            'local': 'local',
            'argument': 'argument'
        }[var_entry['kind']]
        self.vmfile.write(f"push {segment} {var_entry['index']}\n")  

        self.expression(index_expression)  
        self.vmfile.write("add\n")  

        if t.get('isAssignment', False):  
            self.vmfile.write("pop pointer 1\n")
            self.vmfile.write("pop that 0\n")
        else:  
            self.vmfile.write("pop pointer 1\n")
            self.vmfile.write("push that 0\n")



    def error(self, message=''):
        print(f"SyntaxError: {message}")
        exit()


if __name__ == '__main__':
    file = sys.argv[1]
    print('-----debut')
    generator = Generator(file)
    generator.jackclass()
    print('-----fin')
