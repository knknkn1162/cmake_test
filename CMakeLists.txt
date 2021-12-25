cmake_minimum_required(VERSION 3.5)
project(test C)
include(ProcessorCount)
set(CMAKE_VERBOSE_MAKEFILE ON)

add_executable(myapp src/mod2/tool1.c)
target_link_libraries(myapp
  PRIVATE mylib
)
#target_sources(app PRIVATE src/mod2/*.c)
