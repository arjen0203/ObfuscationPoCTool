module Tests::TestFormattersInterfaces::RemovingCommentsTestFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::RemovingCommentsTestFormatter;

public str formatRemovingCommentsTest(Declaration ast) {
    return format(ast);
}