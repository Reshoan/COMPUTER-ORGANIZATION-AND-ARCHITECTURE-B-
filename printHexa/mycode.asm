.model small
.stack 100h
.data  

enterMsg db "Enter hexa input: $"
outputMsg db "Hexa output: $"
nl db 0Dh,0Ah,'$'     

.code
main proc 
    
    mov ax, @data
    mov ds, ax  
    
    xor bx, bx
    mov cl, 4  
    
    mov ah, 9
    lea dx, enterMsg
    int 21h
    jmp Input
    
    Input:
        mov ah, 1
        int 21h
        cmp al, 0Dh
        je  Output
        cmp al, 41h
        jge Letter
        and al, 0Fh
        jmp Shift
        
    Letter:
        sub al, 37h
    
    Shift:
        shl bx, cl
        or  bl, al
        jmp Input
    
    Output:
        mov cx, 4
        mov ah, 9
        lea dx, nl
        int 21h
        lea dx, outputMsg
        int 21h
    
    Output_Shift:
        mov dl, bh
        shr dl, 4
        rol bx, 4
        cmp dl, 10
        jge Print_Letter
        jmp Print_Number
    
    Print_Letter:
        add dl, 37h       
        mov ah, 2
        int 21h
        jmp Continue 
        
    Print_Number:
        add dl, 30h      
        mov ah, 2
        int 21h
        jmp Continue
    
    Continue:
        loop Output_Shift
        jmp exit
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main



                

