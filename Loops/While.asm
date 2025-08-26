.model small
.stack 100h

.data

count db ? 
enterMsg db "Enter Input: $"
countMsg db "Number of Characters: $"
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
    int 21h
    
    WHILE_:
        cmp al, 0DH 
        je END_WHILE 
        inc count
        int 21h
        
        jmp WHILE_
        
    END_WHILE:
        mov ah, 9
        lea dx, nl
        int 21h
        lea dx, countMsg
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
