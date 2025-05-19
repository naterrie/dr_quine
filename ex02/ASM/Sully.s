bits 64

section .data
	fname db "Sully_%d.s", 0
	code db "code entrer", 0
	compil db "nasm -f elf64 Sully_%d.s && gcc -Wall -Wextra -Werror %1$s.o -o %1$s", 0
	number dd 5

section .bss
	name resb 10
	gcc resb 100

section .text
	global main
	extern dprintf
	extern sprintf

	main:
		push rbp

		mov eax, [rel number]
		cmp eax, 0
		jle _error

		lea rdi, [rel name]
		lea rsi, [rel fname]
		mov rdx, [rel number]
		xor rax, rax
		call sprintf wrt ..plt

		mov rax, 2
		lea rdi, [rel name]
		mov rsi, 0x241
		mov rdx, 0644o
		syscall

		cmp rax, 0
		jle _error

		mov rdi, rax
		lea rsi, [rel code]
		mov rdx, 10
		mov rcx, 34
		mov r8, 37
		mov r9, rsi
		xor rax, rax
		call dprintf wrt ..plt

		cmp rax, 0
		jle _error

		mov rax, 3
		syscall

		pop rbp

		mov rax, 60
		xor rdi, rdi
		syscall

	_error:
		pop rbp

		mov rax, 60
		mov rdi, 1
		syscall
