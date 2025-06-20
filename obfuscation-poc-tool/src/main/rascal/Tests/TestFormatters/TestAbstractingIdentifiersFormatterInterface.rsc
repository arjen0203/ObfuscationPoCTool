module Tests::TestFormatters::TestAbstractingIdentifiersFormatterInterface

import lang::cpp::AST;
import Tests::TestFormatters::TestAbstractingIdentifiersFormatter;

public str formatTestAbstractingIdentifiers(Declaration ast) {
    return format(ast);
}