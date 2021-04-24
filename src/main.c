/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/09 13:56:43 by ciglesia          #+#    #+#             */
/*   Updated: 2021/04/25 00:02:21 by ciglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "asm.h"

void clear_buffer(char *buffer, int size)
{
	int i;

	i = 0;
	while (i < size)
		buffer[i++] = 0;
}

int main(int ac, char **av)
{
	char	*x;
	char	*cpy;
	int		fd;
	char	buff1[891];
	int		ret = 1;

	if (ac > 1)
	{
		printf("word: %s (len: %ld)\n", av[1], ft_strlen(av[1]));
		x = (char*)malloc(sizeof(char) * (ft_strlen(av[1]) + 1));
		cpy = ft_strcpy(x, av[1]);
		x[0] = '7';
		printf("word: %s (cpy: %s | %s)\n", av[1], x, cpy);
		if (ac == 3)
		{
			printf("word: cmp %s, %s = %d\n", av[1], av[2], ft_strcmp(av[1], av[2]));
			printf("\texpected: %d\n", strcmp(av[1], av[2]));
		}
		ft_write(1, "Write: ", 7);
		printf(" (%ld - %ld)\n", ft_write(1, av[1], ft_strlen(av[1])), write(1, av[1], ft_strlen(av[1])));

		printf("%-20s: \n", "header src/main.c | libc ");
		fd = open("src/main.c", O_RDONLY);
		ret = read(fd, buff1, 890);
		buff1[ret] = 0;
		printf("[return : %d]\n|%s|\n\n", ret, buff1);
		close(fd);
		fd = open("src/main.c", O_RDONLY);
		clear_buffer(buff1, 891);
		printf("%-20s: \n", "header src/main.c | libasm ");
		ret = ft_read(fd, buff1, 890);
		buff1[ret] = 0;
		printf("[return : %d]\n|%s|\n\n", ret, buff1);
		clear_buffer(buff1, 891);
		close(fd);
	}
	return (0);
}
