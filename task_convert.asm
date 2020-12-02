[org 0x0100]

jmp here


here:

push 2
push 2
call add_1
jmp end

add_2:
mov bp,sp
mov dx,[bp+2]

add dx,ax
add dx,bx
pop word[bp+2]
ret 


add_1:

push bp
mov bp,sp
mov ax,[bp+4]
mov bx,[bp+6]
add word[data],bx
add word[data],ax
push word[data]
call add_2
pop bp
ret 4



end:
mov  ax, 0x4c00
int  0x21

data: dw 0