.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER THE STRING: ','$'
    MSG2 DB 0AH,0DH,'OUTPUT: ','$'
    ARRAY DB 100 DUP(?)
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,09H 
    INT 21H
    MOV AH,1
    MOV SI,1 
    FOR:
        INT 21H
        CMP AL,0DH
        JE EXIT
        CMP AL,'a'
        JGE LOWER
        CMP AL,'A' 
        JGE UPPER
        JMP ARR
        
        UPPER:
            CMP AL,'Z'
            JG ARR
            ADD AL,20H
        JMP ARR
        LOWER:
            CMP AL,'z'
            JG ARR
            SUB AL,20H
        JMP ARR
        ARR:
        MOV ARRAY[SI],AL
        INC SI
    JMP FOR
    EXIT:
    LEA DX,MSG2
    MOV AH,09H 
    INT 21H 
    MOV CX,SI
    MOV AH,2 
    FOR2:
        MOV DL,ARRAY[SI]
        INT 21H
        DEC SI
        LOOP FOR2
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END