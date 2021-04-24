;******************************************************************************;
;                                                                              ;
;                                                         :::      ::::::::    ;
;    ft_read.s                                          :+:      :+:    :+:    ;
;                                                     +:+ +:+         +:+      ;
;    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         ;
;                                                 +#+#+#+#+#+   +#+            ;
;    Created: 2021/04/24 21:11:06 by ciglesia          #+#    #+#              ;
;    Updated: 2021/04/24 21:13:23 by ciglesia         ###   ########.fr        ;
;                                                                              ;
;******************************************************************************;

%ifdef __LINUX__
	%define M_FT_READ ft_read
	%define	CODE 0x0000000
%else
	%define M_FT_READ _ft_read
	%define	CODE 0x2000003
%endif

global M_FT_READ

section .text

M_FT_READ:						; ssize_t read(int fd, void *buf, size_t count);
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
	ret
