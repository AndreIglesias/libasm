;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_strcpy.s                                        :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/09 19:00:29 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/24 18:39:14 by ciglesia         ###   ########.fr        ;
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

ALIGN 16				  ; src & dst addr 16-bytes alignment for opt rep movsb
M_FT_STRCPY:			  ; char *strcpy(char *dest, const char *src);
	push	rdi			  ; push dest to stack				rdi = dest
	push	rsi			  ; push src to stack				rsi = src
	mov		rdi, rsi	  ; rdi = rsi
	call	M_FT_STRLEN
	mov		rbx, rax
	pop		rsi					; clean stack
	pop		rdi					; clean stack

ft_memcpy:
	cld	   						; clears the direction flag: DF = 0 (inc)
	mov		rax, rdi			; return first address of dest
	mov		rcx, rbx			; rbx result of strlen -> rcx is the number of bytes to copy
	rep		movsb				; rep rcx times: copy 1 byte from address (R|E)SI src to (R|E)DI dest
	mov		BYTE [rdi], 0		; \0
	ret
