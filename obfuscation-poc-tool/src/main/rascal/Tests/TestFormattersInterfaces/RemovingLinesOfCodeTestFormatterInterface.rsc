module Tests::TestFormattersInterfaces::RemovingLinesOfCodeTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::RemovingLinesOfCodeTestFormatter;

public str formatRemovingLinesOfCodeTest(Declaration ast) {
    return format(ast);
}