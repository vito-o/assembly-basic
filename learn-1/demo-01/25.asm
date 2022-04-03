assume cs:code

a segment
  dw 1, 2, 3, 4, 5, 6, 7, 8
a ends

b segment
  dw 1, 2, 3, 4, 5, 6, 7, 8
b ends

d segment
  dw 0, 0, 0, 0, 0, 0, 0, 0
d ends

code segment

start:  mov cx, 8
        mov bx, 0

      s:mov dx, 0

        mov ax, a
        mov ds, ax
        add dx, ds:[bx]
        
        mov ax, b
        mov ds, ax
        add dx, ds:[bx]
        
        mov ax, d
        mov ds, ax
        mov ds:[bx], dx

        add bx, 2
        loop s

        mov ax, 4c00H
        int 21h

code ends

end start