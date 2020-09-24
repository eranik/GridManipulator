# GridManipulator

**I've intentionally added everything, including binaries, to this repo.
The binaries have been built on MacOS.**


## Source
```
./src/Main.cpp
```

## Notes
- I've bistset only for printing.
- input.binary is the simple binary input, including { 0xff, 0x11, 0x12 }.
- Uses C++17 (structured bindings, constexpr SFIANE, static inline).
- If it doesn't build on Windows, just take a look at CMakeLists.txt and do a slight modification.
- To do a full build on Linux and MacOS use: ```./build f ```
- To have a simple run on Linux and MacOS use: ```./run.sh ```
