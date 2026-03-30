class PushPop : 
    id_counter = 0

 


    def _commandpushconstant(self, command):
        """Recupère le parametre de la fonction et empile la constante"""
        parameter = command['parameter']
        return f"""\t//
        @{command['parameter']}
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        \n"""

    def _commandpushstatic(self, command):
        """Recupère le parametre de la fonction et empile le static"""
        parameter = command['parameter']
        return f"""\t//
        @{command['parameter']}
        D=A
        @FOO
        D=D+A
        A=D
        D=M

        @SP
        A=M
        M=D
        @SP
        M=M+1   
        \n"""      

    def _commandpushargument(self,command):
        """Recupère le parametre de la fonction et empile l'argument """
        parameter = command['parameter']
        return f"""\t//
        @ARG
        D=M
        @{command['parameter']}
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        \n"""

    def _commandpushthis(self,command):
        """Recupère le parametre de la fonction et empile le this """
        parameter = command['parameter']
        return f"""\t//
        @THIS
        D=M
        @{command['parameter']}
        D=D+A
        @SP
        A=M
        M=D
        @SP
        M=M+1
    \n"""

    def _commandpushthat(self,command):
        """Recupère le parametre de la fonction et empile le that """
        parameter = command['parameter']
        return f"""\t//
        @THAT
        D=M
        @{command['parameter']}
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        \n"""

    def _commandpushlocal(self,command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//
        @LCL
        D=M
        @{command['parameter']}
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        \n""" 

    def _commandpushpointer(self, command):
        """Recupère le parametre et empile pointer"""
        parameter = command['parameter']
        
        unique_id = self.id_counter
        self.id_counter += 1
        
        return f"""\t// push pointer {parameter}
        @{parameter}
        D=A
        @IF_POINTER_PUSH.{unique_id} 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.{unique_id} 
        D;JMP

        (IF_POINTER_PUSH.{unique_id}) 
        @THAT
        D=M

        (END_POINTER_PUSH.{unique_id}) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        \n"""

    def _commandpushtemp(self,command):
        """No comment"""
        parameter = command['parameter']
        return f"""\t//{command['type']} {command['segment']} {parameter}
        @5
        D=A
        @{parameter}
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        """

    def _commandpoplocal(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//
        
        @{command['parameter']}
        D=A
        @LCL
        M=D+M


        @SP
        M=M-1
        A=M
        D=M
        

        @LCL
        A=M
        M=D

        @{command['parameter']}
        D=A
        @LCL
        M=M-D

        \n"""

    def _commandpopthis(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//
        
        @{command['parameter']}
        D=A
        @THIS
        M=D+M


        @SP
        M=M-1
        A=M
        D=M

        @THIS
        A=M
        M=D

        @{command['parameter']}
        D=A
        @THIS
        M=M-D

        \n"""

    def _commandpopthat(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//
        
        @{command['parameter']}
        D=A
        @THAT
        M=D+M


        @SP
        M=M-1
        A=M
        D=M


        @THAT
        A=M
        M=D

        @{command['parameter']}
        D=A
        @THAT
        M=M-D

        \n"""


    def _commandpopargument(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//
        
        @{command['parameter']}
        D=A
        @ARG
        M=D+M

        @SP
        M=M-1
        A=M
        D=M

        @ARG
        A=M
        M=D

        @{command['parameter']}
        D=A
        @ARG
        M=M-D

        \n"""

    def _commandpoptemp(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//

        @{command['parameter']}
        D=A
        @5
        D=D+A

        @SP
        A=M
        M=D

        @SP
        M=M-1
        A=M
        D=M

        A=A+1
        A=M
        M=D

        \n"""

    def _commandpopstatic(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']
        return f"""\t//

        @FOO
        D=A
        @{command['parameter']}
        D=D+A
        
        @SP
        A=M
        M=D

        @SP
        M=M-1
        A=M
        D=M

        A=A+1
        A=M
        M=D

        \n"""

    def _commandpoppointer(self, command):
        """Recupère le parametre de la fonction et empile le local """
        parameter = command['parameter']

        unique_id = self.id_counter
        self.id_counter += 1

        return f"""\t//
        @{command['parameter']}
        D=A
        @IFPOPPOINTER.{unique_id} D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.{unique_id} D;JMP

        (IFPOPPOINTER.{unique_id})
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.{unique_id})
        \n"""