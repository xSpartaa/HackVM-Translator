// Bootstrap
    @256
    D=A
    @SP
    M=D
	//Call Sys.init 0
        Code assembleur de {'type': 'Call', 'function': 'Sys.init', 'parameter': '0'}


//code de test/test.vm
	//
        @7
        D=A
        @SP
        A=M
        M=D
        @SP
        M=M+1 	
        
	//
        @1
        D=A
        @IF D-1;JEQ

        @THIS
        D=M
        @1
        D=D+A
        @END D;JMP

        (IF)
        @THAT
        D=M
        @1
        D=D+A

        (END)
        @SP
        A=M
        M=D
        @SP
        M=M+1


        
	//
        @0
        D=A
        @IF D-1;JEQ

        @THIS
        D=M
        @0
        D=D+A
        @END D;JMP

        (IF)
        @THAT
        D=M
        @0
        D=D+A

        (END)
        @SP
        A=M
        M=D
        @SP
        M=M+1


        
	//
        @THIS
        D=M
        @10
        D=D+A
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
	//
        @THAT
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
        @3
        A=D+A
        D=M
        @SP
        A=M
        M=D
        @SP
        M=M+1
        
