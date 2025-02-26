cmake_minimum_required(VERSION 3.8)
project(blt_test)

if(DEFINED TERM)
    message("TERM defined")
else()
    message("TERM undefined")
endif()
