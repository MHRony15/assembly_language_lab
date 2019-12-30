.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THE STRING: ','$'
    MSG2 DB 0AH,0DH,'OUTPUT: ','$'
   ARRAY DB 100 DUB(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    XOR BX,BX
    MOV AH,1
    
    FOR:
        INT 21H 
        CMP AL,0DH
        JE EXIT 
        CMP AL, 'a'
        JGE LOWER
        CMP AL, 'A' 
        JL ARR 
        ADD AL, 20H 
        JMP ARR
        
        LOWER:
        CMP AL, 'z'
        JG ARR 
        SUB AL, 20H
        JMP ARR
     
        ARR:
        MOV ARRAY[BX],AL
        INC BX
    JMP FOR
    EXIT:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    MOV CX,BX
    XOR BX,BX
    MOV AH,2
    FOR2:
        MOV DL,ARRAY[BX]
        INT 21H
        INC BX
        
    LOOP FOR2
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
