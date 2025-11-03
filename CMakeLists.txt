// generate a CMakeLists.txt file for a simple C++ project
cmake_minimum_required(VERSION 3.10)
project(SimpleProject)  
set(CMAKE_CXX_STANDARD 11)
add_executable(SimpleProject main.cpp)
// generate Google Test support
enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTEST_INCLUDE_DIRS})
add_executable(runTests test_math_operations.cpp math_operations.cpp)
target_link_libraries(runTests ${GTEST_LIBRARIES} pthread)
add_test(NAME runTests COMMAND runTests)
// generate instructions to build and run the project with gtest
# To build the project, use the following commands:
# mkdir build
# cd build
# cmake ..
# make
# To run the tests, use the command:
# ./runTests
