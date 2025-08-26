.model small
.stack 100h

.data    

count db ?

enterMsg db "Enter Input: $"
totalMsg db "Total Character: $" 
nl db 10, 13, "$"



.code
main proc
    
    mov ax, @data
    mov ds, ax  
    
    mov count, 0
    
    mov ah, 9
    lea dx, enterMsg
    int 21h
    
    mov ah, 1
    
    REPEAT:
        int 21h
        cmp al, ' '       
        je END_REPEAT
        inc count
        jmp REPEAT

    END_REPEAT:
        mov ah, 9
        lea dx, nl
        int 21h
        lea dx, totalMsg
        int 21h
        mov ah, 2
        mov dl, count  
        add dl, '0'
        int 21h
        jmp Endl
                
                
    Endl:
    mov ah, 4CH
    int 21h
    
    
    main endp
end main
