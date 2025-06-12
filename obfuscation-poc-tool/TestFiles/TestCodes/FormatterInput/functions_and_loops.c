int square(int x) {
    return x * x;
}

void print_squares(int limit) {
    for (int i = 1; i <= limit; ++i) {
        printf("%d squared is %d\n", i, square(i));
    }
}

int main() {
    int n = 5;
    if (n > 0) {
        print_squares(n);
    } else {
        printf("Invalid input\n");
    }
    return 0;
}
