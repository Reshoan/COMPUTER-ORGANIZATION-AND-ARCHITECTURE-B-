.model small
.stack 100h

.data


.code

main proc 
    
    mov ax, @data
    mov ds, ax 
    
    mov cx, 0 ;loop counter        
    jcxz endl ;only cx value is checked using JCXZ (jump if cx zero) to make sure it's not zero, just in case.
    
    ;if cx is 0, the problem is that the loop decrements cx so 0-1=-1 aka 0000h -> 
    ;->becomes ffffh, and now ffffh will keep decreaseing till its 0 and thats when the loop will stop
    
    Print:
    mov ah, 2
    mov dl, '*'
    int 21h
    mov dl, 10
    int 21h
    mov dl, 13
    int 21h 
    loop Print ;loop, loop decreases cx on its own. This is FOR LOOP also known as COUNT-CONTROLLED LOOP
    
    Endl:
    mov ah, 4CH
    int 21h
    
    
    main endp
end main