;find no. of one's and zeros
;is number odd of even
;use reverse and see content in register

.model small
.stack 100h
.data  

value db ? 
countOne db ?
countZero db ?         
           
evenMsg db "This is an even number. $"  
oddMsg db "This is an odd number. $"   

oneMsg db "Number of one: $"
zeroMsg db "Number of zero: $" 

nl db 0Dh,0Ah,'$'     

.code
main proc 
    
    mov ax, @data
    mov ds, ax  
    
    ;define value
    mov value, 4ah
    mov bh, value
    
    ;even or odd test
    test bh, 01h
    jz even
    jnz odd  
    
    even:
    mov ah, 9
    lea dx, evenMsg
    int 21h 
    jmp zeroOne
    
    odd:
    mov ah, 9
    lea dx, oddMsg
    int 21h 
    jmp zeroOne      
    
    ;number of 1's and 0's
    zeroOne:  
    mov countZero, 0
    mov countOne, 0   
    
    mov ah, 9
    lea dx, nl
    int 21h
    
    mov bh, value
    
    mov cx, 8
    
    shift:
    rol bh, 1
    jc one
    jmp zero
    
    zero:  
    inc countZero
    jmp continue
  
    one:
    inc countOne
    jmp continue
    
    continue:
    loop shift
    jmp printNZO
    
    printNZO:  
    ;print no. of 1
    mov ah, 9
    lea dx, oneMsg
    int 21h    
    mov ah, 2
    mov dl, countOne 
    add dl, '0'
    int 21h   
    mov ah, 9      
    lea dx, nl
    int 21h   
    
    ;print no. of 0
    lea dx, zeroMsg
    int 21h
    mov ah, 2
    mov dl, countZero 
    add dl, '0'
    int 21h       
    
    ;reverse
    mov cx, 8
    mov bh, value
    jmp reverse 
    
    reverse:   
    shl bh, 1
    rcr bl, 1
    loop reverse
    mov bh, bl
    jmp exit
    
    exit:
    mov ah, 4ch
    int 21h
    
    main endp
end main





