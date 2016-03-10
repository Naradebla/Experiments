SYS_EXIT equ 1
SYS_READ equ 3
SYS_WRITE equ 4
STDIN equ 0
STDOUT equ 1

segment .data
	msg1 db "Enter first number",0xA,0xD
	len1 equ $-msg1
	
	msg2 db "Enter second number",0xA,0xD
	len2 equ $-msg2
	
	msg3 db "Sum is: "
	len3 equ $-msg3
segment .bss
	numA resb 2
	numB resb 2
	res resb 1
section .text
	global _start
	_start:
		mov eax,SYS_WRITE
		mov ebx,STDOUT
		mov ecx,msg1
		mov edx,len1
		int 0x80
		
		mov eax,SYS_READ
		mov ebx,STDIN
		mov ecx,numA
		mov edx,2
		int 0x80
		
		mov eax,SYS_WRITE
		mov ebx,STDOUT
		mov ecx,msg2
		mov edx,len2
		int 0x80
		
		mov eax,SYS_READ
		mov ebx,STDIN
		mov ecx,numB
		mov edx,2
		int 0x80
		
		mov eax,SYS_WRITE
		mov ebx,STDOUT
		mov ecx,msg3
		mov edx,len3
		int 0x80
		
		mov eax, [numA]
		sub eax,'0'

		mov ebx, [numB]
		sub ebx, '0'
		
		add eax,ebx
		add eax,'0'
		
		mov [res],eax
		
		mov eax,SYS_WRITE
		mov ebx,STDOUT
		mov ecx,res
		mov edx,1
		int 0x80
		
		mov eax, SYS_EXIT
		xor ebx,ebx
		int 0x80
		