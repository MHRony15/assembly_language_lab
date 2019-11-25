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
    MOV CX,BX
    XOR BX,BX
    MOV AH,2
    
    FOR2:
        MOV DL,ARRAY[BX]
        INT 21H
        INC BX
        
    LOOP FOR2
        ;EXIT2:
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
