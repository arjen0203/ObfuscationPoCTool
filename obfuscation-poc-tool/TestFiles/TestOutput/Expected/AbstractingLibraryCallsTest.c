// Copyright example header
#include <stdio.h>
#include <a.h>

const char TEXT[] = "ABC";
int amount = 10;
void  CalculateAmountAndRepeat(int  startValue) {
        int calculatedAmount = (startValue + 6) / 2;return RepeatAndJoin(calculatedAmount, TEXT);
    }
int  main() {
        CalculateAmountAndRepeat(amount);return 0;
    }
