;print_call.asm

section .data

	codes:	db '123456789abcdef'

section .text
global _start

_start:
	
	;number 1122... in hexadecimal format
	mov 	rax, 0x1122334455667788
	
	mov 	rdi, 1
	mov 	rdx, 1
	mov 	rcx, 64
	 ; Each 4 bits should be output as one hexadecimal digit
	 ; Use shift and bitwise AND to isolate them
	 ; the result is the offset in 'codes' array

.loop:
	push 	rax
	sub 	rcx, 4
	 ; cl is a register, smallest part of rcx
	 ; rax -- eax -- ah + al
	 ; rcx -- ecx -- ch + cl
	sar 	rax, cl
	and 	rax, 0xf

	lea 	rsi, [codes + rax]
	mov 	rax, 1
	
	; Syscall leaves rcx and r11 changed
	push 	rcx
	syscall
	pop 	rcx
	pop 	rax 
	test 	rcx, rcx	; test can be used for the fastest 'is it zero?' check
	jnz 	.loop

	; Exit the program
	mov 	rax, 60
	xor	rdi, rdi
	syscall
