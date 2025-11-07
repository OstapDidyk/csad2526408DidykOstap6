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
find_package(GTest REQUIRED)

# Перевага надається імпортованому таргету GTest::gtest_main (сучасний CMake)
if (TARGET GTest::gtest_main)
  # Використовуємо modern targets
  add_executable(runTests tests/unit_tests.cpp math_operations.cpp)
  target_link_libraries(runTests PRIVATE GTest::gtest_main pthread)
else()
  # Використовуємо старі змінні (для сумісності)
  include_directories(${GTEST_INCLUDE_DIRS})
  add_executable(runTests tests/unit_tests.cpp math_operations.cpp)
  target_link_libraries(runTests PRIVATE ${GTEST_LIBRARIES} pthread)
endif()

# Register tests for 'ctest'
add_test(NAME runTests COMMAND runTests)
