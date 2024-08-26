cmake_minimum_required(VERSION 3.29)

set(CMAKE_C_STANDARD 23)

project(init VERSION 0.1.0 LANGUAGES C)

add_compile_options(
    -Wall
    -Wextra
    -pedantic
    -Wshadow
)

add_library(init SHARED init.c)
