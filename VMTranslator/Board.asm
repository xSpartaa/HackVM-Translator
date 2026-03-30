
	// function Board.new 0
        (Board.new)       
        
        @0
        D=A                     

        (LOOP_FUNC.0) 
        @END_FUNC.0   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.0  
        0;JMP

        (END_FUNC.0)  
        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.1 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.1 D;JMP

        (IFPOPPOINTER.1)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.1)
        

	//
        @9
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	// push pointer 0
        @0
        D=A
        @IF_POINTER_PUSH.2 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.2 
        D;JMP

        (IF_POINTER_PUSH.2) 
        @THAT
        D=M

        (END_POINTER_PUSH.2) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

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

        

	// push pointer 0
        @0
        D=A
        @IF_POINTER_PUSH.3 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.3 
        D;JMP

        (IF_POINTER_PUSH.3) 
        @THAT
        D=M

        (END_POINTER_PUSH.3) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.clear 1
        (Board.clear)       
        
        @1
        D=A                     

        (LOOP_FUNC.4) 
        @END_FUNC.4   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.4  
        0;JMP

        (END_FUNC.4)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.5 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.5 D;JMP

        (IFPOPPOINTER.5)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.5)
        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
		(WHILE_EXP0)
		

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
        

	//
        @9
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	// lt
        // on d�pile la premi�re valeur y qu'on stocke dans D
        @SP
        M=M-1
        @SP
        A=M
        D=M
        M=0
        
        // on r�cup�re la deuxi�me valeur x
        @SP
        M=M-1
        @SP
        A=M
        D=M-D   // D = x - y

        // Si x < y (donc x - y < 0), on saute au label Vrai
        @IFTRUELT.6
        D;JLT

        // Cas Faux (0)
        @SP
        A=M
        M=0
        @ENDLT.6
        0;JMP

        // Cas Vrai (-1)
        (IFTRUELT.6)
        @SP
        A=M
        M=-1

        (ENDLT.6)
        // on remet le pointeur a la derni�re position
        @SP
        M=M+1
        

	// not
    @SP
    A=M-1    
    M=!M    
    

	// if-goto WHILE_END0
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.7  
		D;JEQ       
		@WHILE_END0 
		0;JMP       

		(ENDIFGOTO.7) 
		

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
        @1
        D=A
        @IFPOPPOINTER.8 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.8 D;JMP

        (IFPOPPOINTER.8)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.8)
        

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
        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
		@WHILE_EXP0
		0;JMP
		

	//
		(WHILE_END0)
		

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

        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on r�cup�re valeur stocker au sommet de la pile qu'on afecte a D, multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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

        

	//
        @200
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @50
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @200
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @200
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
        @250
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @50
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @250
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @200
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
        @150
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @100
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @300
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @100
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
        @150
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @150
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @300
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
        @150
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.placeMove 0
        (Board.placeMove)       
        
        @0
        D=A                     

        (LOOP_FUNC.9) 
        @END_FUNC.9   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.9  
        0;JMP

        (END_FUNC.9)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.10 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.10 D;JMP

        (IFPOPPOINTER.10)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.10)
        

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

	//
        @1
        D=A
        @IFPOPPOINTER.11 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.11 D;JMP

        (IFPOPPOINTER.11)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.11)
        

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
        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	// eq
        @SP
        AM=M-1
        D=M
        A=A-1
        D=M-D
        
        @EQ_TRUE.12   // Saut vers un label unique
        D;JEQ

        @SP
        A=M-1
        M=0      // Faux (0)
        @EQ_END.12    // Saut vers la fin unique
        0;JMP

        (EQ_TRUE.12)
        @SP
        A=M-1
        M=-1     // Vrai (-1)

        (EQ_END.12)
        

	// not
    @SP
    A=M-1    
    M=!M    
    

	// if-goto IF_TRUE1
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.13  
		D;JEQ       
		@IF_TRUE1 
		0;JMP       

		(ENDIFGOTO.13) 
		

	//
		@IF_END1
		0;JMP
		

	//
		(IF_TRUE1)
		

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	//
		(IF_END1)
		

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
        @1
        D=A
        @IFPOPPOINTER.14 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.14 D;JMP

        (IFPOPPOINTER.14)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.14)
        

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

        

	// push pointer 0
        @0
        D=A
        @IF_POINTER_PUSH.15 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.15 
        D;JMP

        (IF_POINTER_PUSH.15) 
        @THAT
        D=M

        (END_POINTER_PUSH.15) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

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

        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on r�cup�re valeur stocker au sommet de la pile qu'on afecte a D, multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
	

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.drawSymbol 4
        (Board.drawSymbol)       
        
        @4
        D=A                     

        (LOOP_FUNC.16) 
        @END_FUNC.16   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.16  
        0;JMP

        (END_FUNC.16)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.17 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.17 D;JMP

        (IFPOPPOINTER.17)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.17)
        

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
        

	//
        @3
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
        @3
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
        @150
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
        @50
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

	//
        @25
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
        @50
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
        @50
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

	//
        @25
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on r�cup�re valeur stocker au sommet de la pile qu'on afecte a D, multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	// eq
        @SP
        AM=M-1
        D=M
        A=A-1
        D=M-D
        
        @EQ_TRUE.18   // Saut vers un label unique
        D;JEQ

        @SP
        A=M-1
        M=0      // Faux (0)
        @EQ_END.18    // Saut vers la fin unique
        0;JMP

        (EQ_TRUE.18)
        @SP
        A=M-1
        M=-1     // Vrai (-1)

        (EQ_END.18)
        

	// if-goto IF_TRUE2
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.19  
		D;JEQ       
		@IF_TRUE2 
		0;JMP       

		(ENDIFGOTO.19) 
		

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
		@IF_END2
		0;JMP
		

	//
		(IF_TRUE2)
		

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on soustrait a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D-M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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
        

	//
        @15
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
		(IF_END2)
		

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.getValue 0
        (Board.getValue)       
        
        @0
        D=A                     

        (LOOP_FUNC.20) 
        @END_FUNC.20   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.20  
        0;JMP

        (END_FUNC.20)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.21 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.21 D;JMP

        (IFPOPPOINTER.21)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.21)
        

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
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

	//
        @1
        D=A
        @IFPOPPOINTER.22 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.22 D;JMP

        (IFPOPPOINTER.22)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.22)
        

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
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.isFull 1
        (Board.isFull)       
        
        @1
        D=A                     

        (LOOP_FUNC.23) 
        @END_FUNC.23   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.23  
        0;JMP

        (END_FUNC.23)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.24 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.24 D;JMP

        (IFPOPPOINTER.24)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.24)
        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

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

        

	//
		(WHILE_EXP3)
		

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
        

	//
        @9
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	// lt
        // on d�pile la premi�re valeur y qu'on stocke dans D
        @SP
        M=M-1
        @SP
        A=M
        D=M
        M=0
        
        // on r�cup�re la deuxi�me valeur x
        @SP
        M=M-1
        @SP
        A=M
        D=M-D   // D = x - y

        // Si x < y (donc x - y < 0), on saute au label Vrai
        @IFTRUELT.25
        D;JLT

        // Cas Faux (0)
        @SP
        A=M
        M=0
        @ENDLT.25
        0;JMP

        // Cas Vrai (-1)
        (IFTRUELT.25)
        @SP
        A=M
        M=-1

        (ENDLT.25)
        // on remet le pointeur a la derni�re position
        @SP
        M=M+1
        

	// not
    @SP
    A=M-1    
    M=!M    
    

	// if-goto WHILE_END3
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.26  
		D;JEQ       
		@WHILE_END3 
		0;JMP       

		(ENDIFGOTO.26) 
		

	// push pointer 0
        @0
        D=A
        @IF_POINTER_PUSH.27 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.27 
        D;JMP

        (IF_POINTER_PUSH.27) 
        @THAT
        D=M

        (END_POINTER_PUSH.27) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

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
        

    // call Board.getValue 2
        
        // 1. PUSH returnAddress
        @Board.getValue$ret.18
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
        @Board.getValue
        0;JMP
        
        // 9. (returnAddress)
        (Board.getValue$ret.18)
        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	// eq
        @SP
        AM=M-1
        D=M
        A=A-1
        D=M-D
        
        @EQ_TRUE.28   // Saut vers un label unique
        D;JEQ

        @SP
        A=M-1
        M=0      // Faux (0)
        @EQ_END.28    // Saut vers la fin unique
        0;JMP

        (EQ_TRUE.28)
        @SP
        A=M-1
        M=-1     // Vrai (-1)

        (EQ_END.28)
        

	// if-goto IF_TRUE4
		@SP
		AM=M-1      
		D=M         

		@ENDIFGOTO.29  
		D;JEQ       
		@IF_TRUE4 
		0;JMP       

		(ENDIFGOTO.29) 
		

	//
		@IF_END4
		0;JMP
		

	//
		(IF_TRUE4)
		

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	//
		(IF_END4)
		

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
        

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on d�pile la premi�re  valeur qu'on stocke dans D
	@SP
	M=M-1
	@SP
	A=M
	D=M
	M=0
	// on r�cup�re la deuxi�me valeur qu'on additionne a D
	@SP
	M=M-1
	@SP
	A=M
	M=D
	M=D+M
	// on remet le pointeur a la derni�re position
	@SP
	M=M+1
	

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

        

	//
		@WHILE_EXP3
		0;JMP
		

	//
		(WHILE_END3)
		

	//
        @1
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

	//
	// on r�cup�re valeur stocker au sommet de la pile qu'on afecte a D, multiplier par 2 puis affecter a A,soustrait a D ce qui nous donne -D
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
	

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
        

	// function Board.dispose 0
        (Board.dispose)       
        
        @0
        D=A                     

        (LOOP_FUNC.30) 
        @END_FUNC.30   
        D;JEQ                   

        @SP
        A=M
        M=0                     
        @SP
        M=M+1                   
        D=D-1                   

        @LOOP_FUNC.30  
        0;JMP

        (END_FUNC.30)  
        

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
        

	//
        @0
        D=A
        @IFPOPPOINTER.31 D-1;JEQ

        @SP
        M=M-1
        A=M
        D=M
        @THIS
        M=D

        @ENDPOPPOINTER.31 D;JMP

        (IFPOPPOINTER.31)
        @SP
        A=M
        D=M
        @THAT
        M=D

        (ENDPOPPOINTER.31)
        

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
    

    // call Array.dispose 1
        
        // 1. PUSH returnAddress
        @Array.dispose$ret.19
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
        (Array.dispose$ret.19)
        

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

        

	// push pointer 0
        @0
        D=A
        @IF_POINTER_PUSH.32 
        D-1;JEQ

        @THIS
        D=M
        @END_POINTER_PUSH.32 
        D;JMP

        (IF_POINTER_PUSH.32) 
        @THAT
        D=M

        (END_POINTER_PUSH.32) 
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

    // call Memory.deAlloc 1
        
        // 1. PUSH returnAddress
        @Memory.deAlloc$ret.20
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
        (Memory.deAlloc$ret.20)
        

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

        

	//
        @0
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1   
        

    // return
        
        // FRAME = LCL (R13 est utilis� pour FRAME)
        @LCL
        D=M
        @R13
        M=D
        
        // RET = *(FRAME - 5) (R14 est utilis� pour RET)
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
