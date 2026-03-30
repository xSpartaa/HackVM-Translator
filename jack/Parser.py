import sys
import Lexer
import todot


class Parser:
    """No comment"""

    def __init__(self, file):
        self.lexer = Lexer.Lexer(file)

    def jackclass(self):
        """
        class: 'class' className '{' classVarDec* subroutineDec* '}'
        """

        self.process('class')
        class_name = self.className() 
        self.process('{')

        class_vars = []
        while self.lexer.hasNext() and self.lexer.look()['token'] in {'static', 'field'}:
            class_vars += self.classVarDec()

        subroutines = []
        while self.lexer.hasNext() and self.lexer.look()['token'] in {'constructor', 'function', 'method'}:
            subroutines.append(self.subroutineDec())

        self.process('}')


        return [{
            'type': 'class',
            'name': class_name,
            'class_vars': class_vars,
            'subroutines': subroutines
        }]


    def classVarDec(self):
        """
        classVarDec: ('static'| 'field') type varName (',' varName)* ';'
        """
        if self.lexer.look()['token'] in {'static', 'field'}:
            kind = self.lexer.next()['token']  
        else:
            self.error(self.lexer.next())

        if self.lexer.look()['token'] in {'int', 'char', 'boolean'}:
            var_type = self.lexer.next()['token']  
        elif self.lexer.look()['type'] == 'identifier':
            var_type = self.lexer.next()['token']  
        else:
            self.error(self.lexer.next())

        name = self.varName()

        res = [{
            'type': var_type,
            'kind': kind,
            'name': name
        }]

        while self.lexer.look()['token'] == ',':
            self.process(',') 
            name = self.varName() 
            res.append({
                'type': var_type,
                'kind': kind,
                'name': name
            })

        self.process(';') 

        return res
    def type(self):
        """
        type: 'int'|'char'|'boolean'|className
        """
        if self.lexer.hasNext() and self.lexer.look()['token'] in {'int','char','boolean','className'}:
            return self.lexer.next()
        else:
            self.error(self.lexer.next())

    def subroutineDec(self):
        """
        subroutineDec: ('constructor'| 'function'|'method') ('void'|type)
        subroutineName '(' parameterList ')' subroutineBody
        """
        subroutine_type = self.lexer.next()['token']  
        return_type = self.lexer.next()['token']  
        name = self.lexer.next()['token']  

        self.process('(')
        parameters = self.parameterList() 
        self.process(')')
        body = self.subroutineBody()  

        return {
            'type': 'subroutineDec',
            'subroutine_type': subroutine_type,
            'return_type': return_type,
            'name': name,
            'parameters': parameters,
            'body': body
        }

    def parameterList(self):
        """
        parameterList: ((type varName) (',' type varName)*)?
        """
        parameters = []

        while self.lexer.hasNext() and self.lexer.look()['token'] != ')':
            if self.lexer.look()['token'] in {'void', 'char', 'int', 'boolean'}:
                param_type = self.lexer.next()['token']
                param_name = self.varName()
                parameters.append({'type': param_type, 'kind': 'argument','name': param_name})
            else:
                if self.lexer.look()['type'] != 'identifier':
                    self.error(self.lexer.next())
                else:
                    param_type = self.lexer.next()['token']
                    param_name = self.varName()
                    parameters.append({'type': param_type, 'kind': 'argument', 'name': param_name})



            if self.lexer.look()['token'] == ',':
                self.process(',')

        return {
            'type': 'parameterList',
            'parameters': parameters
        }
    

    def subroutineBody(self):
        """
        subroutineBody: '{' varDec* statements '}'
        """
        self.process('{')  
        
        local_vars = []
        while self.lexer.hasNext() and self.lexer.look()['token'] == 'var':
            local_vars+=self.varDec()  

        
        statements = []
        while self.lexer.hasNext() and self.lexer.look()['token'] in {'let', 'if', 'while', 'do', 'return'}:
            statements.append(self.statement())  

        self.process('}')  

        
        return {
            'local_vars': local_vars,  
            'statements': statements  
        }

    def varDec(self):
        """
        varDec: 'var' type varName (',' varName)* ';'
        """
        self.process('var')

        if self.lexer.look()['token'] in {'int', 'char', 'boolean'}:
            var_type = self.lexer.next()['token']
        elif self.lexer.look()['type'] == 'identifier':
            var_type = self.lexer.next()['token']
        else:
            self.error(self.lexer.next())

        name = self.varName()
        res = [{
            'type': var_type,
            'kind': 'local',
            'name': name  
        }]

        
        while self.lexer.look()['token'] == ',':
            self.process(',')
            name = self.varName()  
            res.append({
                'type': var_type,
                'kind': 'local',
                'name': name  
            })

        self.process(';')

        return res

    def className(self):
        """
        className: identifier
        """
        if self.lexer.hasNext() and self.lexer.look()['type'] == 'identifier':
            print(self.lexer.look())
            return self.lexer.next()['token']
        else:
            self.error(self.lexer.next())

    def subroutineName(self):
        """
        subroutineName: identifier
        """
        if self.lexer.look() is not None and self.lexer.look()['type'] == 'identifier':
            print(self.lexer.look())
            return self.lexer.next()['token']
        else:
            self.error(self.lexer.next())

    def varName(self):
        """
        varName: identifier
        """
        if self.lexer.look() is not None and self.lexer.look()['type'] == 'identifier':
            print(self.lexer.look())
            return self.lexer.next()['token']
        else:
            self.error(self.lexer.next())

    def statements(self):
        """
        statements : statements*
        """
        statements=[]
        while self.lexer.hasNext() and self.lexer.look()['token'] in {'let', 'if', 'while', 'do', 'return'}:
            statements.append(self.statement())
        return statements
    
    def statement(self):
        """
        statement : letStatements|ifStatement|whileStatement|doStatement|returnStatement
        """
        token = self.lexer.look()['token']

        if token == 'let':
            return self.letStatement()
        elif token == 'if':
            return self.ifStatement()
        elif token == 'while':
            return self.whileStatement()
        elif token == 'do':
            return self.doStatement()
        elif token == 'return':
            return self.returnStatement()
        else:
            self.error(self.lexer.next())

    def letStatement(self):
        """
        letStatement : 'let' varName ('[' expression ']')? '=' expression ';'
        """
        self.process('let')
        var_name = self.varName()

        array_expression = None
        if self.lexer.look()['token'] == '[':
            self.process('[')
            array_expression = self.expression()
            self.process(']')


        if self.lexer.look2()['type'] == 'identifier':
            self.process('=')
            if self.lexer.look2()['token'] in {'+', '-', '*', '/', '&', '|', '<', '>', '='}:
                value_expression = self.expression()
                self.process(';')

            elif self.lexer.look2()['token'] == ';':
                value_expression = {
                    'type': 'varName',
                    'value': self.varName()
                }
                self.process(';')

            elif self.lexer.look2()['token'] == '[':
                value_expression = self.expression()
                self.process(';')

            else:

                value_expression = self.subroutineCall()
                self.process(';')
        else:
            self.process('=')
            value_expression = self.expression()
            self.process(';')


        return {
            'type': 'letStatement',
            'var_name': var_name,
            'array_expression': array_expression,
            'value_expression': value_expression
        }

    def ifStatement(self):
        """
        ifStatement : 'if' '(' expression ')' '{' statements '}' ('else' '{' statements '}')?
        """
        self.process('if')
        self.process('(')

        exp = self.expression()

        self.process(')')
        self.process('{')

        if_statements = self.statements()

        self.process('}')

        else_statements = None
        if self.lexer.look()['token'] == 'else':
            self.process('else')
            self.process('{')
            else_statements = self.statements()
            self.process('}')

        return {
            'type': 'ifStatement',
            'condition': exp,
            'if_statements': if_statements,
            'else_statements': else_statements

        }
    def whileStatement(self):
        """
        whileStatement : 'while' '(' expression ')' '{' statements '}'
        """
        self.process('while')
        self.process('(')
        condition = self.expression()
        self.process(')')
        self.process('{')
        while_statements = self.statements()
        self.process('}')

        return {
            'type': 'whileStatement',
            'condition': condition,
            'statements': while_statements

        }


    def doStatement(self):
        """
        doStatement : 'do' subroutineCall ';'
        """
        self.process('do') 

        subroutine = self.subroutineCall()  

        if self.lexer.look()['token'] != ';':
            raise SyntaxError(f"Expected ';' after do statement, found {self.lexer.look()}")
        self.process(';')

        return {
            'type': 'doStatement',
            'subroutine': subroutine
        }
    
    def returnStatement(self):
        """
        returnStatement : 'return' expression? ';'
        """
        self.process('return')

        if self.lexer.look()['token'] != ';':
            valeur = self.expression()

        else:
            valeur = None

        self.process(';')

        if valeur != None:
            return {
                'type': 'return',
                'value': valeur
            }
        else:
            return {
                'type': 'return'
            }
    def expression(self):
        """
        expression : term (op term)*
        """
        first_term = self.term()
        expression_parts = [first_term]  # Stocker l'expression pour la construction

        # Analyser les opérations suivantes et leurs termes
        while self.lexer.hasNext() and self.lexer.look()['token'] in {'+', '-', '*', '/', '&', '|', '<', '>', '='}:
            operator = self.op()  # Récupérer l'opérateur
            next_term = self.term()  # Analyser le terme suivant
            expression_parts.append(operator['token'])  # Ajouter l'opérateur
            expression_parts.append(next_term)  # Ajouter le terme suivant

        # Si l'expression est un seul terme, renvoie-le directement
        if len(expression_parts) == 1:
            return expression_parts[0]

        # Retourner une structure représentant l'expression
        return {
            'type': 'expression',
            'parts': expression_parts
        }
    def term(self):
        """
        term : integerConstant|stringConstant|keywordConstant
                |varName|varName '[' expression ']'|subroutineCall
                | '(' expression ')' | unaryOp term
        """

        token = self.lexer.look()  # Regarder le prochain token

        # Integer constant
        if token['type'] == 'IntegerConstant':
            self.lexer.next()
            return {
                'type': 'integerConstant',
                'value': token['token']
            }

        elif token['type'] == 'StringConstant':
            self.lexer.next()
            return {
                'type': 'stringConstant',
                'value': token['token']
            }

        elif token['type'] == 'keyword' and token['token'] in {'true', 'false', 'null', 'this'}:
            self.lexer.next()
            return {
                'type': 'keywordConstant',
                'value': token['token']
            }

        elif token['token'] == '(':
            self.process('(')
            expression = self.expression()
            self.process(')')
            return {'type': 'expression', 'value': expression}

        elif token['token'] in {'-', '~'}:
            unary_op = self.lexer.next()['token']  
            term = self.term()
            return {'type': 'unaryOp', 'operator': unary_op, 'term': term}

        elif token['type'] == 'identifier':
            # 1. On consomme le nom tout de suite (ex: "gamePanel" ou "i")
            id_token = self.lexer.next()
            identifier = id_token['token']

            # 2. On regarde ce qui suit
            next_token = self.lexer.look()['token']

            # CAS A : C'est un tableau -> arr[i]
            if next_token == '[':
                self.process('[')
                index_expression = self.expression()
                self.process(']')
                return {
                    'type': 'arrayAccess',
                    'varName': identifier,
                    'index': index_expression
                }

            # CAS B : C'est une méthode d'objet -> game.run()
            elif next_token == '.':
                self.process('.')
                sub_token = self.lexer.next() # On consomme le nom de la fonction après le point
                sub_name = sub_token['token']
                
                self.process('(')
                args = self.expressionList() # On récupère les arguments
                self.process(')')
                
                return {
                    'type': 'subroutineCall',
                    'classOrVar': identifier,
                    'subroutineName': sub_name,
                    'arguments': args
                }

            # CAS C : C'est une méthode locale -> draw()
            elif next_token == '(':
                self.process('(')
                args = self.expressionList()
                self.process(')')
                
                return {
                    'type': 'subroutineCall',
                    'classOrVar': None,
                    'subroutineName': identifier,
                    'arguments': args
                }

            # CAS D : C'est juste une variable -> let x = y;
            else:
                return {'type': 'varName', 'value': identifier}

        else:
            self.error(token)


    def subroutineCall(self):
        """
        subroutineCall : subroutineName '(' expressionList ')'
                | (className|varName) '.' subroutineName '(' expressionList ')'
        Attention : l'analyse syntaxique ne peut pas distingué className et varName.
            Nous utiliserons la balise <classvarName> pour (className|varName)
        """

        identifier = self.lexer.next()  
        if identifier['type'] != 'identifier':
            raise SyntaxError(f"Expected identifier, found {identifier}")

        if self.lexer.look()['token'] == '.':
            self.process('.') 
            subroutine_name = self.lexer.next()  
            if subroutine_name['type'] != 'identifier':
                raise SyntaxError(f"Expected subroutine name after '.', found {subroutine_name}")
            class_or_var = identifier['token']
            method_name = subroutine_name['token']
        else:
            class_or_var = None
            method_name = identifier['token']

        if self.lexer.look()['token'] != '(':
            raise SyntaxError(f"Expected '(', found {self.lexer.look()}")

        self.process('(')

        expression_list = self.expressionList()

        if self.lexer.look()['token'] != ')':
            print(self.lexer.look())
            raise SyntaxError(f"Expected ')', found {self.lexer.look()}")
        self.process(')')

        return {
            'type': 'subroutineCall',
            'classOrVar': class_or_var,
            'subroutineName': method_name,
            'arguments': expression_list
        }
    

    def expressionList(self):
        """
        expressionList : (expression (',' expression)*)?
        """
        expression_list = []


        if self.lexer.look()['token'] != ')':  
            expression_list.append(self.expression())


            while self.lexer.look()['token'] == ',':
                self.process(',')
                expression_list.append(self.expression())


        return expression_list
    

    def op(self):
        """
        op : '+'|'-'|'*'|'/'|'&'|'|'|'<'|'>'|'='
        """
        valid_ops = {'+', '-', '*', '/', '&', '|', '<', '>', '='}
        token = self.lexer.look()

        if token['token'] in valid_ops:
            return self.lexer.next()  
        else:
            self.error(token)  


    def unaryOp(self):
        """
        unaryop : '-'|'~'
        """
        op = self.lexer.look()['token']
        if op in {'-', '~'}:
            return self.lexer.next()['token']  
        else:
            self.error(f"Expected unary operator, found {op}")


    def KeywordConstant(self):
        """
        KeyWordConstant : 'true'|'false'|'null'|'this'
        """
        token = self.lexer.look()['token']

        if token == 'true':
            self.lexer.next()
            return True
        elif token == 'false':
            self.lexer.next()
            return False
        elif token == 'null':
            self.lexer.next()
            return None  #
        elif token == 'this':
            self.lexer.next()
            return 'this'
        else:
            self.error(f"Expected keyword constant, found {token}")

    def process(self, str):
        token = self.lexer.next()
        if (token is not None and token['token'] == str):
            return token
        else:
            self.error(token)

    def error(self, token):
        if token is None:
            print("Syntax error: end of file")
        else:
            print(f"SyntaxError (line={token['line']}, col={token['col']}): {token['token']}")
        exit()


if __name__ == "__main__":
    file = sys.argv[1]
    print('-----debut')
    parser = Parser(file)
    arbre = parser.jackclass()
    todot = todot.Todot(file)
    todot.todot(arbre)
    print('-----fin')
