bits 64
%define STR ""
%define FNAME "Grace_kid.s"
%macro MAIN 2
section .data
	fname db %1, 0
	str db %2, 0

section .text
	global main
	extern dprintf

	main:
		mov rax, 2
		lea rdi, [rel fname]
		mov rsi, 577 ; flags of open (creat+wronly+trunc)
		mov rdx, 0644 ; permissions of open
		syscall
		cmp rax, 0
		jle _error

	_error:
		mov rax, 60
		xor rdi, rdi
		syscall
%end_macro
MACRO FNAME, STR
