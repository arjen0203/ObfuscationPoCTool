// Copyright example header
#include <stdio.h>
#include <string.h>

const char TEXT[] = "ABC";
int amount = 10;
void  CalculateAmountAndRepeat(int  startValue) {
        int calculatedAmount = startValue + 5;return RepeatAndJoin(calculatedAmount, TEXT);
    }
int  main() {
        CalculateAmountAndRepeat(amount);return 0;
    }