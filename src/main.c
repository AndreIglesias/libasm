/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/09 13:56:43 by ciglesia          #+#    #+#             */
/*   Updated: 2021/04/24 21:01:26 by ciglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "asm.h"

int main(int ac, char **av)
{
	char	*x;
	char	*cpy;
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
	}
	return (0);
}
