[org 0x0100]
jmp start

data:dw  1,2,3,4,1,7 
answer:dw 0

start:
xor ax,ax  
xor bx,bx
xor cx,cx
xor dx,dx
mov cx,3
mov dx,5
mov bx,data ; moving array into bx

outer:
      mov ax,[bx]
      
      add bx,2
      inner:
   mov dx,[bx+2]
      add bx,2
      cmp dx,ax
      mov ax,dx
      je equal
      sub cx,1
      jcxz stop
     cmp ax,dx
    jne outer
      


jcxz stop
jmp inner
equal: 
  mov [answer],ax  ;this is repeted value
jmp inner
stop:
            
            mov ax, 0x4c00              ; terminate program
            int 0x21