; First Hello World assembly file

global _start

section .data
message: db 'Hello, World!', 10

section .text
_start:
	mov 	rax, 1		; Store systemcall number in eax
	mov 	rdi, 1		; Store filedescriptor as first argument (stdout)
	mov 	rsi, message	; Store string adress in rsi second argument
	mov 	rdx, 14		; Store string length as third argument
	syscall	

	mov 	rax, 60		; "exit" syscall number
	xor 	rdi,rdi
	syscall 
