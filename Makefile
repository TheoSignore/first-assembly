SRCS	= ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s

SRCBNS = ft_strlen.s \
			ft_strcpy.s \
			ft_strcmp.s \
			ft_write.s \
			ft_read.s \
			ft_strdup.s \
			ft_atoi_base.s \
			ft_create_elem.s \
			ft_list_push_front.s \
			ft_list_size.s \
			ft_list_sort.s \
			ft_list_remove_if.s

OBJS	= ${SRCS:.s=.o}

BNS		= ${SRCBNS:.s=.o}

NAME	= libasm.a

.s.o:
		nasm -f elf64 $< -o ${<:.s=.o}

all:		${NAME}

clean:
		rm -f ${OBJS} ${BNS}

fclean:		clean
		rm -f ${NAME} a.out

${NAME}:	${OBJS}
		ar rc ${NAME} ${OBJS}

bonus:	${OBJS} ${BNS}
		ar rc ${NAME} ${OBJS} ${BNS}

mytesterbns: bonus
		clang -Wall -Wextra -Werror -o libasm_bonus main.c libasm.a
		./libasm_bonus

re:		fclean all

.PHONY:		all clean fclean re test
