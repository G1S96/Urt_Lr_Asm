masm
model small
.stack 256
.data
    message db 'Surname',10,13,'Name',10,13,'Patronymic$'
    A dw 8474
    B dw -240
    C dd 96020
    D dd 508720
    buf db 20
    db 20 dup (?)
.code
begin:
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,message
    int 21h
    mov ax,4c00h
    int 21h
end begin