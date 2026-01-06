cmake_minimum_required(VERSION 3.16)
project(myCpp)

set(CMAKE_CXX_COMPILER clang++)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(myCpp main.cpp)
