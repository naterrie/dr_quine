############################## Colors #########################################

BLEU := \033[36m
PURPLE := \033[35m
GREEN := \033[32m
RED := \033[31m
RESET := \033[0m
ERASE := \033[2K\033[1A\r

############################## Variables #######################################

DIR_OBJS := .objs

OBJS =	$(addprefix $(DIR_OBJS)/, $(SRCS:.c=.o))

NAME = Sully

FLAGS = -Wall -Werror -Wextra -g3

SRCS =	Sully.c

############################## Rules ##########################################

all: $(NAME)

$(NAME): $(DIR_OBJS) $(OBJS)
	gcc $(FLAGS) $(OBJS) -o $(NAME)
	echo "$(GREEN)✅ $(NAME) compilated !"

$(DIR_OBJS)/%.o: %.c Makefile
	echo "$(GREEN)⏳ Making $(NAME)"
	printf "$(BLEU) ⮡ Making $(RESET)$@$(RED)"
	gcc $(FLAGS) -MMD -c $< -o $@
	sleep 0.1
	printf "$(ERASE)"

$(DIR_OBJS):
	mkdir -p $@

run: all
	./$(NAME) ; diff Sully_0.c Sully.c || true # true is used to ignore the error code of diff

clean:
	echo "$(PURPLE)🧹Removing $(NAME).o files !"
	rm -rf $(DIR_OBJS)

fclean: clean
	echo "$(PURPLE)🧹Removing $(NAME:.a=) and quine files!"
	rm -rf Sully_*.c
	rm -rf Sully_*
	rm -f $(NAME)

re: fclean $(NAME)

.PHONY: clean fclean re all

.SILENT:
