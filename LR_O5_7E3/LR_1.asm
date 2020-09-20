_STACK  segment para stack
        db      1024 dup(?)
_STACK  ends
 
_DATA   segment
        ;Опредилить число -678,используя минимальную возможную директиву.
        _s678   dw      -678
        ;Описать переменную памяти cvb, длиной двойное слово и загрузить в нее число 4578995
        cvb     dd      4578995
_DATA   ends
 
_TEXT   segment
        assume  cs:_TEXT, ds:_DATA, ss:_STACK
main    proc
        ;инициализация сегментного регистра данных
        mov     ax,     _DATA
        mov     ds,     ax
 
        ;Загрузить в DI число 3456h
        mov     di,     3456h
        ;Содержимое DI скопировать в AX
        mov     ax,     di
        ;Старшее слово переменной CVB скопировать в BX,младшее слово переменной CVB скопировать в DX
        mov     dx,     word ptr [cvb+2]
        mov     bx,     word ptr [cvb+0]
        ;Переменную с числом -678 скопировать из памяти в CX
        mov     cx,     [_s678]
        ;Используя стек, осуществить обмен содержимого AX и DI
        push    ax
        mov     ax,     di
        pop     di
        ;Выполнить обмен содержимого старшего и младшего байта AX
        xchg    al,     ah
 
        ;завершение программы
        mov     ax,     4C00h
        int 21h
main    endp
 
_TEXT   ends
 
        end     main
