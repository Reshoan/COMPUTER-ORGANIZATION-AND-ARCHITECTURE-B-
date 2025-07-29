.model small
.stack 100h
.data    

m1 db "Enter input: $"
m2 db 0AH, 0DH, "Input is greater than 5 $"
m3 db 0AH, 0DH, "Input is less than 5 $"
m4 db 0AH, 0DH, "Input is eqaul to 5 $"
                                           
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
    
    ;compare input with 5
    cmp input, '5'          ;write 5 in quotations, important!!
    jg L1
    jl L2
    je L3 
    
    ;input is greater than 5
    L1:
    mov ah, 9
    lea dx, m2
    int 21h
    jmp ending
    
    ;input is less than 5
    L2:
    mov ah, 9
    lea dx, m3
    int 21h
    jmp ending
    
    ;input is equal to 5
    L3:
    mov ah, 9
    lea dx, m4
    int 21h
    jmp ending
          
    ;return resources
    ending:
    mov ah, 4CH          
    int 21h    
        


	main endp
end main