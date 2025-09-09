.model small
.stack 100h
.data  

enterHexaMsg db "Hexa input: $"
outputHexaMsg db "Hexa output: $"    
outputBinaryMsg db "In Binary: $"
zeroMsg db "Number of Zero: $"
oneMsg db "Number of One: $"
nl db 0Dh,0Ah,'$'     

countZero db ?
countOne  db ?
value     db ?       

.code
InputHexa proc
    
    xor bx, bx
    mov cl, 4  
    
    mov ah, 9
    lea dx, enterHexaMsg
    int 21h
    jmp Input
    
    Input:
        mov ah, 1
        int 21h
        cmp al, 0Dh
        je  DoneInput
        cmp al, 41h
        jge Letter
        and al, 0Fh
        jmp Shift
        
    Letter:
        sub al, 37h
    
    Shift:
        shl bx, cl
        or  bl, al
        jmp Input  
    
    DoneInput:
        ret                  
        
InputHexa endp

OutputHexa proc
    
    StartOutputH:
        mov cx, 4
        mov ah, 9
        lea dx, nl
        int 21h
        lea dx, outputHexaMsg
        int 21h
    
    Output_Shift_H:
        mov dl, bh
        shr dl, 4
        rol bx, 4
        cmp dl, 10
        jge Print_Letter
        jmp Print_Number
    
    Print_Letter:
        add dl, 37h       
        mov ah, 2
        int 21h
        jmp continueH 
        
    Print_Number:
        add dl, 30h      
        mov ah, 2
        int 21h
        jmp continueH
    
    continueH:
        loop Output_Shift_H       
        
        ret
        
OutputHexa endp 

OutputBinary proc
    
    OutputB:
        mov cx, 16                
        mov ah, 9
        lea dx, nl
        int 21h
        lea dx, outputBinaryMsg   
        int 21h
    
    Output_Shift_B:
        rol bx, 1                  
        jnc zero
        jc  one
    
    zero:
        mov ah, 2
        mov dl, '0'
        int 21h
        jmp continueB
        
    one:
        mov ah, 2
        mov dl, '1'
        int 21h
        jmp continueB  
        
    continueB:
        loop Output_Shift_B    

        ret
        
OutputBinary endp

zeroOne proc
    mov countZero, 0
    mov countOne, 0   
    
    mov ah, 9
    lea dx, nl
    int 21h
    
    mov cx, 16          
    mov dx, bx          
    
shiftLoop:
    rol dx, 1           
    jc oneBit
    jmp zeroBit
    
zeroBit:  
    inc countZero
    jmp cont
    
oneBit:
    inc countOne
    jmp cont
    
cont:
    loop shiftLoop           
    
    lea dx, zeroMsg
    mov ah, 9
    int 21h
    mov ah, 2
    mov dl, countZero 
    add dl, '0'
    int 21h   
    
    ret
zeroOne endp



main proc 
    
    mov ax, @data
    mov ds, ax     
    
    call InputHexa
    call OutputHexa  
    call OutputBinary
    call zeroOne    
    
exit:
    mov ah, 4ch
    int 21h
    
main endp
end main
