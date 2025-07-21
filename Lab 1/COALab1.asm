.model small

.stack 100h

.data


.code
main proc
    
    mov ah, 1         ;single user input
    int 21h  
    mov bh, al        ;shifting store 1 value to bh, al by default stores all values inputed into ah
    int 21h           ;taking yet another input
    mov bl, al        ;storing the input value in bl      
    
    mov ah, 2         ;single output, since new line is a char
    mov dl, 0AH       ;newline you can also write just 10
    int 21h                  
    mov dl, 0DH       ;carrige return, you can also write just 13
    int 21h
    
  
    mov dl, bh        ;output is done from dl, so bh is moved to dl
    int 21h   
    
    mov dl, bl          ;output is done from dl, so bl is moved to dl
    int 21h                                                                  
    
    mov bh, 33h          
    mov ah, 2
    mov dl, bh
    int 21h
    
     
    main endp

end main