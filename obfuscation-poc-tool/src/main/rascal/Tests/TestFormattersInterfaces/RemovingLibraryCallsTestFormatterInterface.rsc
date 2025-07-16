module Tests::TestFormattersInterfaces::RemovingLibraryCallsTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::RemovingLibraryCallsTestFormatter;

public str formatRemovingLibraryCallsTest(Declaration ast) {
    return format(ast);
}