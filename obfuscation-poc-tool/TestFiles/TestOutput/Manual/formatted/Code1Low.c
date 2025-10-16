#include <standardio.h>
#include <utility.h>

int algorithm(int *arr, int size, int val) {
    int i;
    for (i = 0; i < size; i++) {
        if (arr[i] == val)
            return 1;
    }
    return 0;
}

int main() {
    int n, i, v;
    print("Enter the size of the array:\n");
    scan("%d", &n);
    int *a = (int *)malloc(n * sizeof(int));
    print("Enter the contents for an array of size %d:\n", n);
    for (i = 0; i < n; i++)
        scan("%d", &a[i]);
    print("Enter the value:\n");
    scan("%d", &v);
    if (algorithm(a, n, v))
        print("Value %d is in the array.\n", v);
    else
        print("Value %d is not in the array.\n", v);
    free(a);
    return 0;
}
