class Operations:
    id_counter = 0

    def _commandeq(self):
        unique_id = self.id_counter
        self.id_counter += 1

        return f"""\t// eq
        @SP
        AM=M-1
        D=M
        A=A-1
        D=M-D
        
        @EQ_TRUE.{unique_id}   // Saut vers un label unique
        D;JEQ

        @SP
        A=M-1
        M=0      // Faux (0)
        @EQ_END.{unique_id}    // Saut vers la fin unique
        0;JMP

        (EQ_TRUE.{unique_id})
        @SP
        A=M-1
        M=-1     // Vrai (-1)

        (EQ_END.{unique_id})
        \n"""
                
    def _commandgt(self, command):
        """Comparaison Greater Than (Plus grand que)"""
        unique_id = self.id_counter
        self.id_counter += 1

        return f"""\t// gt
        // on dépile la première valeur y qu'on stocke dans D
        @SP
        M=M-1
        @SP
        A=M
        D=M
        M=0
        
        // on récupère la deuxième valeur x
        @SP
        M=M-1
        @SP
        A=M
        D=M-D   // D = x - y

        // Si x > y (donc x - y > 0), on saute au label Vrai
        @IFTRUEGT.{unique_id}
        D;JGT

        // Cas Faux (0)
        @SP
        A=M
        M=0
        @ENDGT.{unique_id}
        0;JMP

        // Cas Vrai (-1)
        (IFTRUEGT.{unique_id})
        @SP
        A=M
        M=-1

        (ENDGT.{unique_id})
        // on remet le pointeur a la dernière position
        @SP
        M=M+1
        \n"""

    def _commandlt(self, command):
        """Comparaison Less Than (Plus petit que)"""
        # 1. On génère un ID unique pour ce bloc
        unique_id = self.id_counter
        self.id_counter += 1

        return f"""\t// lt
        // on dépile la première valeur y qu'on stocke dans D
        @SP
        M=M-1
        @SP
        A=M
        D=M
        M=0
        
        // on récupère la deuxième valeur x
        @SP
        M=M-1
        @SP
        A=M
        D=M-D   // D = x - y

        // Si x < y (donc x - y < 0), on saute au label Vrai
        @IFTRUELT.{unique_id}
        D;JLT

        // Cas Faux (0)
        @SP
        A=M
        M=0
        @ENDLT.{unique_id}
        0;JMP

        // Cas Vrai (-1)
        (IFTRUELT.{unique_id})
        @SP
        A=M
        M=-1

        (ENDLT.{unique_id})
        // on remet le pointeur a la dernière position
        @SP
        M=M+1
        \n"""
