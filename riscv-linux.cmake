#[[
cmake -DCMAKE_C_COMPILER=/path/to/riscv/c/compiler \
-DCMAKE_CXX_COMPILER=/path/to/riscv/c++/compiler \
-DCMAKE_TOOLCHAIN_FILE=riscv-linux.cmake \
-DRESOURCE_INSTALL_DIR="/path/on/target/for/data/" ..
]]

set(triple riscv64-unknown-linux-gnu-gcc)
set(CMAKE_CXX_COMPILER clang++ CACHE FILEPATH "C++ cross-compiler for RISC-V")
set(CMAKE_CXX_COMPILER_TARGET ${triple})
set(CMAKE_C_COMPILER clang CACHE FILEPATH "C cross-compiler for RISC-V")
set(CMAKE_C_COMPILER_TARGET ${triple})
set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR rv64)
set(CMAKE_CROSSCOMPILING True)
set(CMAKE_SYSROOT "/home/martin/Downloads/riscv64-glibc-ubuntu-22.04-nightly-2023.04.29-nightly/riscv/sysroot")
# Search libraries only under *target* paths.
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
include_directories("${CMAKE_SYSROOT}mounted/usr/include")
include_directories("${CMAKE_SYSROOT}mounted/usr/include/riscv64-linux-gnu")
# link_directories("${CMAKE_SYSROOT}/usr/lib")
# link_directories("${CMAKE_SYSROOT}mounted/usr/lib/riscv64-linux-gnu")
# link_directories("${CMAKE_SYSROOT}mounted/lib")
# link_directories("${CMAKE_SYSROOT}mounted/lib/riscv64-linux-gnu")
# set to this version to prevent search for Vulkan module
set(CMAKE_VERSION 3.6.0)
set(Vulkan_LIBRARY "${CMAKE_SYSROOT}mounted/home/debian/coding/swiftshader/build/libvk_swiftshader.so")
set(Vulkan_FOUND TRUE)
set(XCB_LIBRARY "${CMAKE_SYSROOT}mounted/usr/lib/riscv64-linux-gnu/libxcb.so.1")
set(XCB_INCLUDE_DIR "${CMAKE_SYSROOT}mounted/usr/include")
SET(CMAKE_EXE_LINKER_FLAGS "-Wl,-rpath-link,${CMAKE_SYSROOT}mounted/usr/lib/riscv64-linux-gnu")