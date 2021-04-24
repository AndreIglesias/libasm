;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strlen.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/09 13:20:10 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/13 23:56:48 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_STRLEN ft_strlen
%else
	%define M_FT_STRLEN _ft_strlen
%endif

global M_FT_STRLEN

section .text

M_FT_STRLEN:
	xor	rax, rax				; rax = 0 // + efficient & secure, to avoid mem exploitation

.while:
	cmp	BYTE[rdi + rax], 0		; rdi[rax] == 0 // BYTE is for CHAR memory access 8 bits
	je	.return
	inc rax
	jmp	.while

.return:
	ret							; return rax
