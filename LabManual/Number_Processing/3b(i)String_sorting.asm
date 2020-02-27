.MODEL SMALL
.STACK 100H
.DATA  
    MSG1 DB 'ENTER THE STRING IN CAPITAL OR SMALL LATTER: ','$'
    MSG2 DB 0DH,0AH,'OUTPUT: ','$'
   ARRAY DB 100 DUP(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H
     
    MOV SI,1
    MOV AH,1 
    FOR:
        INT 21H 
        CMP AL,0DH
        JE EXIT
        MOV ARRAY[SI],AL
        INC SI
    JMP FOR
    EXIT:
    
    MOV CX,SI
    MOV BX,CX
    DEC BX 
    F1:
       F2:  
        MOV DL, ARRAY[BX] 
        MOV DI,CX
        CMP ARRAY[DI],DL
        JG EX
        JMP EX2
        EX:
            XCHG DL,ARRAY[DI]
            MOV ARRAY[BX],DL
            
        EX2:
       LOOP F2
       MOV CX,BX
      DEC BX
    LOOP F1
    
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    MOV CX,SI 
    MOV BX,1
    MOV AH,2 
    
    FOR2:        
       MOV DL , ARRAY[BX]
       INT 21H
       INC BX
     LOOP FOR2
   
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
