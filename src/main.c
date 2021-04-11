/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: ciglesia <ciglesia@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/04/09 13:56:43 by ciglesia          #+#    #+#             */
/*   Updated: 2021/04/10 12:20:53 by ciglesia         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "asm.h"

int main(int ac, char **av)
{
	char	*x;
	if (ac > 1)
	{
		printf("word: %s (len: %ld)\n", av[1], ft_strlen(av[1]));
		x = (char*)malloc(sizeof(char) * (ft_strlen(av[1]) + 1));
		ft_strcpy(x, av[1]);
		printf("word: %s (cpy: %s)\n", av[1], x);
	}
	return (0);
}
