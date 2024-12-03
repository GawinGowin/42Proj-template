#!/bin/bash

current_dir=$(pwd)
lib_dir="${current_dir}/lib"
include_dir="${current_dir}/include"
mlx_repo_dir="${current_dir}/temp_____/minilibx-linux"
build_flag_file="${lib_dir}/libmlx_Linux.a"
build_header_file="${include_dir}/mlx.h"

if [ -f "$build_flag_file" ] && [ -f "$build_header_file" ]; then
  echo "libmlx_Linux.a and mlx.h already exist. "
  exit 0
fi

mkdir -p "$lib_dir" "$include_dir" temp_____
cd temp_____ || exit

if [ ! -d "minilibx-linux" ]; then
  git clone https://github.com/42Paris/minilibx-linux.git
fi

cd minilibx-linux || exit
make

mv *.a "$lib_dir/"
mv mlx.h "$include_dir/"

cd "$current_dir" || exit
rm -rf temp_____

echo "libmlx_Linux.a and mlx.h build complete."
