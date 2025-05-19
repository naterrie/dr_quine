############################## Colors #########################################

BLEU := \033[36m
PURPLE := \033[35m
GREEN := \033[32m
RED := \033[31m
RESET := \033[0m
ERASE := \033[2K\033[1A\r

############################## Variables #######################################

DIR_OBJS := .objs

OBJS =	$(addprefix $(DIR_OBJS)/, $(SRCS:.s=.o))

NAME = Sully

FLAGS = -Wall -Werror -Wextra

SRCS =	Sully.s

############################## Rules ##########################################

all: $(NAME)

$(NAME): $(DIR_OBJS) $(OBJS)
	gcc $(FLAGS) $(OBJS) -o $(NAME)
	echo "$(GREEN)✅ $(NAME) compilated !"

$(DIR_OBJS)/%.o: %.s | $(DIR_OBJS)
	echo "$(GREEN)⏳ Making $(NAME)"
	printf "$(BLEU) ⮡ Making $(RESET)$@$(RED)"
	nasm -f elf64 $< -o $@
	sleep 0.1
	printf "$(ERASE)"

$(DIR_OBJS):
	mkdir -p $@

run: all
	./$(NAME) ; diff Sully_0.s Sully.s || true

clean:
	echo "$(PURPLE)🧹Removing $(NAME).o files !"
	rm -rf $(DIR_OBJS)

fclean: clean
	echo "$(PURPLE)🧹Removing $(NAME:.a=) !"
	rm -rf $(NAME)
	rm -rf Sully_*

re: fclean $(NAME)

.PHONY: clean fclean re all

.SILENT:
