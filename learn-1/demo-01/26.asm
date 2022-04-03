assume cs:code

a segment
  db 1, 2, 3, 4, 5, 6, 7, 8
a ends

b segment
  db 1, 2, 3, 4, 5, 6, 7, 8
b ends

d segment
  db 0, 0, 0, 0, 0, 0, 0, 0
d ends

code segment

  start: mov cx, 8
         mov bx, 0

         mov ax, a
         mov ds, ax

         mov ax, b
         mov es, ax

         mov ax, d
         mov ss, ax

       s:mov ax, ds:[bx]
         add ss:[bx], ax
         mov ax, es:[bx]
         add ss:[bx], ax

         add bx, 2
         loop s

         mov ax, 4c00H
         int 21h

code ends

end start