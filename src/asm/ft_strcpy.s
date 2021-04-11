;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/09 19:00:29 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/10 12:20:33 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_STRCPY ft_strcpy
	%define M_FT_STRLEN ft_strlen
%else
	%define M_FT_STRCPY _ft_strcpy
	%define M_FT_STRLEN _ft_strlen
%endif

global M_FT_STRCPY

extern M_FT_STRLEN

section .text

M_FT_STRCPY:			  ; char *strcpy(char *dest, const char *src);
	push	rdi			  ; push dest to stack
	push	rsi			  ; push src to stack
	mov		rdi, rsi
	call	M_FT_STRLEN
	mov		rbx, rax
	pop		rsi					; clean stack
	pop		rdi					; clean stack
	jmp		ft_memcpy

ALIGN 16
ft_memcpy:
	push	rbp
	mov		rbp, rsp			; rsp stack pointer
	mov		rax, rdi
	mov		rcx, rbx			; rbx result of strlen
	rep		movsb

	leave
	ret
