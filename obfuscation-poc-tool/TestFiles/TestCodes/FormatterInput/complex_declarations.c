#include <stdio.h>

enum Color { RED, GREEN, BLUE };

void say_hello() {
    printf("Hello, world!\n");
}

int main() {
    enum Color color = GREEN;
    int numbers[5] = {1, 2, 3, 4, 5};
    void (*func_ptr)() = say_hello;

    printf("Color code: %d\n", color);
    for (int i = 0; i < 5; i++) {
        printf("numbers[%d] = %d\n", i, numbers[i]);
    }
    func_ptr();
    return 0;
}
