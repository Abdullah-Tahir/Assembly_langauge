
[org 0x0100];

    

 main:   
    mov ax,0 ; emptying the registers
    mov bx,0
    mov cx,0
    mov dx,0
    mov cl,10
    mov dh,2
    call func_e  ;calling even function
    mov ax,0   ; emptying the registers before calling the odd function
    mov bx,0
    mov cx,0
    mov dx,0
    mov cl,10
    mov dh,2
    call func_o
    jmp finshed


func_e:
    
    mov ax,[data+bx] ; moving the elements throguh arrays
    add bx,2 
    div dh     ; dividing 
    cmp ah,0
    jne ending_even
    inc dl                ; if there is zero in ah then it is a even
    mov [num_of_even],dl    ; storing the increment in the num_of_even
    dec cl
    cmp cl,0

    jnz func_e 
ret_even:
    ret               ; returing the function

ending_even:
    dec cl
    cmp cl,0
    jne func_e
    je ret_even
ending_odd:
    dec cl
    cmp cl,0
    jne func_o
    je ret_odd
func_o:
    mov ax,[data+bx] ; same as before moving the elements throguh array
    add bx,2
    div dh
    cmp ah,0
    je ending_odd
    inc ch       ;if there is increment in the ch
    mov [num_of_odd],ch    ; then storing the increment in num_of_odd
    dec cl
    cmp cl,0
    jnz func_o
ret_odd:
    ret      ; returing of the odd function

finshed:
     mov ax, 0x4c00 
    int 0x21

    data : dw 1,2,3,4,5,6,7,8,9,10
    num_of_even : dw 0
    num_of_odd : dw 0