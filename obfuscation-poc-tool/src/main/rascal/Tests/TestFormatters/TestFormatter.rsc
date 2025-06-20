module Tests::TestFormatters::TestFormatter

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import String;
import List;
import util::Maybe;
import Tests::TestFormatters::TestAbstractingIdentifiersFormatterInterface;

public str formatTest(Declaration ast, str testName) {
    switch(testName) {
        case "TestAbstractingIdentifiers":
            return formatTestAbstractingIdentifiers(ast);
        default:
            println("Test not supported: <testName>");
    }
    return "";
}