# --- INSTRUCTIONS FOR DEVELOPERS ---
# To build the project, use the following commands (must be run from the repository root):
# 1. Create a build directory:
#    mkdir build
#    cd build
# 2. Configure the project (find dependencies):
#    cmake ..
# 3. Compile the project and tests:
#    make
# 4. To run the tests, use the command (from the 'build' directory):
#    ./runTests
# -----------------------------------

cmake_minimum_required(VERSION 3.10)
project(OstapDidykProject LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 11)

# Add the main executable
add_executable(SimpleProject main.cpp math_operations.cpp)

# --- GOOGLE TEST CONFIGURATION ---
enable_testing()

include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.14.0.zip
)
# Prevent overriding the parent project's compiler/linker settings
set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
FetchContent_MakeAvailable(googletest)

# Use modern imported target GTest::gtest_main
add_executable(runTests tests/unit_tests.cpp math_operations.cpp)

target_link_libraries(runTests
  PRIVATE
    GTest::gtest_main
)

# pthread is only needed on POSIX
if(UNIX)
  target_link_libraries(runTests PRIVATE pthread)
endif()

add_test(NAME runTests COMMAND runTests)

# Register tests for 'ctest'
add_test(NAME runTests COMMAND runTests)
