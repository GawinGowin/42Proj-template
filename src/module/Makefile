# Library Makefile Template

# Parameters
LIB_NAME = <Program Name> # Fix it (ex. libft.a)
DLIB_NAME = $(LIB_NAME:.a=_debug.a)

HEADER_DIR = ./include/
HEADERS := <Header files> # Fix it

HEADERS := $(addprefix $(HEADER_DIR), $(HEADERS))

SRC_DIR = ./src/
SRCS := <Source files from SRC_DIR> # Fix it

SRCS := $(addprefix $(SRC_DIR), $(SRCS)) 

TMP_DIR = ./tmp/
OBJ_DIR = $(addprefix $(TMP_DIR),prod/)
DOBJ_DIR = $(addprefix $(TMP_DIR),dev/)
SUB_OBJ_DIR = <Sub directries in the SRC_DIR> # Fix it

OBJS = $(patsubst $(SRC_DIR)%.c,$(OBJ_DIR)%.o,$(SRCS))
DOBJS = $(patsubst $(SRC_DIR)%.c,$(DOBJ_DIR)%.o,$(SRCS))

CC = cc
CFLAGS = -Wall -Wextra -Werror
LFLAGS = # Fix it
DFLAGS = -fdiagnostics-color=always -g3 -fsanitize=address
IFLAGS = -I$(HEADER_DIR)

# Rules

ifdef DEBUG_MODE
OBJS := $(DOBJS)
CFLAGS := $(DFLAGS)
LIB_NAME := $(DLIB_NAME)
OBJ_DIR := $(DOBJ_DIR)
endif

all: $(OBJ_DIR) $(LIB_NAME)

$(OBJ_DIR):
	mkdir -p $(addprefix $(OBJ_DIR), $(SUB_OBJ_DIR))

$(OBJ_DIR)%.o: $(SRC_DIR)%.c $(HEADERS)
	$(CC) $(CFLAGS) $(IFLAGS) $(LFLAGS) -c $< -o $@

$(LIB_NAME): $(OBJS)
	ar rc $@ $(OBJS)

debug:
	make DEBUG_MODE=1

clean:
	rm -rf $(TMP_DIR) $(DLIB_NAME)

fclean: clean
	rm -f $(LIB_NAME)

re: fclean all

.PHONY: all debug clean fclean re
