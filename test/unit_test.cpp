// generate untit test for add function
#include "./math_operations.h"
#include <cassert>
void test_add() {
    assert(add(2, 3) == 5);
    assert(add(-1, 1) == 0);
    assert(add(0, 0) == 0);
    assert(add(-2, -3) == -5);
}
int main() {
    test_add();
    return 0;
}
