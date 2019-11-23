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
        
        CMP AL,'a'
        JGE LOWER 
        CMP AL,'A'
        JL ARR
        ADD AL,20H
        JMP ARR
          
        LOWER: 
            CMP AL,'z'
            JG ARR
            SUB AL,20H
            JMP ARR
            
        ARR: 
            
            MOV ARRAY[BX],AL
            INC BX   
        
   JMP FOR
     PRINTN 
      
   EXIT:
   MOV AH , 2
      XOR BX,BX
   FOR2:
        MOV DL,ARRAY[BX]
        INT 21H
        INC BX
   LOOP FOR2
   EXIT2:
   
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END