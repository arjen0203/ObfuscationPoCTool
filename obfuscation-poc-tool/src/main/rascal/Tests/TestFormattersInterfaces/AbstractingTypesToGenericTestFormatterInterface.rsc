module Tests::TestFormattersInterfaces::AbstractingTypesToGenericTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::AbstractingTypesToGenericTestFormatter;

public str formatAbstractingTypesToGenericTest(Declaration ast) {
    return format(ast);
}