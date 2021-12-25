cmake_minimum_required(VERSION 3.5)
project(test C)
include(ExternalProject)
find_package(Git REQUIRED)

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

function(build_external_repo target_name tag prefix)
    ExternalProject_Add(build_external_repo_${target_name}
      PREFIX external
      # Download Step Options:
      ## DOWNLOAD_COMMAND default
      GIT_REPOSITORY "https://github.com/knknkn1162/cmake_test_${target_name}"
      GIT_TAG ${tag}
      #SOURCE_DIR build.ext1
      # Update/Patch Step Options:
      ## PATCH_COMMAND default
      UPDATE_COMMAND git fetch --recurse-submodules
      # Configure Step Options:
      ## CONFIGURE_COMMAND default
      CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}
      # Build Step Options:
      BUILD_COMMAND make
      BINARY_DIR build.ext1
      #BUILD_IN_SOURCE TRUE
      # Install Step Options:
      INSTALL_COMMAND make install
      # Test Step Options:
      ## TEST_COMMAND: default
    )
endfunction()

build_external_repo(external1
    "master"
    "ext1"
)
