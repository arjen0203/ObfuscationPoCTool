module Tests::TestFormatters::AbstractingStaticValuesTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::AbstractingStaticValuesTestFormatter;

public str formatAbstractingStaticValuesTest(Declaration ast) {
    return format(ast);
}