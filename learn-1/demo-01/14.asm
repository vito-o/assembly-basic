assume cs:code

code segment

    mov bx, 0
    mov cx, 12

s:  mov ax, 0ffffH
    mov ds, ax
    mov dl, [bx]

    mov ax, 0020h
    mov ds, ax
    mov [bx], dl

    inc bx
    loop s

    mov ax, 4c00H
    int 21h

code ends

end
