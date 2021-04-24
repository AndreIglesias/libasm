;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_write.s                                         :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/24 21:11:17 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/24 21:11:18 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_WRITE ft_write
	%define	CODE 0x0000001
%else
	%define M_FT_WRITE _ft_write
	%define	CODE 0x2000004
%endif

global M_FT_WRITE

section .text

M_FT_WRITE:						; ssize_t write(int fd, const void *buf, size_t count)
								; fd = rdi, buf = rsi, count = rdx
	test	rdi, rdi			; fd < 0
	js		.error
	test	rsi, rsi			; buf == 0
	jz		.error
	test	rdx, rdx			; count < 0
	js		.error

.syscall:
	mov		rax, CODE
	syscall						; call rax (write)
	jc	.error					; write set carry 1 on error
	jmp .end

.error:
	mov		rax, -1
	ret

.end:
	mov		rax, rdx
	ret
