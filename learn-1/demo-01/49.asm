assume cs:code

data segment
  dd 12345678H
data ends

code segment
  start: mov ax, data
         mov ds, ax
         mov bx, 0
         mov [bx], bx
         mov [bx+2], code
         jmp dword ptr ds:[0]
code ends

end start
;补全程序，使jmp指令执行后，cs:ip指向程序的第一条指�?