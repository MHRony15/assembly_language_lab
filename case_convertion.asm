INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
.CODE

MAIN PROC 
    PRINT "ENTER:" 
    MOV AH,1
    XOR CX,CX
    
    INPUT:
        INT 21H
        CMP AL,ODH
        JE EXIT_INPUT 
    
        CMP AL,'a'
        JGE LOWER 
        CMP 
        
    
    LOWER:
        CMP AL,'z'
        PUS
    
         
          
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN