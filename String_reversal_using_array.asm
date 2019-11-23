INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
   ARRAY DB 100 DUB(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR BX,BX
    MOV AH,1
    
    FOR:
        INT 21H 
        CMP AL,0DH
        JE EXIT
        MOV ARRAY[BX],AL
        INC BX
    JMP FOR
    EXIT:
    
    PRINTN
    MOV AH,2
    
    FOR2:
        MOV DL,ARRAY[BX]
        INT 21H
        DEC BX
        CMP BX,0
        JL EXIT2
    JMP FOR2
        EXIT2:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
