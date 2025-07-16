module Tests::TestFormattersInterfaces::ReplacingLibraryCallsTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::ReplacingLibraryCallsTestFormatter;

public str formatReplacingLibraryCallsTest(Declaration ast) {
    return format(ast);
}