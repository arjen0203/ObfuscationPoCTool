module Tests::TestFormatter

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import String;
import List;
import util::Maybe;
import Tests::TestFormattersInterfaces::AbstractingIdentifiersTestFormatterInterface;
import Tests::TestFormattersInterfaces::ReplacingIdentifiersTestFormatterInterface;
import Tests::TestFormattersInterfaces::ReplacingStaticValuesTestFormatterInterface;
import Tests::TestFormattersInterfaces::AbstractingStaticValuesTestFormatterInterface;
import Tests::TestFormattersInterfaces::AbstractingTypesToGenericTestFormatterInterface;
import Tests::TestFormattersInterfaces::BreakingRelationsTestFormatterInterface;
import Tests::TestFormattersInterfaces::ReplacingLibraryCallsTestFormatterInterface;
import Tests::TestFormattersInterfaces::AbstractingLibraryCallsTestFormatterInterface;
import Tests::TestFormattersInterfaces::RemovingLibraryCallsTestFormatterInterface;
import Tests::TestFormattersInterfaces::RemovingCommentsTestFormatterInterface;
import Tests::TestFormattersInterfaces::ReplacingLinesOfCodeTestFormatterInterface;
import Tests::TestFormattersInterfaces::RemovingLinesOfCodeTestFormatterInterface;

public str formatTest(Declaration ast, str testName) {
    switch(testName) {
        case "ReplacingStaticValuesTest":
            return formatReplacingStaticValuesTest(ast);
        case "AbstractingStaticValuesTest":
            return formatAbstractingStaticValuesTest(ast);
        case "AbstractingTypesToGenericTest":
            return formatAbstractingTypesToGenericTest(ast);
        case "ReplacingIdentifiersTest":
            return formatReplacingIdentifiersTest(ast);
        case "AbstractingIdentifiersTest":
            return formatAbstractingIdentifiersTest(ast);
        case "BreakingRelationsTest":
            return formatBreakingRelationsTest(ast);
        case "ReplacingLibraryCallsTest":
            return formatReplacingLibraryCallsTest(ast);
        case "AbstractingLibraryCallsTest":
            return formatAbstractingLibraryCallsTest(ast);
        case "RemovingLibraryCallsTest":
            return formatRemovingLibraryCallsTest(ast);
        case "RemovingCommentsTest":
            return formatRemovingCommentsTest(ast);
        case "ReplacingLinesOfCodeTest":
            return formatReplacingLinesOfCodeTest(ast);
        case "RemovingLinesOfCodeTest":
            return formatRemovingLinesOfCodeTest(ast);
        default:
            println("Test not supported: <testName>");
    }
    return "";
}