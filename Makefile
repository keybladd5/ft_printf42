# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: polmarti <polmarti@student.42barcel>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/10/12 19:30:20 by polmarti          #+#    #+#              #
#    Updated: 2023/10/12 19:30:21 by polmarti         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

SRCS =  src/ft_printf_utils.c src/ft_printf.c 

INCLUDES = includes/ft_print.h

FLAGS = -Wall -Wextra -Werror -I$(INCLUDES) -MMD

OBJS = $(SRCS:.c=.o)

DEPS = $(SRCS:.c=.d)

all: $(NAME)

CC = gcc

%.o:%.c Makefile
	$(CC) $(FLAGS) -I ./ -c $< -o $@

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

clean:
	rm -f $(OBJS) $(DEPS)

fclean: clean
	rm -f $(NAME)

re: fclean all

-include $(DEPS)

.PHONY: all clean fclean re 
