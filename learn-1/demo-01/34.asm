;伪代码

; 2000: 1000 BE 00 06 00 00 00
; 
; mov ax, 2000h
; mov ds, ax
; mov bx, 1000h
; mov si, 0
; mov ax, [bx+si]
; inc si
; mov cx, [bx+si]
; inc si
; mov di, si
; add cx, [bx+di]
;
;
;
; 伪代码-2
; 2000: 1000 BE 00 06 00 6A 22 ...
;
; mov ax, 2000h
; mov ds, ax
; mov bx, 1000h
; mov si, 0
; mov ax, [bx+2+si]
; inc si
; mov cx, [bx+2+si]
; inc si
; mov di, si
; mov bx, [bx+2+di]
;
;
;