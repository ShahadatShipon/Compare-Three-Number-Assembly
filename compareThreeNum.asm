.model small
.stack 100h 
.data

    msg1 DB 'Enter Three numbers : $'
    msg2 DB 'The greater number of these three is : $' 
    
.code
main proc 
    
    mov AX,@DATA
    mov DS,AX 
    
    ;print msg 1
    lea DX,msg1
    mov ah,09h
    int 21h
    
    ;input three numbers
    mov ah,1
    int 21h
    mov BL,AL
    int 21h
    mov BH,AL
    int 21h
    mov CL,AL
    
    ;print new line
    mov ah,2
    mov DL,0AH
    int 21h
    mov DL,0DH
    int 21h
    
    ;print msg 2
    lea DX,msg2
    mov ah,09h
    int 21h
    
    ;compare greater number
    CMP BL,BH
    JGE L2
    
    CMP BH,CL
    JGE L1
    mov ah,2
    mov DL,CL
    int 21h
    JMP EXIT
    
    L1:
        mov ah,2
        mov DL,BH
        int 21h
        JMP EXIT
        
    L2:
        CMP BL,CL
        JGE L21
        mov ah,2
        mov DL,CL
        int 21h
        JMP EXIT
        
    L21:
        mov ah,2
        mov DL,BL
        int 21h
        JMP EXIT
        
    EXIT:
        mov ah,4ch
        int 21h
    
    end main
main endp
        