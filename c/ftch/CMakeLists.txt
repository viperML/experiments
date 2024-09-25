cmake_minimum_required(VERSION 3.29.6)
project(ftch C ASM)

add_executable(
    ftch
    main.c
    lib.S
)
