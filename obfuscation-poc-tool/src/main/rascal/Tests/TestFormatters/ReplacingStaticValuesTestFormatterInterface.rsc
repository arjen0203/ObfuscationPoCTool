module Tests::TestFormatters::ReplacingStaticValuesTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::ReplacingStaticValuesTestFormatter;

public str formatReplacingStaticValuesTest(Declaration ast) {
    return format(ast);
}