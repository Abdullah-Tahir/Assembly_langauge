[org 0x0100]
xor ax,ax ;empty ax
xor bx,bx ;empty bx
xor dx,dx ;empty dx
xor cx,cx  ; empty cx
mov cx,5
mov bx,0
loop2:
dec cx
loop1:
mov ax, [data+bx] ; creating loop in order to go thorugh all numbers in array
add bx,2
TEST ax, 1
 jz even ;if it is even storing it in the dl(lower address)
inc dl
jmp loop1
 even:
 inc dh ; if it is odd storing it in the dh(higher address)
 jcxz end ;jump when cx register is zero
 jmp loop2
 end:
    mov bx,0 ;empty the used register       
    mov  ax, 0x4c00
    int  0x21

data:dw 2, 3, 6, 4, 8, 67, 32
