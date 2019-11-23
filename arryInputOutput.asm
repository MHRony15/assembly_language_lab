INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
   ARRAY DB 10 DUB(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    XOR BX,BX
    MOV CX,10
    
    MOV AH,1
    
    FOR:
        INT 21H
        MOV ARRAY[BX],AL
        INC BX
    LOOP FOR
     
    MOV BX,10
    MOV CX,11 
    PRINTN
    MOV AH,2
    
    FOR2:
        
        MOV DL,ARRAY[BX]
        INT 21H
        DEC BX
    LOOP FOR2
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
