import re
import sys

import Reader

'''Importe la classe Reader'''


class Lexer:
    """Initialisation classe Lexer"""

    def __init__(self, file):
        self.reader = Reader.Reader(file)
        self.token = self._read()

    def _comment(self):
        # Ignore les commentaires  
        t = self.reader.next()
        if self.reader.hasNext():
            t = self.reader.next()
        else:
            return
        if t['char'] == '/':
            while t is not None and t['char'] != '\n':
                t = self.reader.next()
            return
        else:
            while True:
                while t is not None and t['char'] != '*':
                    t = self.reader.next()
                t = self.reader.next()
                if t is None or t['char'] == '/':
                    return

    def _skip(self):
        # 
        self.reader.next()
        return

    def _toke(self):
        # Récupère et return les toke (toke=mots ou commandes) dans la variable res une chaine de caractère
        res = ''
        t = self.reader.next()
        while t is not None and re.fullmatch(r'[a-zA-Z0-9\-\._]', t['char']):
            res += t['char']
            t = self.reader.next()
        return res

    def next(self):
        """Utilise la fonction next de la classe Reader"""
        res = self.token
        self.token = self._read()
        return res

    def _read(self):
        # Il lit le document fichier.vm et ignore (= fonction skip) les commentaires,retour de ligne,espaces,tirets du bas et stocke le toke (toke=mots ou commandes) suivant dans la variable token.Une fois le toke stocker il renvoi ces coordonées (ligne et colonnes),toke et type tant que le toke récupérer existe sinon la fonction affiche une erreur et s'arrète,si le toke est inéxistant la fonction s'arrète. 
        token = None
        while self.reader.hasNext() and token is None:
            self.line = self.reader._line
            self.col = self.reader._col
            t = self.reader.look()
            char = t['char']
            match char:
                case '/':
                    self._comment()
                case ' ' | '\t' | '\n':
                    self._skip()
                case char if re.fullmatch(r'[a-zA-Z0-9]', char):
                    token = self._toke()
                case _:
                    print(f'SyntaxError : line={self.line}, col={self.col}')
                    exit()

        if token is None:
            return None
        else:
            pattern = self._pattern()
            group = pattern.fullmatch(token)
            if group is None:
                print(f'SyntaxError (line={self.line}, col={self.col}): {token}')
                exit()
            else:
                return {'line': self.line, 'col': self.col, 'type': group.lastgroup, 'token': token}

    def hasNext(self):
        """ Utilise la fonction hasNext de la classe Reader """
        return self.token is not None

    def look(self):
        """ Utilise la fonction look de la classe Reader"""
        return self.token

    def _pattern(self):
        # Il renvoi le type du toke (toke=mots ou commandes) récupérer
        return re.compile(r"""
            (?P<pushpop>push|pop) |
            (?P<segment>local|argument|static|constant|this|that|pointer|temp) |
            (?P<branching>label|goto|if-goto) |
            (?P<arithmetic>add|sub|neg|eq|gt|lt|and|or|not) |
            (?P<function>function|call) |
            (?P<return>return) |
            (?P<string>[a-zA-Z][a-zA-Z0-9\._:]*) | # label et nom de fonction
            (?P<int>[0-9]+) # des entiers 
        """, re.X)

    def __iter__(self):
        return self

    def __next__(self):
        if self.hasNext():
            return self.next()
        else:
            raise StopIteration


if __name__ == "__main__":
    file = sys.argv[1]
    print('-----debut')
    lexer = Lexer(file)
    for token in lexer:
        print(token)
    print('-----fin')
