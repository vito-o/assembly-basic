assume ds:data, cs:code

data segment
  db 57h, 02h, 45h, 02h, 4ch, 02, 43h, 02h, 4fh, 02h, 4dh, 02h, 45h, 02h, 0, 0, 54h, 02h, 4fh, 02h, 0, 0, 4dh, 02h, 41h, 02h, 53h, 02h, 4dh, 02h, 21h, 02h
  db 57h, 24h, 45h, 24h, 4ch, 24h, 43h, 24h, 4fh, 24h, 4dh, 24h, 45h, 24h, 0, 0, 54h, 24h, 4fh, 24h, 0, 0, 4dh, 24h, 41h, 24h, 53h, 24h, 4dh, 24h, 21h, 24h
  db 57h, 01h, 45h, 01h, 4ch, 01h, 43h, 01h, 4fh, 01h, 4dh, 01h, 45h, 01h, 0, 0, 54h, 01h, 4fh, 01h, 0, 0, 4dh, 01h, 41h, 01h, 53h, 01h, 4dh, 01h, 21h, 01h
data ends

code segment

  start: mov ax, data
         mov ds, ax

         mov ax, 0b800H
         mov es, ax
        
         mov bx, 06e0H
         mov cx, 16
         mov si, 0

      s: mov ax, [si]
         mov es:[bx+64], ax
         add si, 2
         add bx, 2
         loop s
         
         mov bx, 0780h
         mov cx, 16
      s1:mov ax, [si]
         mov es:[bx+64], ax
         add si, 2
         add bx, 2
         loop s1
         
         mov bx, 0820h
         mov cx, 16
      s2:mov ax, [si]
         mov es:[bx+64], ax
         add si, 2
         add bx, 2
         loop s2

         mov ax, 4c00H
         int 21h

code ends
  
end start