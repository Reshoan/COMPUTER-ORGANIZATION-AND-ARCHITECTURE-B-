.model small
.stack 100h
.data    

m1 db "Enter any number: $"
m2 db 0AH, 0DH, "Input is a number$"
m3 db 0AH, 0DH, "Input is a capital letter$"
m4 db 0AH, 0DH, "Input is a small letter$"
m5 db 0AH, 0DH, "Invalid$"
                                           
input db ?

.code

main proc   
    
    mov ax, @data
    mov ds, ax
    
    ;print m1 
    mov ah, 9
    lea dx, m1
    int 21h
    
    ;take input
    mov ah, 1
    int 21h
    mov input, al
    
    ;compare input with 0
    cmp input, '0'          
    jge checkNum
    jmp letter 
    
    ;compare input with 9      
    checkNum:       
    cmp input, '9'
    jle number
    jmp letter
    
    ;print number msg
    number:
    mov ah, 9
    lea dx, m2
    int 21h
    jmp ending     
    
    ;compare input with A
    letter:
    cmp input, 'A'
    jge checkLetter 
    jmp smallLetter
    
    ;compare with Z
    checkLetter:
    cmp input, 'Z' 
    jle capital
    jmp smallLetter    
    
    ;compare with a
    smallLetter:
    cmp input, 'a'
    jge checkSmallLetter
    jmp invalid
    
    ;compare with z
    checkSmallLetter:
    cmp input, 'z'
    jle small
    jmp invalid
    
    ;print small msg  
    small:
    mov ah, 9
    lea dx, m4
    int 21h    
    jmp ending
               
    ;print capital msg
    capital:
    mov ah, 9
    lea dx, m3
    int 21h        
    jmp ending
               
    ;print invalid msg
    invalid:
    mov ah, 9
    lea dx, m5
    int 21h
    jmp ending
    
    ;return resources
    ending:
    mov ah, 4CH          
    int 21h    
        


	main endp
end main