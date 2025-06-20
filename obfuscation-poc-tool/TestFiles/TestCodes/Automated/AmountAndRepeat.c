#include <stdio.h>
#include <string.h>

const char TEXT[] = "ABC";
int amount = 10;

// Function that repeats the constant string a calculated number of times
// and returns it as a single concatenated string.
void CalculateAmountAndRepeat(int startValue) {
    int calculatedAmount = (startValue + 6) / 2;
    return RepeatAndJoin(calculatedAmount, TEXT);
}

int main() {
    CalculateAmountAndRepeat(amount);
    return 0;
}