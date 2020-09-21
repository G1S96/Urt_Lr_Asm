data    segment 
    msg_a   db    'A max!$'
    msg_be  db    'B max!$'
    msg_e   db    'A equals B!$'
data    ends

stk     segment stack
        db  256 dup ('?') 
stk     ends


code segment
main:   
        assume cs:code,ds:data,ss:stk

        mov ax,data
        mov ds,ax

        mov ax,4        ;A
        mov bx,55       ;B
        cmp ax,bx       

        ja if_a
        jbe if_be
        
if_a:
        lea dx, msg_a
        jmp final
if_be:
        je if_e
        lea dx,msg_be
        jmp final
if_e:
        lea dx,msg_e

        
final:
        mov ah,9
        int 21h

        mov ah,1
        int 21h

        mov ax,4C00h
        int 21h

code ends
end main
