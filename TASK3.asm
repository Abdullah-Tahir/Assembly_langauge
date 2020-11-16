[org 0x0100]
jmp start

data: dw 1, 4, 7, 3, 2, 6, 12, 15, 19, 100, 
plus: dw 0
; ----------------------------------------------------------

findBig:
            mov ax, [bx]     ; first number to ax
         

max:   cmp ax, [bx]     ; find the maximun number
            jge maxL      ; if greater or equal number
             mov ax, [bx]     ; maximum number was larger
            sub cx, 1
            jcxz stop
               
maxL:
            add bx, 2        ; advance bx to next index
            cmp ax,[data+bx]
         jb max   
            
 findsmall: 
             mov bx,data  
             mov bx,10
           mov dx,[data+bx]
           jmp sum
            

 min:
           cmp dx,[bx]
           jle minL
           mov dx,[bx]
           sub cx,1
           jcxz sum

 minL:
      add bx,2 
      cmp dx,[data+bx]
      ja min

;         
; ----------------------------------------------------------

 start:   mov cx,2  
         mov bx,data     
            jmp findBig

             
            
stop:  
     
             
        mov [plus],ax
               mov ax,0            
             mov bx,0
             mov cx,0
             mov dx,0
            
             
             jmp findsmall
   sum:      
              add [plus],dx
              mov ax,[plus]                  ;SUM
            mov ax, 0x4c00              ; terminate program
            int 0x21