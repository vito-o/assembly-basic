assume cs:codesg, ds:data, es:table

data segment
  db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
  db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
  db '1993', '1994', '1995'

  dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
  dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000

  dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
  dw 11542,14430,15257,17800
data ends

table segment
  db 21 dup ('year summ ne ?? ')
table ends

codesg segment
  start:  mov ax, data
          mov ds, ax

          mov ax, table
          mov ss, ax

          mov bx, 0
          mov si, 0
          mov bp, 0
          mov cx, 21

      s0: mov ax, [bx+si]
          mov [bp+0], ax
          add si, 2
          mov ax, [bx+si]
          mov [bp+2], ax
          add si, 2
          add bp, 10h
          loop s0

          mov cx, 21
          mov bp, 0
          mov si, 0
      s1: mov ax, [bx+si+84]    
          mov [bp+5], ax
          add si, 2
          mov ax, [bx+si+84]
          mov [bp+7], ax
          add si, 2
          add bp, 10h
          loop s1

          mov cx, 21
          mov bp, 0
          mov si, 0
      s2: mov ax, [bx+si+168]
          mov [bp+10], ax
          add si, 2
          add bp, 10h
          loop s2

          mov cx, 21
          mov bp, 0
      s3: mov ax, [bp+5]
          mov dx, [bp+7]
          div word ptr [bp+10]
          mov [bp+13], ax
          add bp, 10h
          loop s3

          mov ax, 4c00h
          int 21h
codesg ends

end start