data    segment 
        message db "Hello$"
        chislo dw -236
        W20 dd 1212020
        P20 db 11100000b
data    ends
stk     segment stack
        db  256 dup ('?') 
stk     ends
code segment
main:
    assume cs:code,ds:data,ss:stk
        mov ax,data
        mov ds,ax
        mov ax, 7E4h
        mov si,ax
        mov al,P20
        mov bp, word PTR [W20+2]
        mov di, word PTR [W20+0]
        mov bx, -236   
        push di
        mov di,si
        pop si
        
        xchg word PTR W20,ax    
        mov ah,9
        mov dx,offset message
        int 21h
        mov ah,7
        int 21h
        mov ax,4c00h
        int 21h
code ends
end main 
    
        
    