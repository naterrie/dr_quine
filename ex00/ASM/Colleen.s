; WHERE HE IS
bits 64

section .data
	string db "; WHERE HE IS%1$cbits 64%1$c%1$csection .data%1$c	string db %2$c%3$s%2$c, 0%1$c%1$csection .text%1$c	global main%1$c	extern printf%1$c	extern fflush%1$c%1$c	; Are you sure ?%1$c%1$c	ft_printf:%1$c		lea rdi, [rel string]%1$c		mov rsi, 10%1$c		mov rdx, 34%1$c		lea rcx, [rel string]%1$c		call printf wrt ..plt%1$c		xor rdi, rdi%1$c		call fflush wrt ..plt%1$c		ret%1$c%1$c	main:%1$c		call ft_printf%1$c		test eax, -1%1$c		jne .error%1$c		mov eax, 0%1$c		mov rax, 60%1$c		mov rdi, rdi%1$c		syscall%1$c%1$c	.error:%1$c		mov eax, 1%1$c		mov rax, 60%1$c		mov rdi, 1%1$c		syscall%1$c", 0

section .text
	global main
	extern printf
	extern fflush

	; Are you sure ?

	ft_printf:
		lea rdi, [rel string]
		mov rsi, 10
		mov rdx, 34
		lea rcx, [rel string]
		call printf wrt ..plt
		xor rdi, rdi
		call fflush wrt ..plt
		ret

	main:
		call ft_printf
		test eax, -1
		jne _error
		mov eax, 0
		mov rax, 60
		mov rdi, rdi
		syscall

	_error:
		mov eax, 1
		mov rax, 60
		mov rdi, 1
		syscall
