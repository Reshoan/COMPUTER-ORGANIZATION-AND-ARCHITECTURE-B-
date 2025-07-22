.model small

.stack 100h

.data

a db ?
b db ?          
msg1 db "enter two inputs $"
msg2 db "output $"                            
msg3 db "summation $"

.code
main proc                                     
    
    mov ax, @data        ;initialize data segment in code segment
    mov ds, ax           
    
    mov ah, 9            ;set to string print mode
    lea dx, msg1         ;load effective address holds messages address
    int 21h              ;print message 
    
    mov ah, 1            ;set to input mode
    int 21h              ;take input
    mov a, al            ;save input in bl
    int 21h              ;take another input
    mov b, al            ;save input in bh
    
    mov ah, 2            ;set to output mode
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return              
    
    mov ah, 9            ;set to string print mode
    lea dx, msg2         ;load effective address holds messages address
    int 21h              ;print message                                  
    
    
    mov ah, 2            ;set to single output mode again
    mov dl, a            ;move first input to dl to print
    int 21h              ;print first value
    mov dl, b            ;move second value to dl to print
    int 21h              ;print second value               
    
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return   
    
    mov ah, 9            ;set to string print mode
    lea dx, msg3         ;load effective address holds messages address
    int 21h              ;print message         
    
    mov bl, b            ;content of b moved to bl because add will not work if both destination and source is a variable
    add bl, a            ;summation
    
    mov ah, 2            ;single char output mode
    mov dl, bl           ;setting up to print sum
    sub dl, 30h          ;subtracting to show decimal value, not hex equivalent
    int 21h              ;print
    
    
    mov ah, 4CH          ;reset resources being used
    int 21h
    
    
    
    main endp

end main