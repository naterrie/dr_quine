;STEVE LE POUAAAAAAAA
bits 64
%define FILE "Grace_kid.s"
%define CODE ";STEVE LE POUAAAAAAAA%1$cbits 64%1$c%3$cdefine FILE %2$cGrace_kid.s%2$c%1$c%3$cdefine CODE %2$c%4$s%2$c%1$c%3$cmacro MAIN 2%1$csection .data%1$c	fname db %1, 0%1$c	code db %2, 0%1$c%1$csection .text%1$c	global main%1$c	extern dprintf%1$c%1$c	main:%1$c		push rbp%1$c%1$c		mov rax, 2%1$c		lea rdi, [rel fname]%1$c		mov rsi, 0x241%1$c		mov rdx, 0644o%1$c		syscall%1$c%1$c		cmp rax, 0%1$c		jle _error%1$c%1$c		mov rdi, rax%1$c		lea rsi, [rel code]%1$c		mov rdx, 10%1$c		mov rcx, 34%1$c		mov r8, 37%1$c		mov r9, rsi%1$c		xor rax, rax%1$c		call dprintf wrt ..plt%1$c%1$c		cmp rax, 0%1$c		jle _error%1$c%1$c		mov rax, 3%1$c		syscall%1$c%1$c		pop rbp%1$c%1$c		mov rax, 60%1$c		xor rdi, rdi%1$c		syscall%1$c%1$c	_error:%1$c		pop rbp%1$c%1$c		mov rax, 60%1$c		mov rdi, 1%1$c		syscall%1$c%3$cendmacro%1$c%1$cMAIN FILE, CODE%1$csection .note.GNU-stack noalloc noexec nowrite progbits%1$c"
%macro MAIN 2
section .data
	fname db %1, 0
	code db %2, 0

section .text
	global main
	extern dprintf

	main:
		push rbp

		mov rax, 2
		lea rdi, [rel fname]
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
%endmacro

MAIN FILE, CODE
section .note.GNU-stack noalloc noexec nowrite progbits
