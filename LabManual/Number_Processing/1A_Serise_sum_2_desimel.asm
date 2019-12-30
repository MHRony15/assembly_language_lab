.MODEL SMALL
.STACK 100H
.DATA 
   MSG1 DB 'ENTER THE VALUE OF N: ','$'
   MSG2 DB 0AH,0DH,'OUTPUT: ','$'
   SUM DW '0'
.CODE


MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H 
    MOV BL,AL 
    SUB BL,30H
    MOV CX,BX
    CMP CX,0
    JE EXIT
    XOR AX,AX

    FOR: 
       
       ADD AX,CX
    
    LOOP FOR
    AAM
    MOV BH,AH
    MOV BL,AL 
    
    JMP EXIT2
    EXIT:
    MOV BX,0 
    EXIT2:
    LEA DX,MSG2
    MOV AH,9
    INT 21H
    
    
    MOV AH,2
    MOV DL,BH
    ADD DL,30H  
    INT 21H 
    MOV DL,BL
    ADD DL,30H 
    INT 21H
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
