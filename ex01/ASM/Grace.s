bits 64
%define CODE "bits 64%1$c%define CODE %2$csalut%2$c%1$c%define FNAME %2$cGrace_kid.s%2$c%1$c%macro MAIN 2%1$c%1$csection .data%1$c	fname db %1, 0%1$c	code db %2, 0%1$c%1$csection .text%1$c	global main%1$c	extern dprintf%1$c%1$c	main:%1$c		mov rax, 2%1$c		lea rdi, [rel fname]%1$c		mov rsi, 577 ; flags of open (creat+wronly+trunc)%1$c		mov rdx, 0644 ; permissions of open%1$c		syscall%1$c		cmp rax, 0 ; check if open failed%1$c		jle _error%1$c%1$c		mov rdi, rax ; save file descriptor%1$c		lea rsi, [rel code]%1$c		mov rdx, 10%1$c		mov rcx, 34%1$c		lea rbx, [rel code]%1$c		call dprintf wrt ..plt%1$c		cmp rax, 0 ; check if dprintf failed%1$c		jle _error%1$c%1$c		mov rax, 3%1$c		syscall%1$c%1$c		mov rax, 0%1$c		ret%1$c%1$c	_error:%1$c		mov rax, 60%1$c		mov rdi, 1%1$c		syscall%1$c%endmacro%1$c%1$cMAIN FNAME, CODE%1$c"
%define FNAME "Grace_kid.s"
%macro MAIN 2

section .data
	fname db %1, 0
	code db %2, 0

section .text
	global main
	extern dprintf

	main:
		mov rax, 2
		lea rdi, [rel fname]
		mov rsi, 0x241 ; flags of open (creat+wronly+trunc)
		mov rdx, 0644o ; permissions of open
		push rdx ; push rdx to stack
		syscall
		pop rdx
		cmp rax, 0 ; check if open failed
		jle _error

		;mov rdi, rax ; save file descriptor
		;lea rsi, [rel code]
		;mov rdx, 10
		;mov rcx, 34
		;lea rbx, [rel code]
		;call dprintf wrt ..plt
		;cmp rax, 0 ; check if dprintf failed
		;jle _error

		mov rax, 3
		syscall

		mov rax, 0
		ret

	_error:
		mov rax, 60
		mov rdi, 1
		syscall
%endmacro

MAIN FNAME, CODE
