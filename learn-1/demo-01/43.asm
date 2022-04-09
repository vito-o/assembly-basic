assume cs:codesg, ds:data

data segment
  db '1975', '1976', '1977', '1978', '1979', '1980', '1981', '1982', '1983'
  db '1984', '1985', '1986', '1987', '1988', '1989', '1990', '1991', '1992'
  db '1993', '1994', '1995'
  ;以上是表�?1年的21个字符串

  dd 16,22,382,1356,2390,8000,16000,24486,50065,97479,140417,197514
  dd 345980,590827,803530,1183000,1843000,2759000,3753000,4649000,5937000
  ;以上是表�?1年公司总收入的21个dword型数�?

  dw 3,7,9,13,28,38,130,220,476,778,1001,1442,2258,2793,4037,5635,8226
  dw 11542,14430,15257,17800
  ;以上表示21年公司雇员人数的21个word型数�?
data ends

cache segment
  dw 8 dup (0)
cache ends

stack segment
  db 16 dup (0)
stack ends

table segment
  db 21 dup ('year summ ne ?? ')
table ends

codesg segment
          ;
  start:  mov ax, data
          mov ds, ax

          ;es init value
          mov ax, table
          mov es, ax

          ;stack init value
          mov ax, stack
          mov ss, ax
          mov sp, 16

          ;loop init value
          mov cx, 21
          mov bx, 0

          ;ds -> cache
          mov ax, cache
          mov ds, ax

          ;set year offset in caceh
          mov ax, 0
          mov ds:[0], ax

          ;set salary offset in caceh
          add ax, 84
          mov ds:[2], ax

          ;set employee offset in caceh
          add ax, 84
          mov ds:[4], ax

          ;be used in ES
          mov bx, 0

          ;-------------------year--start----------------------
      so: mov ax, cache
          mov ds, ax
          mov si, ds:[0]

          mov ax, data
          mov ds, ax
          
          ;get value
          mov ax, ds:[si]
          ;set value
          mov es:[bx], ax

          ;get value
          mov ax, ds:[si+2]
          ;set value
          mov es:[bx+2], ax

          ;update offset of cache[0]
          mov ax, cache
          mov ds, ax
          add si, 4
          mov ds:[0], si
          ;-------------------year--end----------------------
          ;-------------------salary--start----------------------
          ;set si value
          ;mov ax, cache
          ;mov ds, ax
          mov si, ds:[2]

          ;set ds value
          mov ax, data
          mov ds, ax

          ;get value
          mov ax, ds:[si]
          ;set value
          mov es:[bx+5], ax

          ;get value
          mov ax, ds:[si+2]
          ;set value
          mov es:[bx+5+2], ax

          ;set si in cache
          mov ax, cache
          mov ds, ax
          add si, 4
          mov ds:[2], si
          ;-------------------salary--end----------------------
          ;-------------------employee--start----------------------
          ;set si value
          ;mov ax, cache
          ;mov ds, ax
          mov si, ds:[4]

          ;set ds value
          mov ax, data
          mov ds, ax

          ;get value
          mov ax, ds:[si]
          ;set value
          mov es:[bx+10], ax

          ;set si in cache
          mov ax, cache
          mov ds, ax
          add si, 2
          mov ds:[4], si
          ;-------------------employee--end----------------------
          ;-------------------avg--income--start----------------------
          mov ax, es:[bx+5]
          mov dx, es:[bx+7]
          div word ptr es:[bx+10]
          mov es:[bx+13], ax
          ;-------------------avg--income--end----------------------
          add bx, 16
          loop so

          mov ax, 4c00h
          int 21h
codesg ends

end start

