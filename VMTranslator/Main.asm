-----debut
Compiling...
{'line': 1, 'col': 1, 'type': 'function', 'function': 'Main.main', 'parameter': '1'}
	// function Main.main 1
        (Main.main)       
        
        @1
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
        

    // call GamePanel.new 0
        
        // 1. PUSH returnAddress
        @GamePanel.new$ret.0
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
        @GamePanel.new
        0;JMP
        
        // 9. (returnAddress)
        (GamePanel.new$ret.0)
        

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
        

    // call GamePanel.run 1
        
        // 1. PUSH returnAddress
        @GamePanel.run$ret.1
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
        @GamePanel.run
        0;JMP
        
        // 9. (returnAddress)
        (GamePanel.run$ret.1)
        

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
        @0
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        

    // call GamePanel.dispose 1
        
        // 1. PUSH returnAddress
        @GamePanel.dispose$ret.2
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
        @GamePanel.dispose
        0;JMP
        
        // 9. (returnAddress)
        (GamePanel.dispose$ret.2)
        

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
