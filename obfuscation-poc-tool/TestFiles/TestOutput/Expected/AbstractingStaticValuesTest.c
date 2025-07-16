// Copyright example header
#include <stdio.h>
#include <string.h>

const char TEXT[] = "a";
int amount = 0;
void  CalculateAmountAndRepeat(int  startValue) {
        int calculatedAmount = (startValue + 6) / 2;return RepeatAndJoin(calculatedAmount, TEXT);
    }
int  main() {
        CalculateAmountAndRepeat(amount);return 0;
    }