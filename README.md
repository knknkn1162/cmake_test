# cmake_test

# setup and build


This repo supports Circle CI. See the log.

```sh
git clone https://github.com/knknkn1162/cmake_test
docker pull knknkn1162/cmake_test:ubuntu_focal
docker run -it -v $(pwd)/cmake_test /app -w /app --rm knknkn1162/cmake_test:ubuntu_focal
```

In docker container:

```
mkdir -p build
cd build
cmake ..
make
make install
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

# subdirectory

## when contains CMakeLists.txt(tools1)
