```
git clone 
docker build -t mycmake .
docker run -it -v $(pwd):/app -w /app mycmake
mkdir -p build
cd build
cmake ..
make
make install
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

```
# copy tools to ./build/build.tools1 and build with cmake
add_subdirectory(tool1 build.tool1)
```
