//rewrite code using TEST, ASSERT_EQ, EXPECT_EQ from gtest
#include "./math_operations.h"
#include <gtest/gtest.h>
TEST(MathOperationsTest, Add) {
    EXPECT_EQ(add(2, 3), 5);
    EXPECT_EQ(add(-1, 1), 0);
    EXPECT_EQ(add(0, 0), 0);
    EXPECT_EQ(add(-2, -3), -5);
}