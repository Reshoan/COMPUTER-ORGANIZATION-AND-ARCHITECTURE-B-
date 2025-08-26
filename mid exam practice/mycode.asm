.model small
.stack 100h
.data            

input db ?  
convert db ?

enterMsg db "Enter any input: $"   
isSmallMsg db "It is a small letter. $"
isCapitalMsg db "It is a capital letter. $"
inCapitalMsg db "In capital it is : $"
inSmallMsg db "In small it is: $"
isNumMsg db "It is a number. $"
isInvMsg db "Invalid $"       
nl db 0AH, 0DH, "$"

.code

main proc  
    
    mov ax, @data
    mov ds, ax   
    
    ;take input
    mov ah, 9
    lea dx, enterMsg
    int 21h
    
    mov ah, 1
    int 21h
    mov input, al  
    
    mov ah, 9
    lea dx, nl
    int 21h
    
    ;classification
    mov bl, input
    cmp bl, '0'
    jl invalid
    cmp bl, '9'   
    jg checkLetters
    jmp number    
    
    number:
    mov ah, 9
    lea dx, isNumMsg
    int 21h
    jmp exit 
    
    checkLetters:
    mov bl, input
    cmp bl, 'A'
    jl invalid
    cmp bl, 'Z'
    jg checkSmallLetter 
    jmp capital
    
    capital:
    mov ah, 9
    lea dx, isCapitalMsg
    int 21h     
    
    lea dx, nl
    int 21h
    
    ;convert 
    mov bl, input
    add bl, 20h 
    mov convert, bl
    
    lea dx, inSmallMsg
    int 21h
    
    mov ah, 2
    mov dl, convert
    int 21h
    
    jmp exit      
    
    checkSmallLetter:
    mov bl, input
    cmp bl, 'a'
    jl invalid
    cmp bl, 'z'
    jg invalid 
    jmp small
    
    small:
    mov ah, 9
    lea dx, isSmallMsg
    int 21h     
    
    lea dx, nl
    int 21h
    
    ;convert 
    mov bl, input
    sub bl, 20h 
    mov convert, bl
    
    lea dx, inCapitalMsg
    int 21h
    
    mov ah, 2
    mov dl, convert
    int 21h  
    
    jmp exit
    
    
    invalid:
    mov ah, 9
    lea dx, isInvMsg
    int 21h
    jmp exit
    
    
    
    exit:
    mov ah, 4CH
    int 21h
    
    main endp
end main