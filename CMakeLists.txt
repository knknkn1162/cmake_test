cmake_minimum_required(VERSION 3.5)
project(test C)
include(ProcessorCount)
set(CMAKE_VERBOSE_MAKEFILE ON)
# target_sources(app PRIVATE src/mod2/*.c)
# a.outを作成する際にlibgreetings.aをリンク
# target_link_libraries(mycmd greetings)

# function(copy_src src_dir)
#     set(target_dir ${CMAKE_CURRENT_BINARY_DIR}/build.${src_dir})
#     add_custom_command(OUTPUT ${target_dir} COMMAND mkdir -p ${target_dir})
#     add_custom_target(copy_src_${src_dir} DEPENDS ${src_dir} ${target_dir}
#     COMMAND rsync -r ${CMAKE_SOURCE_DIR}/${src_dir}/ ${target_dir}
#   )
# endfunction()

add_subdirectory(tool1 build.tool1)
