data segment   
    
message db  'Hello$'                ;ao 0 
str20   db  'Variant20$'            ;ao 7
per1    dd  12fh                    ;ao 17
per2    db  5 dup (29)              ;ao 21 
per3    dw  ?                       ;ao 26
per4    db  1110100b                ;ao 28
per5    dw  -205,208,-209,306,-309  ;ao 29
ea_per2 dw  per2                    ;ao 39
pa_per2 dd  per2                    ;ao 41
ea_per3 dw  per3                    ;ao 45
pa_per3 dd  per3                    ;ao 47
        dd  -20.95                  ;ao 51
    data    ends                    ;ao 55
stk segment stack
    
    db  256 dup('?')
stk ends
code    segment

    main:
        assume cs:code,ds:data,ss:stk
        mov ax,data
        mov ds,ax
        mov ah,9
        mov dx,offset str20
        int 21h
        mov ah,7
        int 21h
        mov ax,4c00h
        int 21h
code    ends
end     main