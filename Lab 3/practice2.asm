.model small
.stack 100h
.data    

m1 db "Enter any number: $"
m2 db 0AH, 0DH, "Valid$"
m3 db 0AH, 0DH, "Invalid$"

                                           
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
    jge check
    jmp invalid 
    
    ;compare input with 9      
    check:       
    cmp input, '9'
    jle valid
    jmp invalid
    
    ;print valid msg
    valid:
    mov ah, 9
    lea dx, m2
    int 21h
    jmp ending
    
    ;print invalid msg
    invalid:
    mov ah, 9
    lea dx, m3
    int 21h
    jmp ending
    
    
    
    
    ;return resources
    ending:
    mov ah, 4CH          
    int 21h    
        


	main endp
end main