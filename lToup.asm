.MODEL SMALL
.STACK 100H 
.DATA
  
 
.CODE

MAIN PROC      
    MOV AH, 1
    INT 21H 
    
    MOV BL, AL 
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H 
    
    MOV AL, BL
            
    CMP AL, 'a'
    JGE LOWER
    CMP AL, 'A'
    JLE PRINT
    ADD AL, 20H
    JMP PRINT

    LOWER:  
        CMP AL, 'z'
        JGE PRINT
        SUB AL, 20H
        JMP PRINT   

    PRINT:         
        MOV DL, AL 
        MOV AH,2
        INT 21H
        MOV AH, 4CH
        INT 21H
        
    MAIN ENDP
END MAIN

             
             
             