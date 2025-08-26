.model small
.stack 100h
.data

inp1 db ?
inp2 db ?    
sum db ?         
subtr db ?

inp1Msg db "Please enter first number: $"
inp2Msg db "Please enter second number: $"

sumMsg db "Summation of $"
andd db " and $"
isColon db " is : $"

diffMsg db "Difference between $"
since db "Since $"
isGrtr db " is greater than $"
nPoss db " subtraction is not possible.$"      

inv db " is not a valid number.$"  

nl db 0AH, 0DH, "$"

.code

main proc
    mov ax, @data
    mov ds, ax   
    
    ;prompt first input
    mov ah, 9
    lea dx, inp1Msg
    int 21h 
    
    mov ah, 1
    int 21h
    mov inp1, al     
    
    mov ah, 9
    lea dx, nl
    int 21h
    
    ;prompt second input
    mov ah, 9
    lea dx, inp2Msg
    int 21h 
    
    mov ah, 1
    int 21h
    mov inp2, al  
    
    mov ah, 9
    lea dx, nl
    int 21h  
    
    
    ;input validation
    mov bl, inp1
    cmp bl, '0'
    jl invalid
    cmp bl, '9'
    jg invalid
    
    mov bl, inp2
    cmp bl, '0'
    jl invalid
    cmp bl, '9'
    jg invalid
    
    jmp calculation
    
    
    ;invalid
    invalid:
    mov ah, 2
    mov dl, bl
    int 21h
    
    mov ah, 9
    lea dx, inv
    int 21h     
    
    lea dx, nl
    int 21h     
    
    jmp exit
    
    
    ;calculation
    calculation:
    
    ;sum
    mov bl, inp1
    add bl, inp2
    sub bl, 30h   
    mov sum, bl 
    
    ;print sum
    mov ah, 9
    lea dx, sumMsg
    int 21h
    
    mov ah, 2
    mov dl, inp1
    int 21h
    
    mov ah, 9
    lea dx, andd
    int 21h
    
    mov ah, 2
    mov dl, inp2
    int 21h
    
    mov ah, 9
    lea dx, isColon
    int 21h
    
    mov ah, 2
    mov dl, sum
    int 21h
    
    mov ah, 9
    lea dx, nl
    int 21h       
    
    ;check if inp1 is greater than inp2
    mov bh, inp1
    mov bl, inp2
    cmp bh, bl
    jl inp2IsGreater
    jmp inp1IsGreater  
    
    inp1IsGreater:
    mov bl, inp1
    sub bl, inp2 
    add bl, 30h
    mov subtr, bl
    
    mov ah, 9
    lea dx, diffMsg
    int 21h
    
    mov ah, 2
    mov dl, inp1
    int 21h
    
    mov ah, 9
    lea dx, andd
    int 21h
    
    mov ah, 2
    mov dl, inp2
    int 21h
    
    mov ah, 9
    lea dx, isColon
    int 21h
    
    mov ah, 2
    mov dl, subtr
    int 21h 
    
    jmp exit
    
    
    inp2IsGreater:
    mov ah, 2
    mov dl, inp2
    int 21h
    
    mov ah, 9
    lea dx, isGrtr
    int 21h
    
    mov ah, 2
    mov dl, inp1
    int 21h
    
    mov ah, 9
    lea dx, nPoss
    int 21h   
    
    lea dx, nl
    int 21h
    
    jmp exit
    
    
    
    
    exit:
    mov ah, 4CH
    int 21h
        
    
    
    main endp
end main