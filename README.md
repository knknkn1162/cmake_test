# cmake_test

+ tool1 .. contains CMakeLists.txt
+ tool2 .. contains Makefile(raw)
+ [ext1](https://github.com/knknkn1162/cmake_test_external1) .. contains CMakeLists.txt
+ [ext2](https://github.com/knknkn1162/cmake_test_external2) .. contains Makefile(raw)

# setup and build


This repo supports Circle CI. See the log.

```sh
git clone https://github.com/knknkn1162/cmake_test
cd cmake_test
docker pull knknkn1162/cmake_test:ubuntu_focal
docker run -it -v $(pwd):/app -w /app --rm knknkn1162/cmake_test:ubuntu_focal
```

In docker container:

```
mkdir -p build
cd build
cmake ..
make build install
```

# cmake tips

```sh
# in knknkn1162/cmake_test:ubuntu_focal
# cmake --version
cmake version 3.16.3
```

# variables

When `make` under `add_subdirectory(tool1 build.tool1)`

```
(top) <= ${CMAKE_SOURCE_DIR}
|
|-- build <= ${CMAKE_BINARY_DIR}
|   |-- CMakeFiles
|   |-- build.tool1 <= ${CMAKE_CURRENT_BINARY_DIR}
|   `-- lib
`-- tool1 <= ${CMAKE_CURRENT_SOURCE_DIR}
    `-- include
```

# how to build srcs

## when contains CMakeLists.txt(tools1)

## when using external repo

`cmake ..` command generates directories below. See also https://cmake.org/cmake/help/latest/module/ExternalProject.html#external-project-definition
```
./build
|
|-- build.ext1 <= <BINARY_DIR(custom)>
|
|-- external <= <PREFIX>
|   |-- src
|   |   |-- build_external_repo_external1 <= <SOURCE_DIR>
|   |   `-- build_external_repo_external1-stamp <= <STAMP_DIR>
|   `-- tmp <= <TMP_DIR>
`-- lib <= <INSTALL_DIR(custom)>
```
