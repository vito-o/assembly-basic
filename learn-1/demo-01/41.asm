assume cs:codesg

codesg segment
  ;mov dx, 1
  ;mov ax, 86a1h
  ;mov bx, 100
  ;div bx
  
  mov ax, 1001
  mov bl, 100
  div bl
  
  mov ax, 4c00h
  int 21h
codesg ends

end 