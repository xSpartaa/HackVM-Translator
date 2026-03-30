"""AND OR NOT"""
def _commandand(self):
    """Opération Bitwise AND (&)"""
    return f"""\t// and
    @SP
    AM=M-1   
    D=M      
    
    A=A-1    
    M=D&M    
    \n"""

def _commandor(self, command):
    """Opération Bitwise OR (|)"""
    return f"""\t// or
    @SP
    AM=M-1   
    D=M      
    
    A=A-1    
    M=D|M    
    \n"""

def _commandnot(self):
    """Opération Bitwise NOT (!)"""
    return f"""\t// not
    @SP
    A=M-1    
    M=!M    
    \n"""