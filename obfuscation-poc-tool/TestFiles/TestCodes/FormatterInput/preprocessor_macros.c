#include <stdio.h>

#define MAX(a, b) ((a) > (b) ? (a) : (b))
#define PI 3.14159

int main() {
    int a = 10, b = 20;
    printf("Max of %d and %d is %d\n", a, b, MAX(a, b));
    printf("Value of PI is %.5f\n", PI);
    return 0;
}
