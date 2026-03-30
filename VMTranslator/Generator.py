"""Importe le module Sys et le fichier Parser.py"""

import sys
import Parser
import pushpop
import Logic
import add_sub_neg
import label_goto_if
import eq_gt_lt

class Generator:
    """Constructeur de la classe Generator avec un fichier en paramètre """
    call_counter = 0
    id_counter = 0
    def __init__(self, file=None):
        """Verifie si le fichier est non nul , si oui , on explore le fichier avec la classe parser pour regarder chaque mot 1 a 1"""
        if file is not None:
            print("Compiling...")
            self.parser = Parser.Parser(file)
            print(self.parser.look())
            # Compteur pour générer des labels de retour uniques dans 'call'


    def __iter__(self):
        return self

    def __next__(self):
        if self.parser is not None and self.parser.hasNext():
            return self._next()
        else:
            raise StopIteration

    def _next(self):
        # Permet de passer d'un mot a un autre en verifiant le type de la commande pour executer la bonne fonction  
        command = self.parser.next()
        if command is None:
            return None
        else:
            type = command['type']
            # type = push|pop|
            #        add|sub|neg|eq|gt|lt|and|or|not) |
            #        label|goto|if-goto|
            #        function|call|return

            match type:
                # Faire une fonction par type de commande
                case 'push':
                    return self._commandpush(command)
                case 'pop':
                    return self._commandpop(command)
                case 'and':
                    return Logic._commandand(self)
                case 'or':
                    return Logic._commandor(self,command)
                case 'not':
                    return Logic._commandnot(self)
                case 'add':
                    return add_sub_neg._commandadd(self,command)
                case 'sub':
                    return add_sub_neg._commandsub(self,command)
                case 'neg':
                    return add_sub_neg._commandneg(self,command)
                case 'eq':
                    return eq_gt_lt.Operations._commandeq(self) 
                case 'gt':
                    return eq_gt_lt.Operations._commandgt(self,command)
                case 'lt':
                    return eq_gt_lt.Operations._commandlt(self,command)
                case 'label':
                    return label_goto_if.Statements._commandlabel(self, command)
                case 'goto':
                    return label_goto_if.Statements._commandgoto(self,command)
                case 'if-goto':
                    return label_goto_if.Statements._commandifgoto(self,command)
                case 'function':
                    return self.commandfunction(command)
                case 'call':
                    return self._commandcall(command)
                case 'return':
                    return self._commandreturn()
                case _:
                    print(f'SyntaxError : {command}')
                    exit()

    def _commandpush(self, command):
        """Recupère le type de parametre de la fonction push et execute la bonne fonction en fonction de celui ci """
        segment = command['segment']
        # segment=local|argument|static|constant|this|that|pointer
        match segment:
            # Faire une fonction par type de segment
            case 'constant':
                return pushpop.PushPop._commandpushconstant(self,command)
            case 'static':
                return pushpop.PushPop._commandpushstatic(self,command)
            case 'argument':
                return pushpop.PushPop._commandpushargument(self,command)
            case 'local':
                return pushpop.PushPop._commandpushlocal(self,command)
            case 'this':
                return pushpop.PushPop._commandpushthis(self,command)
            case 'that':
                return pushpop.PushPop._commandpushthat(self,command)
            case 'pointer':
                return pushpop.PushPop._commandpushpointer(self,command)
            case 'temp':
                return pushpop.PushPop._commandpushtemp(self,command)
            case _:
                print(f'SyntaxError : {command}')
                exit()
    
    def _commandpop(self, command):
        """Recupère le type de parametre de la fonction push et execute la bonne fonction en fonction de celui ci """
        segment = command['segment']
        # segment=local|argument|static|constant|this|that|pointer
        match segment:
            # Faire une fonction par type de segment
            case 'static':
                return pushpop.PushPop._commandpopstatic(self,command)
            case 'argument':
                return pushpop.PushPop._commandpopargument(self,command)
            case 'local':
                return pushpop.PushPop._commandpoplocal(self,command)
            case 'this':
                return pushpop.PushPop._commandpopthis(self,command)
            case 'that':
                return pushpop.PushPop._commandpopthat(self,command)
            case 'pointer':
                return pushpop.PushPop._commandpoppointer(self,command)
            case 'temp':
                return pushpop.PushPop._commandpoptemp(self,command)
            case _:
                print(f'SyntaxError : {command}')
                exit()

    def commandfunction(self, command):
        """Déclare une fonction et initialise ses variables locales à 0"""
        function_name = command['function']
        num_locals = command['parameter'] 
        unique_id = Generator.id_counter
        Generator.id_counter += 1

        return f"""\t// function {function_name} {num_locals}
        ({function_name})       
        
        @{num_locals}
        D=A                     

        (LOOP_FUNC.{unique_id}) 
        @END_FUNC.{unique_id}   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.{unique_id}  
        0;JMP

        (END_FUNC.{unique_id})  
        \n"""
        
   

    def _commandcall(self,command):
        """Recupère le paramètre et call la fonction donné en paramètre"""
        func_name = command['function']
        n_args = command['parameter']
        
        # Créer un label de retour unique
        return_label = f"{func_name}$ret.{Generator.call_counter}"
        Generator.call_counter += 1
        
        return f"""    // call {func_name} {n_args}
        
        // 1. PUSH returnAddress
        @{return_label}
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
        // 2. PUSH LCL
        @LCL
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
        // 3. PUSH ARG
        @ARG
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
        // 4. PUSH THIS
        @THIS
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
        // 5. PUSH THAT
        @THAT
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
        // 6. ARG = SP - nArgs - 5
        @SP
        D=M
        @5
        D=D-A
        @{n_args}
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @{func_name}
        0;JMP
        
        // 9. (returnAddress)
        ({return_label})
        \n"""

    def _commandreturn(self):
        """Recupère le paramètre et appel la fonction donné en paramètre"""

        return f"""    // return
        
        // FRAME = LCL (R13 est utilisé pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilisé pour RET)
        @5
        A=D-A
        D=M
        @R14
        M=D
        
        // *ARG = pop() (La valeur de retour pour l'appelant)
        @SP
        AM=M-1
        D=M
        @ARG
        A=M
        M=D
        
        // SP = ARG + 1 (Restaurer la pile de l'appelant)
        @ARG
        D=M+1
        @SP
        M=D
        
        // THAT = *(FRAME - 1)
        @R13
        AM=M-1
        D=M
        @THAT
        M=D
        
        // THIS = *(FRAME - 2)
        @R13
        AM=M-1
        D=M
        @THIS
        M=D
        
        // ARG = *(FRAME - 3)
        @R13
        AM=M-1
        D=M
        @ARG
        M=D
        
        // LCL = *(FRAME - 4)
        @R13
        AM=M-1
        D=M
        @LCL
        M=D
        
        // goto RET
        @R14
        A=M
        0;JMP
        \n"""


if __name__ == '__main__':
    file = sys.argv[1]
    print('-----debut')
    generator = Generator(file)
    for command in generator:
        print(command)
    print('-----fin')

