; If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23. Find the sum of all the multiples of 3 or 5 below 1000.

; required for output
extern printf

section .data
	; Constants for system calls
	SUCCESS		equ 	0
	; Data definitions
	acc		dd  	0
	n		dd	0
	; for printing
	fmt: 		db 	"%d", 10, 0

section .text
	global main
main:	
accLoop:
	inc	dword [n]
	cmp	dword [n], 	1000
	je	exitLoop
	mov	edx,		0
	mov 	eax,		dword [n]
	cmp	eax,		3
	jl	accLoop
	je	equalsDivisor1
	mov	ebx,		3
	div	ebx
	cmp	edx,		0
	jne	skipSum1
equalsDivisor1:
	mov	eax,		dword [n]
	add	[acc], 		eax
	jmp	accLoop
skipSum1:
	mov	eax,		dword [n]
	cmp	eax,		5
	jl	accLoop
	je	equalsDivisor2
	mov	ebx,		3
	mov	edx,		0
	mov	ebx,		5
	div	ebx
	cmp	edx,		0	
	jne	accLoop
equalsDivisor2:
	mov	eax,		dword [n]
	add	[acc], 		eax
	jmp	accLoop
exitLoop:
	push	rbp
	mov	rdi, 		fmt
	mov	rsi, 		0		;zero out rsi to move dword acc there
	mov	esi, 		dword [acc]
	call	printf
	pop	rbp
	mov 	rax, 		SUCCESS
	ret
