cmake_minimum_required(VERSION 3.16)
project(myCpp)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# --- Dependencies ---
find_package(OpenGL REQUIRED)
find_package(glfw3 3.3 REQUIRED)

# --- GLAD ---
add_library(glad third_party/glad/src/glad.c)
target_include_directories(glad PUBLIC third_party/glad/include)

# --- Executable ---
add_executable(myCpp main.cpp)

# IMPORTANT: prevent GLFW from including gl.h
target_compile_definitions(myCpp PRIVATE GLFW_INCLUDE_NONE)

# --- Linking ---
target_link_libraries(myCpp
    PRIVATE
        glad
        OpenGL::GL
        glfw
)
