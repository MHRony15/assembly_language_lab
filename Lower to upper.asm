.MODEL SMALL
.STACK 100H
.CODE  
.DATA
    CR EQU 0DH
    CR EQU 0AH
 MSG1 DB 'ENTER A LOWER CASE LETTER: $'
 MGS2 DB 0DH,0AH,'IN UPPER CASE IT IS: '
 CHAR DB ?,'$'
 



MAIN PROC
MOV AX,@DATA
MOV DS,AX
 
LEA DX,MSG1
MOV AH,9
INT 21H

MOV AH,1 
INT 21H
SUB AL,20H
MOV CHAR,AL

LEA DX,MSG2
MOV AH,12
INT 21H  

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN