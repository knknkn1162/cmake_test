cmake_minimum_required(VERSION 3.5)
project(test C)
include(ExternalProject)
find_package(Git REQUIRED)

set(CMAKE_VERBOSE_MAKEFILE ON)
add_custom_target("build")

##### tool1
add_subdirectory(tool1 build.tool1)
add_dependencies(build tool1)

##### tool2
function(build_src src_dir)
    set(target_dir ${CMAKE_CURRENT_BINARY_DIR}/build.${src_dir})
    add_custom_command(OUTPUT ${target_dir} COMMAND mkdir -p ${target_dir})
    add_custom_target(copy_src_${src_dir} DEPENDS ${src_dir} ${target_dir}
        COMMAND rsync -r ${CMAKE_SOURCE_DIR}/${src_dir}/ ${target_dir}
    )
    add_custom_target(build_src_${src_dir}
        DEPENDS copy_src_${src_dir} ${target_dir}
        COMMAND make -C ${target_dir}
    )

    add_dependencies(build build_src_${src_dir})
    install(FILES ${target_dir}/lib${src_dir}.a DESTINATION ${CMAKE_BINARY_DIR}/lib)
endfunction()
build_src(tool2)


## external repos
function(install_external target_name install_dir)
     add_custom_target(install_${target_name}
         COMMAND INSTALL_DIR=${install_dir} make install -C build.${target_name}
     )
endfunction()

##### ext1

# see https://cmake.org/cmake/help/latest/module/ExternalProject.html#external-project-definition
ExternalProject_Add(build_external_repo_external1
  PREFIX external
  # Download Step Options:
  ## DOWNLOAD_COMMAND default
  GIT_REPOSITORY "https://github.com/knknkn1162/cmake_test_external1"
  ## GIT_TAG master
  # Update/Patch Step Options:
  ## PATCH_COMMAND default
  UPDATE_COMMAND git fetch --recurse-submodules
  # Configure Step Options:
  ## CONFIGURE_COMMAND default
  CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CMAKE_BINARY_DIR}
  # Build Step Options:
  BUILD_COMMAND make
  BINARY_DIR build.external1
  #BUILD_IN_SOURCE TRUE
  # Install Step Options:
  INSTALL_DIR lib
  INSTALL_COMMAND ""
  # Test Step Options:
  ## TEST_COMMAND: default
)
add_dependencies(build build_external_repo_external1)
install_external(
    "external1"
    ""
)

##### external2


# see https://cmake.org/cmake/help/latest/module/ExternalProject.html#external-project-definition
ExternalProject_Add(build_external_repo_external2
  PREFIX external
  # Download Step Options:
  ## DOWNLOAD_COMMAND default
  GIT_REPOSITORY "https://github.com/knknkn1162/cmake_test_external2"
  # see SOURCE_SUBDIR <dir>
  SOURCE_DIR build.external2
  BUILD_IN_SOURCE TRUE
  UPDATE_COMMAND git fetch --recurse-submodules
  CONFIGURE_COMMAND ""
  BUILD_COMMAND make
  INSTALL_DIR lib
  INSTALL_COMMAND ""
)
add_dependencies(build build_external_repo_external2)
install_external(
    "external2"
    "${CMAKE_BINARY_DIR}/lib"
)
