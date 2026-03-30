-----debut
Compiling...
{'line': 1, 'col': 1, 'type': 'function', 'function': 'Board.new', 'parameter': '0'}
function
	//function Board.new 0
        Code assembleur de {'line': 1, 'col': 1, 'type': 'function', 'function': 'Board.new', 'parameter': '0'}
        @0
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.new)
        

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Memory.alloc 1
        
        // 1. PUSH returnAddress
        @Memory.alloc$ret.0
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Memory.alloc
        0;JMP
        
        // 9. (returnAddress)
        (Memory.alloc$ret.0)
        

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@9
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Array.new 1
        
        // 1. PUSH returnAddress
        @Array.new$ret.1
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Array.new
        0;JMP
        
        // 9. (returnAddress)
        (Array.new$ret.1)
        

pop
	//
	
	@0
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

	@0
	D=A
	@THIS
	M=M-D

	

push
	//
	@0
	D=A
	@IFPUSHPOINTER D-1;JEQ

	@THIS
	D=M
	@ENDPUSHPOINTER D;JMP

	(IFPUSHPOINTER)
	@THAT
	D=M

	(ENDPUSHPOINTER)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

call
    // call Board.clear 1
        
        // 1. PUSH returnAddress
        @Board.clear$ret.2
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Board.clear
        0;JMP
        
        // 9. (returnAddress)
        (Board.clear$ret.2)
        

pop
	//

	@0
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

	

push
	//
	@0
	D=A
	@IFPUSHPOINTER D-1;JEQ

	@THIS
	D=M
	@ENDPUSHPOINTER D;JMP

	(IFPUSHPOINTER)
	@THAT
	D=M

	(ENDPUSHPOINTER)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

return
    // return
        
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
        

function
	//function Board.clear 1
        Code assembleur de {'line': 13, 'col': 1, 'type': 'function', 'function': 'Board.clear', 'parameter': '1'}
        @1
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.clear)
        

push
	//
	@ARG
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

pop
	//
	
	@0
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

	@0
	D=A
	@LCL
	M=M-D

	

label
	//
	(WHILE_EXP0)
	

push
	//
	@LCL
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@9
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

lt
	//
	// on dépile la première y valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on récupère la deuxième x valeur,si x<y (x-y<0)alors on empile -1 sinon on empile 0
	@SP
	M=M-1
	@SP
	A=M
	D=M-D
	@IFTRUELT
	D;JLT
	@SP
	A=M
	M=0
	@ENDLT
	0;JMP
	(IFTRUELT)
	@SP
	A=M
	M=-1
	(ENDLT)
	// on remet le pointeur a la dernière position
	@SP
	M=M+1
	

not
	//
    @SP
    A=M
    D=M
    M=0
    M=M-D
    

if-goto
	//
	@SP
	A=M
	A=A-1
	D=M
	@SP
	M=M-1
	@ENDIFGOTO D;JEQ
	@WHILE_END0
	0;JMP	
	(ENDIFGOTO)
	

push
	//
	@THIS
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1


push
	//
	@LCL
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

add
	//
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
	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

pop
	//

	@0
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

	

pop
	//
	@1
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//push temp 0
        @5
        D=A
        @0
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
pop
	//
	
	@0
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

	@0
	D=A
	@THAT
	M=M-D

	

push
	//
	@LCL
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

pop
	//
	
	@0
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

	@0
	D=A
	@LCL
	M=M-D

	

goto
	//
	@WHILE_EXP0
	0;JMP
	

label
	//
	(WHILE_END0)
	

call
    // call Screen.clearScreen 0
        
        // 1. PUSH returnAddress
        @Screen.clearScreen$ret.3
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
        @0
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.clearScreen
        0;JMP
        
        // 9. (returnAddress)
        (Screen.clearScreen$ret.3)
        

pop
	//

	@0
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

	

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

neg
	//
	// on récupère valeur stocker au sommet de la pile qu'on afecte a D,
	 multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
	

call
    // call Screen.setColor 1
        
        // 1. PUSH returnAddress
        @Screen.setColor$ret.4
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.setColor
        0;JMP
        
        // 9. (returnAddress)
        (Screen.setColor$ret.4)
        

pop
	//

	@0
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

	

push
	//
	@200
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@200
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@200
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.5
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.5)
        

pop
	//

	@0
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

	

push
	//
	@250
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@250
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@200
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.6
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.6)
        

pop
	//

	@0
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

	

push
	//
	@150
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@100
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@300
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@100
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.7
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.7)
        

pop
	//

	@0
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

	

push
	//
	@150
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@150
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@300
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@150
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.8
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.8)
        

pop
	//

	@0
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

	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

return
    // return
        
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
        

