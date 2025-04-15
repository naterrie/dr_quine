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

NAME = Colleen

FLAGS = -Wall -Werror -Wextra

SRCS =	Colleen.s

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
	./$(NAME) > tmp_Colleen ; diff tmp_Colleen Colleen.s || true

clean:
	echo "$(PURPLE)🧹Removing $(NAME).o files !"
	rm -rf $(DIR_OBJS)

fclean: clean
	echo "$(PURPLE)🧹Removing $(NAME:.a=) and tmp_Colleen !"
	rm -rf $(NAME)
	rm -rf tmp_Colleen

re: fclean $(NAME)

.PHONY: clean fclean re all

.SILENT:
