;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcmp.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/13 22:01:49 by ciglesia          #+#    #+#              ;
;    Updated: 2021/06/15 17:59:52 by ciglesia         ###   ########.fr        ;
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
	xor		r11, r11
	xor		r10, r10			; counter r10 = 0

.while:
	mov		al, BYTE [rdi + r10]
	cmp		al, BYTE [rsi + r10]
	jne		.end								; if not equal
	test	al, al								; checks if s1[r10] is 0
	jz		.end
	inc		r10					; r10++ || alternative would be "inc rdi/rsi"
	jmp		.while

.end:
	mov		r11b, BYTE [rsi + r10]
	sub		rax, r11
	ret
