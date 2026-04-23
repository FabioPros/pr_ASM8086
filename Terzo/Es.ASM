DOSSEG
.MODEL SMALL
.STACK 100h
 
.DATA
n1 DB 01h
n2 DB 02h
msg1 DB 'Inizio!$'
msg2 DB 10, 'O. D.!$' ; Cosa significa? Crea un variabile di un byte, 10 è il carattere ACII per andare a capo, 'O.D.!' è quello che viene inserito.
msg3 DB 10, 'Fine!$'
 
.CODE
main:
MOV ax, @DATA ; Possiamo scrivere MOV ds, @DATA? Non si può fare perché deve passare per i registri cioè non c’è il collegamento diretto tra AX e DS.
MOV ds, ax
 
MOV dx, OFFSET msg1
MOV ax, 0900h
INT 21h
 
MOV al, n1
ADD al, n2
JC ov	
JMP fine
 
ov:
MOV dx, OFFSET msg2
MOV ax, 0900h
INT 21h
 
fine:
MOV dx, OFFSET msg3
MOV ah, 09h
INT 21h
MOV ax, 4c00h
INT 21h
END main
