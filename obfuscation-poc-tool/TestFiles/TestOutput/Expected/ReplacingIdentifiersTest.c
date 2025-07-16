// Copyright example header
#include <stdio.h>
#include <string.h>

const char PATTERN[] = "ABC";
int positiveNumber = 10;
void  ConstructString(int  value) {
        int calculation = (value + 6) / 2;return RepeatAndJoin(calculation, PATTERN);
    }
int  main() {
        ConstructString(positiveNumber);return 0;
    }