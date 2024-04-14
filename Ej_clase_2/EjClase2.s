/** MEMCPY **
	R0 4 byte space
	R1 4 byte word
	R2 amount of bytes to copy
	Alumno: David, Pedro
	Legajo: 159.032-7
*/

.section .data
	origen: .word 0x11223344	//Palabra de origen (4 bytes)
	destino: .space 4   //Espacio de destino para copiar la palabra (4 bytes)
  cantidad: .word 4		//Cantidad de bytes a copiar

.section .text  
	.global _start

_start:

	LDR R0, =destino	//Inicializo R0 con la dirección destino
	LDR R1, =origen		//Inicializo R1 con la direccion origen
	LDR R2, =cantidad	//Inicializo R2 con la direccion de cantidad
	LDR R2, [R2]			//Cargo el valor almacenado en la direccion apuntada por cantidad
	BL memcpy 
	
memcpy:
	CMP R2, #0		//Si R2 es 0, significa que la palabra origen no existe, por lo que el 
								//programa termina
	BEQ memcpy_end 
    
memcpy_loop:
	LDRB R3, [R1],#1	//Cargo 1 byte de la dirección de memoria apuntada por R1 en el registro R3 
										//y luego incrementa el valor de R1 en 1 byte para apuntar a la siguiente posicion de memoria
	STRB R3, [R0],#1  //Lo mismo que arriba, pero cargo el byte contenido en R3 en la direccion de memoria apuntada por R0
	SUBS R2,R2,#1
	BNE memcpy_loop

memcpy_end:
	BX R14
