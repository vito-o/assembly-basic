assume cs:code

a segment
  dw 1, 2, 3, 4, 5, 6, 7, 8, 9, 0ah, 0bh, 0ch, 0dh, 0eh, 0fh, 0ffh
a ends

b segment
  dw 0, 0, 0, 0, 0, 0, 0, 0
b ends

code segment
  start:mov bx, 14
        mov cx, 8
  		  
        mov ax, b
        mov ds, ax

        mov ax, a
        mov ss, ax
        mov sp, 0

      s:pop ds:[bx]
        sub bx, 2
        loop s
        
        mov ax, 4c00h
        int 21h
        
code ends

end start