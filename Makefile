#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/09 14:00:44 by ciglesia          #+#    #+#              #
#    Updated: 2021/04/09 18:49:12 by ciglesia         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME		=	libasm.a
DIRSRC		=	./src/asm/
DIROBJ		=	./depo/
INCLUDE		=	./include/
SRC			=	ft_strlen.s

OAUX		=	$(SRC:%=$(DIROBJ)%)
DEPS		=	$(OAUX:.s=.d)
OBJS		=	$(OAUX:.s=.o)

ifdef FLAGS
	ifeq ($(FLAGS), no)
CFLAGS		=
	endif
	ifeq ($(FLAGS), debug)
CFLAGS		=	-Wall -Wextra -Werror -ansi -pedantic -g
	endif
else
CFLAGS		=	-Wall -Wextra -Werror
endif

OS			=	$(shell uname)
ifeq ($(OS), Linux)
	NASM	=	/usr/bin/nasm -f elf64 -D__LINUX__=1
else
	NASM	=	/usr/bin/nasm -f macho64
endif

CC			=	/usr/bin/gcc
RM			=	/bin/rm -f
ECHO		=	/bin/echo -e

%.o		:		../$(DIRSRC)/%.s
				$(NASM) $< -o $@

$(NAME)	:		$(OBJS)
				@$(ECHO) '  ██▓     ██▓ ▄▄▄▄    ▄▄▄       ██████  ███▄ ▄███▓'
				@$(ECHO) ' ▓██▒   ▒▓██▒▓█████▄ ▒████▄   ▒██    ▒ ▓██▒▀█▀ ██▒'
				@$(ECHO) ' ▒██░   ▒▒██▒▒██▒ ▄██▒██  ▀█▄ ░ ▓██▄   ▓██    ▓██░'
				@$(ECHO) ' ▒██░   ░░██░▒██░█▀  ░██▄▄▄▄██  ▒   ██▒▒██    ▒██ '
				@$(ECHO) '▒░██████░░██░░▓█  ▀█▓▒▓█   ▓██▒██████▒▒▒██▒   ░██▒'
				@$(ECHO) '░░ ▒░▓   ░▓  ░▒▓███▀▒░▒▒   ▓▒█▒ ▒▓▒ ▒ ░░ ▒░   ░  ░'
				@$(ECHO) '░░ ░ ▒  ░ ▒ ░▒░▒   ░ ░ ░   ▒▒ ░ ░▒  ░ ░░  ░      ░'
				@$(ECHO) '   ░ ░  ░ ▒ ░ ░    ░   ░   ▒  ░  ░  ░  ░      ░   '
				@$(ECHO) '░    ░    ░   ░            ░        ░         ░   '
				@ar rcs $(NAME) $(OBJS)
				@ranlib $(NAME)
				@$(ECHO) '> Compiled'

clean	:
				@($(RM) $(OBJS))
				@($(RM) $(DEPS))
				@$(ECHO) '> Directory cleaned'

all		:		$(NAME)

fclean	:		clean
				@$(RM) $(NAME)
				@$(ECHO) '> Remove executable'

re		:		fclean all

test	:
				$(CC) $(CFLAGS) -I $(INCLUDE) src/main.c $(NAME)

.PHONY	:		all clean re

-include $(DEPS)