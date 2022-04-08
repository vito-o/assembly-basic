; mov ax, seg
; mov ds, ax
; mov bx, 60h
;
; mov word ptr [bx+0ch], 38
; add word ptr [bx+0eh], 70
;
; mov si, 0
; mov byte ptr [bx+10h+si], 'v'
; inc si
; mov byte ptr [bx+10h+si], 'A'
; inc si
; mov byte ptr [bx+10h+si], 'x'
;
;
;
; mov ax, seg
; mov ds, ax
; mov bx, 60h
;
; mov word ptr [bx].0ch, 38   
; add word ptr [bx].0eh, 70
;
; mov si, 0
; mov byte ptr [bx].10h[si], 'v'
; inc si
; mov byte ptr [bx].10h[si], 'a'
; inc si
; mov byte ptr [bx].10h[si], 'x'
;
;
;
;
;
;
;
;
;
;
;
;
;
;