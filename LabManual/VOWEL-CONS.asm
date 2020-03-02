.MODEL SMALL
.STACK 100H
.DATA
    MSG1  DB 'ENTER THE STRING: ','$'
    MSG2  DB 0AH,0DH,'OUTPUT: ','$'
    MSG3  DB 0AH,0DH,'VOWELS: ','$'
    MSG4  DB 0AH,0DH,'CONDONENT: ','$'
    MSG5  DB 0AH,0DH,'DIGIT: ','$'
    MSG6  DB 0AH,0DH,'SPACE: ','$'
    VOW   DB '0'
    CONS  DB '0'
    DIG   DB '0'
    SPS   DB '0'
    
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,09H 
    INT 21H
    MOV AH,1 
    FOR:
        INT 21H
        CMP AL,0DH
        JE  EXIT
        CMP AL,'a'
        JGE LATTER2
        CMP AL,'A' 
        JGE LATTER
        CMP AL,' '
        JE  SPACE
        CMP AL,'0'
        JGE DIGIT
                 
     JMP FOR  
        SPACE:   
            INC SPS 
        JMP FOR
        
        DIGIT:
            CMP AL,'9'
            JG FOR
            INC DIG
        JMP FOR
        
        LATTER:
            CMP AL,'Z'
            JG  FOR
            CMP AL,'A'
            JE  VOWEL
            CMP AL,'E'
            JE  VOWEL
            CMP AL,'I'
            JE  VOWEL
            CMP AL,'O'
            JE  VOWEL
            CMP AL,'U'
            JE  VOWEL
            INC CONS
        JMP FOR
        LATTER2:
            CMP AL,'z'
            JG FOR 
            CMP AL,'a'
            JE  VOWEL
            CMP AL,'e'
            JE  VOWEL
            CMP AL,'i'
            JE  VOWEL
            CMP AL,'o'
            JE  VOWEL
            CMP AL,'u'
            JE  VOWEL
            INC CONS
         JMP FOR
        VOWEL:
            INC VOW
        JMP FOR
    EXIT:
    LEA DX,MSG2
    MOV AH,09H 
    INT 21H 
    
    LEA DX,MSG3
    MOV AH,09H 
    INT 21H
    MOV AH,02H
    MOV DL,VOW 
    INT 21H
    
    LEA DX,MSG4
    MOV AH,09H 
    INT 21H 
    MOV AH,02H
    MOV DL,CONS 
    INT 21H
    
    LEA DX,MSG5
    MOV AH,09H 
    INT 21H
    MOV AH,02H
    MOV DL,DIG 
    INT 21H
    
    LEA DX,MSG6
    MOV AH,09H 
    INT 21H
    MOV AH,02H
    MOV DL,SPS 
    INT 21H
     
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END