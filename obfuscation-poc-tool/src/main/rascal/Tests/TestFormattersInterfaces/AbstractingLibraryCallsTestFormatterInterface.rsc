module Tests::TestFormattersInterfaces::AbstractingLibraryCallsTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::AbstractingLibraryCallsTestFormatter;

public str formatAbstractingLibraryCallsTest(Declaration ast) {
    return format(ast);
}