module Tests::TestFormattersInterfaces::AbstractingIdentifiersTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::AbstractingIdentifiersTestFormatter;

public str formatAbstractingIdentifiersTest(Declaration ast) {
    return format(ast);
}