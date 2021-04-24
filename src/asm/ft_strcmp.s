;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/13 22:01:49 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/24 18:40:59 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_STRCMP ft_strcmp
%else
	%define M_FT_STRCMP _ft_strcmp
%endif

global M_FT_STRCMP

section .text

M_FT_STRCMP:					; int strcmp(const char *s1, const char *s2);
	xor		rax, rax
	xor		rcx, rcx			; counter rcx = 0

.while:
	mov		al, BYTE [rdi + rcx]
	mov		bl, BYTE [rsi + rcx]
	test	al, al								; checks if s1[rcx] is 0
	jz		.end
	test	bl, bl								; checks if s2[rcx] is 0
	jz		.end
	cmp		al, bl				; compare *s1, *s2
	jne		.end
	inc		rcx					; rcx++ || alternative would be "inc rdi/rsi"
	jmp		.while

.end:
	sub		rax, rbx
	ret
