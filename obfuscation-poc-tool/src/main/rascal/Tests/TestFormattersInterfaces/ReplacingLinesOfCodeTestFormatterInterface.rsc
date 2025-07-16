module Tests::TestFormattersInterfaces::ReplacingLinesOfCodeTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::ReplacingLinesOfCodeTestFormatter;

public str formatReplacingLinesOfCodeTest(Declaration ast) {
    return format(ast);
}