function
	//function Board.placeMove 0
        Code assembleur de {'line': 70, 'col': 1, 'type': 'function', 'function': 'Board.placeMove', 'parameter': '0'}
        @0
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.placeMove)
        

push
	//
	@ARG
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@THIS
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1


push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

add
	//
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
	

pop
	//
	@1
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@THAT
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

eq
	//
	// on dépile la première y valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on récupère la deuxième x valeur,si x=y (x-y=0)alors on empile -1 sinon on empile 0
	@SP
	M=M-1
	@SP
	A=M
	D=M-D
	@IFTRUEEQ
	D;JEQ
	@SP
	A=M
	M=0
	@ENDEQ
	0;JMP
	(IFTRUEEQ)
	@SP
	A=M
	M=-1
	(ENDEQ)
	// on remet le pointeur a la dernière position
	@SP
	M=M+1	
	

not
	//
    @SP
    A=M
    D=M
    M=0
    M=M-D
    

if-goto
	//
	@SP
	A=M
	A=A-1
	D=M
	@SP
	M=M-1
	@ENDIFGOTO D;JEQ
	@IF_TRUE1
	0;JMP	
	(ENDIFGOTO)
	

label
	//
	(IF_TRUE1)
	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

return
    // return
        
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
        

label
	//
	(IF_END1)
	

push
	//
	@THIS
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1


push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

add
	//
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
	

push
	//
	@ARG
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//

	@0
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

	

pop
	//
	@1
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//push temp 0
        @5
        D=A
        @0
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
pop
	//
	
	@0
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

	@0
	D=A
	@THAT
	M=M-D

	

push
	//
	@0
	D=A
	@IFPUSHPOINTER D-1;JEQ

	@THIS
	D=M
	@ENDPUSHPOINTER D;JMP

	(IFPUSHPOINTER)
	@THAT
	D=M

	(ENDPUSHPOINTER)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@ARG
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

call
    // call Board.drawSymbol 3
        
        // 1. PUSH returnAddress
        @Board.drawSymbol$ret.9
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
        @3
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Board.drawSymbol
        0;JMP
        
        // 9. (returnAddress)
        (Board.drawSymbol$ret.9)
        

pop
	//

	@0
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

	

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

neg
	//
	// on récupère valeur stocker au sommet de la pile qu'on afecte a D,
	 multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
	

return
    // return
        
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
        

function
	//function Board.drawSymbol 4
        Code assembleur de {'line': 102, 'col': 1, 'type': 'function', 'function': 'Board.drawSymbol', 'parameter': '4'}
        @4
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.drawSymbol)
        

push
	//
	@ARG
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Math.divide 2
        
        // 1. PUSH returnAddress
        @Math.divide$ret.10
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
        @2
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Math.divide
        0;JMP
        
        // 9. (returnAddress)
        (Math.divide$ret.10)
        

pop
	//
	
	@0
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

	@0
	D=A
	@LCL
	M=M-D

	

push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@LCL
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@3
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Math.multiply 2
        
        // 1. PUSH returnAddress
        @Math.multiply$ret.11
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
        @2
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Math.multiply
        0;JMP
        
        // 9. (returnAddress)
        (Math.multiply$ret.11)
        

sub
	//
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
	

pop
	//
	
	@1
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

	@1
	D=A
	@LCL
	M=M-D

	

push
	//
	@150
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@LCL
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Math.multiply 2
        
        // 1. PUSH returnAddress
        @Math.multiply$ret.12
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
        @2
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Math.multiply
        0;JMP
        
        // 9. (returnAddress)
        (Math.multiply$ret.12)
        

add
	//
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
	

push
	//
	@25
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

pop
	//
	
	@2
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

	@2
	D=A
	@LCL
	M=M-D

	

push
	//
	@50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

push
	//
	@LCL
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@50
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Math.multiply 2
        
        // 1. PUSH returnAddress
        @Math.multiply$ret.13
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
        @2
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Math.multiply
        0;JMP
        
        // 9. (returnAddress)
        (Math.multiply$ret.13)
        

add
	//
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
	

push
	//
	@25
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

pop
	//
	
	@3
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

	@3
	D=A
	@LCL
	M=M-D

	

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

neg
	//
	// on récupère valeur stocker au sommet de la pile qu'on afecte a D,
	 multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
	

call
    // call Screen.setColor 1
        
        // 1. PUSH returnAddress
        @Screen.setColor$ret.14
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.setColor
        0;JMP
        
        // 9. (returnAddress)
        (Screen.setColor$ret.14)
        

pop
	//

	@0
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

	

push
	//
	@ARG
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@1
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

