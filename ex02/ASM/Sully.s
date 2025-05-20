bits 64

section .data
	fname db "Sully_%d.s", 0
	fnm db "Sully_%d", 0
	code db  "bits 64%1$c%1$csection .data%1$c	fname db %2$cSully_%3$cd.s%2$c, 0%1$c	fnm db %2$cSully_%3$cd%2$c, 0%1$c	code db  %2$c%4$s%2$c, 0%1$c	compil db %2$cnasm -f elf64 Sully_%3$c2$d.s && gcc -Wall -Wextra -Werror %3$c1$s.o -o %3$c1$s && ./Sully_%3$c2$d%2$c, 0%1$c	number dd %5$d%1$c%1$csection .bss%1$c	name resb 9%1$c	gcc resb 100%1$c	mexec resb 9%1$c	ncompil resb 8%1$c%1$csection .text%1$c	global main%1$c	extern dprintf%1$c	extern sprintf%1$c	extern system%1$c%1$c	main:%1$c		push rbp%1$c%1$c		mov eax, [rel number]%1$c		dec eax%1$c		cmp eax, 0%1$c		jl _end%1$c%1$c		lea rdi, [rel name]%1$c		lea rsi, [rel fname]%1$c		mov edx, [rel number]%1$c		dec edx%1$c		xor rax, rax%1$c		call sprintf wrt ..plt%1$c%1$c		mov rax, 2%1$c		lea rdi, [rel name]%1$c		mov rsi, 0x241%1$c		mov rdx, 0644o%1$c		syscall%1$c%1$c		cmp rax, 0%1$c		jle _error%1$c%1$c		mov rdi, rax%1$c		lea rsi, [rel code]%1$c		mov rdx, 10%1$c		mov rcx, 34%1$c		mov r8, 37%1$c		mov r9, rsi%1$c		mov r10, [rel number]%1$c		dec r10%1$c		push r10%1$c		push r10%1$c		xor rax, rax%1$c		call dprintf wrt ..plt%1$c%1$c		pop r10%1$c		pop r10%1$c		cmp rax, 0%1$c		jle _error%1$c%1$c		mov rax, 3%1$c		syscall%1$c%1$c		lea rdi, [rel ncompil]%1$c		lea rsi, [rel fnm]%1$c		mov eax, [rel number]%1$c		mov edx, eax%1$c		dec edx%1$c		xor rax, rax%1$c		call sprintf wrt ..plt%1$c%1$c		lea rdi, [rel gcc]%1$c		lea rsi, [rel compil]%1$c		lea rdx, [rel ncompil]%1$c		mov ecx, [rel number]%1$c		dec ecx%1$c		xor rax, rax%1$c		call sprintf wrt ..plt%1$c%1$c		lea rdi, [rel gcc]%1$c		xor rax, rax%1$c		call system wrt ..plt%1$c%1$c	_end:%1$c		pop rbp%1$c		mov rax, 60%1$c		mov rdi, 0%1$c		syscall%1$c%1$c	_error:%1$c		pop rbp%1$c%1$c		mov rax, 60%1$c		mov rdi, 1%1$c		syscall%1$c", 0
	compil db "nasm -f elf64 Sully_%2$d.s && gcc -Wall -Wextra -Werror %1$s.o -o %1$s && ./Sully_%2$d", 0
	number dd 5

section .bss
	name resb 9
	gcc resb 100
	mexec resb 9
	ncompil resb 8

section .text
	global main
	extern dprintf
	extern sprintf
	extern system

	main:
		push rbp

		mov eax, [rel number]
		dec eax
		cmp eax, 0
		jl _end

		lea rdi, [rel name]
		lea rsi, [rel fname]
		mov edx, [rel number]
		dec edx
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
		mov r10, [rel number]
		dec r10
		push r10
		push r10
		xor rax, rax
		call dprintf wrt ..plt

		pop r10
		pop r10
		cmp rax, 0
		jle _error

		mov rax, 3
		syscall

		lea rdi, [rel ncompil]
		lea rsi, [rel fnm]
		mov eax, [rel number]
		mov edx, eax
		dec edx
		xor rax, rax
		call sprintf wrt ..plt

		lea rdi, [rel gcc]
		lea rsi, [rel compil]
		lea rdx, [rel ncompil]
		mov ecx, [rel number]
		dec ecx
		xor rax, rax
		call sprintf wrt ..plt

		lea rdi, [rel gcc]
		xor rax, rax
		call system wrt ..plt

	_end:
		pop rbp
		mov rax, 60
		mov rdi, 0
		syscall

	_error:
		pop rbp

		mov rax, 60
		mov rdi, 1
		syscall
