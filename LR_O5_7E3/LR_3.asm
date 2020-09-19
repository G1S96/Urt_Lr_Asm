data segment
    ;определите число  -236, используя минимально возможную директиву
    YTN     dw      -236
    ;опишите переменную памяти W20, длиной двойное слово и загрузите в нее число 1212020                    
    W20     dd      1212020
    ;опишите переменную памяти P20, длиной байт и загрузите в нее любое отрицательное число, заданное в двоичном виде
    P20     db      10001000b
data ends


stk     segment stack
        db      256 dup ('?') 
stk     ends


code segment
    main:
        assume cs:code,ds:data,ss:stk

        ;инициализация сегментного регистра данных
        mov     ax,     data 
        mov     ds,     ax

        ;Загрузить в АХ число 2020 в шестнадцатеричном виде.
        mov     ax,     7e4h
        ;Содержимое АХ скопировать в SI.
        mov     si,ax
        ;Переменную памяти P20 скопировать в любой регистр процессора.
        mov     al,     P20
        ;Старшее слово переменной W20 скопировать в BP, младшее слово переменной W20 скопировать в DI.
        mov     bp,     word ptr [W20+2]
        mov     di,     word ptr [W20+0]
        ;Переменную с числом  -236 скопировать в регистр процессора.
        mov     cx,     YTN
        ;Используя стек, осуществить обмен содержимого DI и SI
        push    di
        mov     di,     si
        pop     si
        ;Выполнить обмен младшего слова W20 и регистра AX
        xchg    word ptr W20,ax

        ;завершение программы
        mov     ax,     4C00h
        int 21h
code ends
end main
