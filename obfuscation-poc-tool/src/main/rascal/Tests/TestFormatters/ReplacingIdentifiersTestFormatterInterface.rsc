module Tests::TestFormatters::ReplacingIdentifiersTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::ReplacingIdentifiersTestFormatter;

public str formatReplacingIdentifiersTest(Declaration ast) {
    return format(ast);
}