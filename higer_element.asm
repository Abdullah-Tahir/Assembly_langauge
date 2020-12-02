[org 0x0100];
main:
mov bx,0
mov ax,0
mov cx,0
mov cl,4
call mixi
jmp finished
compare:
mov ch,al
dec cl
cmp cl,0     
jne mixi
je returing_func

if_not_finshed:  
dec cl
cmp cl,0             
jne mixi
je returing_func


mixi:

    mov ax,[data+bx]
    add bx,2
   ; mov cl,3      ;this is where the magic happens
    mov dl,10      ;dividing the element by 10 to split it in "ones" and "tens"  
    div dl

    add al,ah
    ;mov ch,0
    cmp al,ch
    jg compare          ; jump to compare if greater
    jl if_not_finshed
returing_func:           
 ret       ; returning the function

finished:
mov [final],ch
 mov ax, 0x4c00 
    int 0x21
    data: dw 34,12,54,47
    final: dw 0