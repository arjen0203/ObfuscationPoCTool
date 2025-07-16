module Tests::AllTests

import IO;
import Config::ConfigurationReader;
import Config::Configuration;
import Obfuscation::Obfuscator;
import util::Maybe;
import String;

int ranTests = 0;
int failedTests = 0;
int succeededTest = 0;


public void runTests() {
    ranTests = 0;
    failedTests = 0;
    succeededTest = 0;

    runTest("ReplacingStaticValuesTest");
    runTest("AbstractingStaticValuesTest");
    runTest("AbstractingIdentifiersTest");
    runTest("ReplacingIdentifiersTest");
    runTest("AbstractingTypesToGenericTest");
    runTest("BreakingRelationsTest");
    runTest("ReplacingLibraryCallsTest");
    runTest("AbstractingLibraryCallsTest");
    runTest("RemovingLibraryCallsTest");
    runTest("RemovingCommentsTest");
    runTest("ReplacingLinesOfCodeTest");
    runTest("RemovingLinesOfCodeTest");

    println("Ran tests: <ranTests>");
    println("Succeeded tests: <succeededTest>");
    println("Failed tests: <failedTests>");
}

private void printTestResult(str name, bool result){
    ranTests += 1;
    if (result) {
        println("Test: <name> with success");
        succeededTest += 1;
    } else {
        println("Test: <name> with failure");
        failedTests += 1;
    }
}

private void runTest(str testName) {;
    Configuration config = parseConfigFile(|project://obfuscation-poc-tool/TestFiles/TestConfigs/Automated/| + "<testName>.yaml");
    PreProcessObfuscation(config, just(testName));
    ObfuscateCode(config, just(testName));
    str output = readFile(config.outputPath);
    str expected = readFile(|project://obfuscation-poc-tool/TestFiles/TestOutput/Expected/| + "<testName>.c");
    printTestResult(testName, output == expected);
}