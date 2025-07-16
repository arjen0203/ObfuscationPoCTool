module Tests::TestFormattersInterfaces::BreakingRelationsTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::BreakingRelationsTestFormatter;

public str formatBreakingRelationsTest(Declaration ast) {
    return format(ast);
}