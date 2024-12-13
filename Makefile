NAME := a.out
DNAME := $(NAME)_debug

HEADER :=
SOURCES :=

# Header
HEADER += sample.h # example

# Sources
SOURCES += main.c  # example

SOURCES_PREFIX = src/

LIBRARY_DIR = lib
HEADER_DIR = include
BUILD_DIR = build

CC := cc
CFLAGS := -Wall -Wextra -Werror
IFLAGS := -I$(HEADER_DIR)
LFLAGS := -L$(LIBRARY_DIR) -lmlx_Linux -lXext -lX11 -lm
DFLAGS := -fdiagnostics-color=always -g3 -fsanitize=address

SOURCES := $(addprefix $(SOURCES_PREFIX),$(SOURCES))
OBJS := $(SOURCES:.c=.o)
DOBJS := $(SOURCES:.c=_d.o)

MLX_HEADER := $(addprefix $(HEADER_DIR)/,mlx.h)
MLX_LIB := $(addprefix $(LIBRARY_DIR)/,libmlx.a)

HEADER_FILES := $(addprefix $(HEADER_DIR)/,$(HEADER))

ifdef DEBUG
CFLAGS += $(DFLAGS)
NAME = $(DNAME)
OBJS = $(DOBJS)
endif

define install_minilibx
	current_dir=$(shell pwd); \
	lib_dir="$${current_dir}/lib"; \
	include_dir="$${current_dir}/include"; \
	mlx_repo_dir="$${current_dir}/temp_____/minilibx-linux"; \
	build_flag_file="$${lib_dir}/libmlx_Linux.a"; \
	build_header_file="$${include_dir}/mlx.h"; \
	\
	if [ -f "$$build_flag_file" ] && [ -f "$$build_header_file" ]; then \
		echo "libmlx_Linux.a and mlx.h already exist. ";  \
		exit 0;  \
	fi; \
	\
	mkdir -p "$$lib_dir" "$$include_dir" temp_____; \
	cd temp_____ || exit;\
	\
	if [ ! -d "minilibx-linux" ]; then \
		git clone https://github.com/42Paris/minilibx-linux.git; \
	fi; \
	\
	cd minilibx-linux || exit; \
	make; \
	\
	mv *.a "$$lib_dir/"; \
	mv mlx.h "$$include_dir/"; \
	\
	cd "$$current_dir" || exit; \
	rm -rf temp_____; \
	\
	echo "libmlx_Linux.a and mlx.h build complete.;"
endef

.PHONY: all
all: init $(NAME)

$(NAME): $(OBJS)
	$(CC) $(CFLAGS) $(OBJS) $(LFLAGS) -o $@

%.o: %.c $(HEADER_FILES)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

%_d.o: %.c $(HEADER_FILES)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@

.PHONY: init
init: $(MLX_HEADER) $(MLX_LIB)

$(MLX_HEADER) $(MLX_LIB): 
	$(install_minilibx)

.PHONY: clean
clean: 
	rm -f $(OBJS) $(DOBJS) $(DNAME) $(MLX_HEADER)
	rm -rf $(LIBRARY_DIR) $(BUILD_DIR)

.PHONY: fclean
fclean: clean
	rm -f $(NAME)

.PHONY: re
re: fclean all

.PHONY: debug
debug:
	make DEBUG=1