[org 0x0100]
xor bx,bx ; empty bx
xor dx,dx ; empty dx
mov ax,5  ; taking any number you want to check binary of 
mov cx,10
loop1: ;loop1 is used to check shr of that binary
inc dx  
shr ax,1
jz loop2
sub cx,1
jnz loop1

loop2: ; loop2 is used to check shl of that binary
mov ax,5
loop3:
inc bx
shl ax,1
jz give
sub cx,1
jnz loop3


give: ; this is used to check whether shr or shl is best for binary 
cmp dx,bx
jb what

 
what: ; moving better option to ax 
mov ax,dx
jmp end
 
 
end:    
mov ax, 0x4c00              ; terminate program
int 0x21