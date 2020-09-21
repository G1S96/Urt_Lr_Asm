data    segment 
data    ends

stk     segment stack
        db  256 dup ('?') 
stk     ends

assume cs:code,ds:data,ss:stk
code segment
jmp main
function1:
        push bp
        mov  bp,sp
        push ax
        push bx
         
        mov ax,[ss:bp+4+2]
        mov bx,[ss:bp+4+0]

        add ax,bx

        mov [ss:bp+4+4],ax

        pop bx
        pop ax
        pop bp
ret

function2:
        push bp
        mov bp,sp
        push ax
        push bx

        mov ax,[ss:bp+4+4]
        mov bx,[ss:bp+4+2]
        
        push 0
        push ax
        push bx
        call function1
        pop ax
        pop ax
        pop ax

        mov bx,[ss:bp+4+0]
        add ax,bx
        mov [ss:bp+4+6],ax

        pop bx
        pop ax
        pop bp

ret

main:
        push 0 ;result
        push 7 ;a
        push 1 ;b
        push 3 ;c

        call function2

        pop ax
        pop ax
        pop ax
        pop ax

exit:
        mov ax,4C00h
        int 21h

code ends
end main 
