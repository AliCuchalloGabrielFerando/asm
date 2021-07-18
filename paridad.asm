;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;Nombre: Gabriel Fernando Ali Cuchallo
;Registro: paridad
;assemble and link with 
;nasm -f win64 -o paridad.o paridad.asm -l paridad.lst
;x86_64-w64-mingw32-gcc.exe -o paridad.exe paridad.o
;run:      -->> P1
;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;-----------------------------------------

;file: P1.asm (nombre programa)

;convertir los elementos de un arreglo de minuscula a mayuscula y de mayuscula
;arreglo dw 'x','a','M','E','o',0
;arreglo dw 'X','A','m',e','O',0
extern printf, scanf		

segment .data
;aqui se declaran variables inicializadas

arreglo db 5,10,4,5,3,0


		
segment .bss
;Block Started by Symbol(BSS) 
;aqui van las variables declaradas pero sin inicializar
paridad resb 1



segment .text 

global main 					
main:	
;etiqueta que indica el comienzo del programa principal
;aqui van las instrucciones
	xor rbx,rbx
	mov rbx, arreglo 	;direccion
	xor rsi,rsi			;indice
	xor rdx,rdx			;elemento actual

ciclo:
		mov dl,[rbx+rsi]
		cmp dl,0
		inc rsi
		jz final
		mov rcx,8
		;subciclo
		subciclo:
			
			mov r12b,dl
			and r12b,1
			add al,r12b
			ror dl,1
			loop subciclo
		
		
		jmp ciclo
	
final:
shr al,1
jc impar
mov byte[paridad],1
jmp par
impar:
mov byte[paridad],0
par:
ret
;---------------------------------------
;..........subrutinas....................	




