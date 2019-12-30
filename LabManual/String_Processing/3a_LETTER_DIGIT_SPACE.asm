INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
   MSG2 DB 'THE STRING: ','$ '
   COUNT1 DB '0'
   COUNT2 DB '0'
   COUNT3 DB '0'
   COUNT4 DB '0'
    
.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    PRINT " ENTER THE STRING : "
    MOV AH,1
    FOR:
        INT 21H 
        CMP AL,0DH
        JE EXIT
  
        CMP AL, 'A'
        JGE LETTER1
        
        CMP AL,' '
        JE SPACE
        CMP AL,'0'
        JGE DIGIT
    
    JMP FOR 
    DIGIT:
        CMP AL,'9'
        JLE DIGIT2
        JMP FOR
    DIGIT2:
        INC  COUNT4 
        JMP FOR    
    
    
    LETTER1:
        CMP AL, 'z'
        JLE LETTER2
       JMP FOR 
    
     LETTER2:    
        CMP AL,'['
        JGE S 
         
        CMP AL, 'a'
        JE VOWEL
        CMP AL, 'A'
        JE VOWEL 
        
        CMP AL, 'e'
        JE VOWEL
        CMP AL, 'E'
        JE VOWEL
        
        CMP AL, 'i'
        JE VOWEL
        CMP AL, 'I'
        JE VOWEL
        
        CMP AL, 'o'
        JE VOWEL
        CMP AL, 'O'
        JE VOWEL
        
        CMP AL, 'u'
        JE VOWEL
        CMP AL, 'U'
        JE VOWEL
        
        INC COUNT1 
        
      JMP FOR   
    S:
        CMP AL, '`'
        JG LETTER2
    JMP FOR     
     
    VOWEL:
        INC COUNT2
        JMP FOR
    SPACE:
        INC COUNT3
        JMP FOR
    
    EXIT:
    PRINTN
    PRINT " VOWIL : " 
    MOV AH,2
    ;ADD COUNT2,48 
    MOV DL,COUNT2
    INT 21H
    PRINTN
    
    PRINT " CONSONENT : " 
    ;ADD COUNT1,48 
    MOV DL,COUNT1
    INT 21H
           
    PRINTN
    PRINT " DIGIT: "  
    MOV DL,COUNT4
    INT 21H       
           
    PRINTN
    PRINT " SPACE : "  
    MOV DL,COUNT3
    INT 21H
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
