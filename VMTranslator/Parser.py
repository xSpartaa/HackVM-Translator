"""Import du module sys et du fichier Lexer.py"""

import sys
import Lexer


class Parser:
    """Initialisation de la classe avec attribut  Objet lexer et commande , lecture du fichier en argument"""

    def __init__(self, file):
        self.lexer = Lexer.Lexer(file)
        self.command = self._read()

    def next(self):
        """Fonction permettant de passer a la prochaine instruction """
        res = self.command
        self.command = self._read()
        return res

    def look(self):
        """ Retourne la ligne pointer du fichier """
        return self.command

    def hasNext(self):
        """Retourne un booléen verifiant si notre ligne n'est pas vide"""
        return self.command is not None

    def __iter__(self):
        return self

    def __next__(self):
        if self.hasNext():
            return self.next()
        else:
            raise StopIteration

    def _read(self):
        # Fonction permettant de lire les commande et d'executer la bonne fonction par rapport au type de la fonction
        command = self.lexer.look()
        if command is None:
            return None
        else:
            type = command['type']
            match type:
                case 'pushpop':
                    return self._commandpushpop()
                case 'branching':
                    return self._commandbranching()
                case 'arithmetic':
                    return self._commandarithmetic()
                case 'function':
                    return self._commandfunction()
                case 'return':
                    return self._commandreturn()
                case _:
                    print(f'SyntaxError : {command}')
                    exit()

    def _commandarithmetic(self):
        # retourne les infos de l'instruction suivante  comprennant le numero de ligne , la   										
        # colonne du mot et le token (l'instruction)
        command = self.lexer.next()
        return {'line': command['line'], 'col': command['col'], 'type': command['token']}

    def _commandpushpop(self):
        # retourne la liste des informations suivant la commande (la ligne , la commande , le 
        # type de la commande , le segment (type de parametre) et le token (le parametre) )
        command = self.lexer.next()
        segment = self.lexer.next()
        parameter = self.lexer.next()
        if segment is None or parameter is None or segment['type'] != 'segment' or parameter['type'] != 'int':
            print(f"SyntaxError (line={command['line']}, col={command['col']}): {command['token']}")
            exit()

        return {'line': command['line'], 'col': command['col'], 'type': command['token']
            , 'segment': segment['token'], 'parameter': parameter['token']}

    def _commandbranching(self):
        # lis les 2 prochains mots (la commande et le parametre) et retourne la ligne , colonne , type de la commande et le token du parametre
        command = self.lexer.next()
        label = self.lexer.next()
        if label is None or label['type'] != 'string':
            print(f"SyntaxError (line={command['line']}, col={command['col']}): {command['token']}")
            exit()

        return {'line': command['line'], 'col': command['col'], 'type': command['token']
            , 'label': label['token']}

    def _commandfunction(self):
        # Lis les 3 prochains mots (la commande le nom et le parametre) et retourne la ligne , la colonne et le type de la commande, le nom de la fonction et le parametre de celle ci
        command = self.lexer.next()
        name = self.lexer.next()
        parameter = self.lexer.next()
        if name is None or parameter is None or name['type'] != 'string' or parameter['type'] != 'int':
            print(f"SyntaxError (line={command['line']}, col={command['col']}): {command['token']}")
            exit()

        return {'line': command['line'], 'col': command['col'], 'type': command['token']
            , 'function': name['token'], 'parameter': parameter['token']}

    def _commandreturn(self):
        # Lis le prochain mot et retourne la position et le type de la commande 
        command = self.lexer.next()
        return {'line': command['line'], 'col': command['col'], 'type': command['token']}


if __name__ == "__main__":
    file = sys.argv[1]
    print('-----debut')
    parser = Parser(file)
    for command in parser:
        print(command)
    print('-----fin')
