module Tests::TestFormatter

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import String;
import List;
import util::Maybe;
import Tests::TestFormatters::AbstractingIdentifiersTestFormatterInterface;
import Tests::TestFormatters::ReplacingIdentifiersTestFormatterInterface;
import Tests::TestFormatters::ReplacingStaticValuesTestFormatterInterface;
import Tests::TestFormatters::AbstractingStaticValuesTestFormatterInterface;

public str formatTest(Declaration ast, str testName) {
    switch(testName) {
        case "ReplacingStaticValuesTest":
            return formatReplacingStaticValuesTest(ast);
        case "AbstractingStaticValuesTest":
            return formatAbstractingStaticValuesTest(ast);
        case "AbstractingIdentifiersTest":
            return formatAbstractingIdentifiersTest(ast);
        case "ReplacingIdentifiersTest":
            return formatReplacingIdentifiersTest(ast);
        default:
            println("Test not supported: <testName>");
    }
    return "";
}