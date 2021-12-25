```
git clone 
docker build -t mycmake .
docker run -it -v $(pwd):/app -w /app mycmake
mkdir -p build
cd build
cmake ..
make
```
