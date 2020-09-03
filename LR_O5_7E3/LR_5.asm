data segment
slov1 db 'Input first word-> ','$'
slov2 db 'Input second word-> ','$'
i db ' I ','$'
mes2 db 10,13,'$'
buf db 30
    db ?
    db 30 dup (?)
buf2 db 30
    db ?
    db 30 dup (?) 
data ends
stk  segment stack
     db 256 dup('?')
stk ends
code segment
main:
    assume cs:code,ds:data,ss:stk
    mov ax,data
    mov ds,ax
    
    mov ah,9
    lea dx,slov1
    int 21h
    
    mov ah,10
    lea dx,buf
    int 21h
    mov bl,buf+1
    mov bh,0
    mov buf[bx+2],'$'
    
    mov si,1
    mov dl,buf[si]
    
    mov ah,9
    lea dx,mes2
    int 21h
    
    lea dx,slov2
    int 21h
    
    mov ah,10
    lea dx,buf2
    int 21h
    mov bl,buf2+1
    mov bh,0
    mov buf2[bx+2],'$'
    ;????? ?????? ??? ???????
    mov ah,9
    lea dx,mes2
    int 21h
    mov si,1
    mov dl,buf2[si]
    ;???? ?? ?????? 2 ?????
    mov ah,9
    lea dx,buf2 + 2
    int 21h
    ;???? ? 
    mov ah,9
    lea dx,i
    int 21h
    ;?? ?????? 1 ??
    mov ah,9
    lea dx,buf + 2
    int 21h
    ;????? 
    mov ah,7
    int 21h
    mov ax,4c00h
    int 21h
code ends
end main