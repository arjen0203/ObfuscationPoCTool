#include <stdio.h>
#include <stdlib.h>
#include <string.h>






#define TEXT "ABC"

// Simulate the ConcatenationLibrary.RepeatAndJoin functionality
char* RepeatAndJoin(int count, const char* text) {
    size_t text_len = strlen(text);
    size_t result_len = count * text_len + 1; // +1 for null terminator
    char* result = malloc(result_len);
    
    if (result == NULL) {
        fprintf(stderr, "Memory allocation failed\n");
        exit(EXIT_FAILURE);
    }

    result[0] = '\0'; // Initialize empty string
    for (int i = 0; i < count; i++) {
        strcat(result, text);
    }

    return result;
}

// Function that calculates the amount and repeats the string
char* CalculateAmountAndRepeat(int startValue) {
    int calculatedAmount = (startValue + 6) / 2;
    return RepeatAndJoin(calculatedAmount, TEXT);
}

int main() {
    int amount = 10;
    char* result = CalculateAmountAndRepeat(amount);
    printf("Result: %s\n", result);
    free(result); // Free the allocated memory
    return 0;
}
