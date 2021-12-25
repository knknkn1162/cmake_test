project(tool1 C)
# create libtool1.a
# don't use include_directories(..)
add_library(${PROJECT_NAME} STATIC src1.c)
target_include_directories(${PROJECT_NAME} PUBLIC include)

install(TARGETS ${PROJECT_NAME} DESTINATION ${CMAKE_BINARY_DIR}/lib/${PROJECT_NAME})

add_custom_command(OUTPUT ${CMAKE_BINARY_DIR}/lib/${PROJECT_NAME}
    COMMAND mkdir -p ${CMAKE_BINARY_DIR}/lib/${PROJECT_NAME}
)
