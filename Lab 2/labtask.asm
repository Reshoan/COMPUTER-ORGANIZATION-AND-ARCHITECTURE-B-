                                                                            .model small

.stack 100h

.data

a db ?
b db ?   
c db ?

msg1 db "Input 1: $"
msg2 db "Input 2: $"
msg3 db "Input 3: $"
       
msg4 db "Summation: $"
msg5 db "Difference between 1st two inputs: $"

.code
main proc                                     
    
    mov ax, @data        ;initialize data segment in code segment
    mov ds, ax                                                       
    
    
    
     
    ;Print msg 1
    mov ah, 9            ;set to string print mode
    lea dx, msg1         ;load effective address holds messages address
    int 21h              ;print message
    
    ;take input 1 
    mov ah, 1            ;set to input mode
    int 21h              ;take input
    mov a, al            ;save input in bl    
    
    ;newline      
    mov ah, 2
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return 
    
    ;Print msg 2
    mov ah, 9            ;set to string print mode
    lea dx, msg2         ;load effective address holds messages address
    int 21h              ;print message
    
    ;take input 2 
    mov ah, 1            ;set to input mode
    int 21h              ;take input
    mov b, al            ;save input in bl    
    
    ;newline      
    mov ah, 2
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return 
    
                                                
    ;Print msg 3
    mov ah, 9            ;set to string print mode
    lea dx, msg3         ;load effective address holds messages address
    int 21h              ;print message
    
    ;take input 3 
    mov ah, 1            ;set to input mode
    int 21h              ;take input
    mov c, al            ;save input in bl    
    
    ;newline      
    mov ah, 2
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return 
                                                   
                                                   
                                                   
    ;summation
    mov bl, a
    add bl, b
    add bl, c     
    
    ;print msg4       
    mov ah, 9            ;set to string print mode
    lea dx, msg4         ;load effective address holds messages address
    int 21h              ;print message          
    
    ;print sum value
    mov ah, 2
    mov dl, bl          
    sub dl, 60h
    int 21h         
    
    ;newline      
    mov dl, 0Ah          ;set print newline command
    int 21h              ;print newline
    mov dl, 0Dh          ;set carrige return command
    int 21h              ;print carrige return                                
                                                   
    ;print msg5       
    mov ah, 9            ;set to string print mode
    lea dx, msg5        ;load effective address holds messages address
    int 21h              ;print message          
    
    ;subtraction
    mov bl, a
    sub bl, b
    
    ;print sub
    mov ah, 2  
    mov dl, bl 
    add dl, 30h
    int 21h                          
                                                   
    mov ah, 4CH          ;reset resources being used
    int 21h
    
    
    
    main endp

end main