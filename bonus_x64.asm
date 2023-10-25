section .text
	global intertwine


;; void intertwine(int *v1, int n1, int *v2, int n2, int *v);
;
;  Take the 2 arrays, v1 and v2 with varying lengths, n1 and n2,
;  and intertwine them
;  The resulting array is stored in v
intertwine:
	push	rbp
	mov 	rbp, rsp

	; mov rbx, [rsp]
	; v[0] = 5
	; mov DWORD [r8], 5


	; se pare ca in r8 avem adresa lui v

	for_1:
		cmp rcx, 0
		je characters_left_in_v1
		cmp rsi, 0
		je characters_left_in_v2

		xor rax, rax
		mov rax, [rdi]

		mov [r8], rax

		add rdi, 4
		add r8, 4

		xor rax, rax
		mov rax, [rdx]

		mov [r8], rax

		add rdx, 4
		add r8, 4



		increment:
			dec rcx
			dec rsi


		jmp for_1




	end_for_1:



	jmp end_characters_left_in_v1
	characters_left_in_v1:
		; TODO
		cmp rsi, 0
		je end

		xor rax, rax
		mov rax, [rdi]
		mov [r8], rax

		add rdi, 4
		add r8, 4

		dec rsi
		jmp characters_left_in_v1

	end_characters_left_in_v1:


	jmp end_characters_left_in_v2
	characters_left_in_v2:
		; TODO
		cmp rcx, 0
		je end

		xor rax, rax
		mov rax, [rdx]

		mov [r8], rax

		add rdx, 4
		add r8, 4

		dec rcx
		jmp characters_left_in_v2

	end_characters_left_in_v2:


	end:

	leave
	ret
