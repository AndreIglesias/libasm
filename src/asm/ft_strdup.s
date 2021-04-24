;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strdup.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/25 00:16:51 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/25 00:48:07 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_STRDUP ft_strdup
	%define M_FT_STRLEN ft_strlen
	%define M_FT_STRCPY ft_strcpy
	%define M_MALLOC malloc
	%define	M_EXTERN_CALL_SUFFIX wrt ..plt
%else
	%define M_FT_STRDUP _ft_strdup
	%define M_FT_STRLEN _ft_strlen
	%define M_FT_STRCPY _ft_strcpy
	%define M_MALLOC _malloc
	%define	M_EXTERN_CALL_SUFFIX
%endif

global M_FT_STRDUP

extern M_FT_STRLEN
extern M_FT_STRCPY
extern M_MALLOC

section .text

M_FT_STRDUP:					; char *strdup(const char *s);
	call	M_FT_STRLEN
	inc		rax					; len + 1
	push	rdi
	mov		rdi, rax			; first param of malloc = sizeof(char) * len = 1 * len
	call	M_MALLOC M_EXTERN_CALL_SUFFIX
	test	rax, rax			; if malloc failed returns NULL
	jz		.end
	pop		rdi
	mov		rsi, rdi			; move strdup param to second param in strcpy
	mov		rdi, rax			; allocated memory to destination param
	call	M_FT_STRCPY

.end:
	ret