eq
	//
	// on dépile la première y valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on récupère la deuxième x valeur,si x=y (x-y=0)alors on empile -1 sinon on empile 0
	@SP
	M=M-1
	@SP
	A=M
	D=M-D
	@IFTRUEEQ
	D;JEQ
	@SP
	A=M
	M=0
	@ENDEQ
	0;JMP
	(IFTRUEEQ)
	@SP
	A=M
	M=-1
	(ENDEQ)
	// on remet le pointeur a la dernière position
	@SP
	M=M+1	
	

if-goto
	//
	@SP
	A=M
	A=A-1
	D=M
	@SP
	M=M-1
	@ENDIFGOTO D;JEQ
	@IF_TRUE2
	0;JMP	
	(ENDIFGOTO)
	

push
	//
	@LCL
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@LCL
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

call
    // call Screen.drawCircle 3
        
        // 1. PUSH returnAddress
        @Screen.drawCircle$ret.15
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
        @3
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawCircle
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawCircle$ret.15)
        

pop
	//

	@0
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

	

label
	//
	(IF_TRUE2)
	

push
	//
	@LCL
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

sub
	//
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
	

push
	//
	@LCL
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

sub
	//
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
	

push
	//
	@LCL
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

push
	//
	@LCL
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.16
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.16)
        

pop
	//

	@0
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

	

push
	//
	@LCL
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

push
	//
	@LCL
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

sub
	//
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
	

push
	//
	@LCL
	D=M
	@2
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

sub
	//
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
	

push
	//
	@LCL
	D=M
	@3
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

push
	//
	@15
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

add
	//
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
	

call
    // call Screen.drawLine 4
        
        // 1. PUSH returnAddress
        @Screen.drawLine$ret.17
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
        @4
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Screen.drawLine
        0;JMP
        
        // 9. (returnAddress)
        (Screen.drawLine$ret.17)
        

pop
	//

	@0
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

	

label
	//
	(IF_END2)
	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

return
    // return
        
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
        

function
	//function Board.getValue 0
        Code assembleur de {'line': 176, 'col': 1, 'type': 'function', 'function': 'Board.getValue', 'parameter': '0'}
        @0
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.getValue)
        

push
	//
	@ARG
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@THIS
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1


push
	//
	@ARG
	D=M
	@1
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

add
	//
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
	

pop
	//
	@1
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@THAT
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

return
    // return
        
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
        

function
	//function Board.dispose 0
        Code assembleur de {'line': 185, 'col': 1, 'type': 'function', 'function': 'Board.dispose', 'parameter': '0'}
        @0
        D=A
        (IFFUNCTION)
        
        @LOOPFUNCTION D;JGT
        @ENDFUNCTION 0;JMP  
        
        (LOOPFUNCTION)
        @SP
        A=M
        M=0
        @SP
        M=M+1
        D=D-1
        
        @IFFUNCTION 0;JMP
        
        (ENDFUNCTION)
        (Board.dispose)
        

push
	//
	@ARG
	D=M
	@0
	A=D+A
	D=M
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

pop
	//
	@0
	D=A
	@IFPOPPOINTER D-1;JEQ

	@SP
	M=M-1
	A=M
	D=M
	@THIS
	M=D

	@ENDPOPPOINTER D;JMP

	(IFPOPPOINTER)
	@SP
	A=M
	D=M
	@THAT
	M=D

	(ENDPOPPOINTER)
	

push
	//
	@THIS
	D=M
	@0
	D=D+A
	@SP
	A=M
	M=D
	@SP
	M=M+1


call
    // call Array.dispose 1
        
        // 1. PUSH returnAddress
        @Array.dispose$ret.18
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Array.dispose
        0;JMP
        
        // 9. (returnAddress)
        (Array.dispose$ret.18)
        

pop
	//

	@0
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

	

push
	//
	@0
	D=A
	@IFPUSHPOINTER D-1;JEQ

	@THIS
	D=M
	@ENDPUSHPOINTER D;JMP

	(IFPUSHPOINTER)
	@THAT
	D=M

	(ENDPUSHPOINTER)
	@SP
	A=M
	M=D
	@SP
	M=M+1
	

call
    // call Memory.deAlloc 1
        
        // 1. PUSH returnAddress
        @Memory.deAlloc$ret.19
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
        @1
        D=D-A
        @ARG
        M=D
        
        // 7. LCL = SP
        @SP
        D=M
        @LCL
        M=D
        
        // 8. goto functionName
        @Memory.deAlloc
        0;JMP
        
        // 9. (returnAddress)
        (Memory.deAlloc$ret.19)
        

pop
	//

	@0
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

	

push
	//
	@0
	D=A
	@SP
	A=M
	M=D
	@SP
	M=M+1 	
	

return
    // return
        
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
        

-----fin
