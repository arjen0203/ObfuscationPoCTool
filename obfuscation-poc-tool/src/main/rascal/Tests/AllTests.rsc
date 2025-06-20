module Tests::AllTests

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;
import util::Maybe;

int ranTests = 0;
int failedTests = 0;
int succeededTest = 0;


public void runTests() {
    ranTests = 0;
    failedTests = 0;
    succeededTest = 0;

    printTestResult("testAbstractingIdentifiers", testAbstractingIdentifiers());

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

private bool testAbstractingIdentifiers() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/Automated/TestAbstractingIdentifiers.yaml|;
    Configuration = parseConfigFile(configPath);
    PreProcessObfuscation(Configuration, just("TestAbstractingIdentifiers"));
    ObfuscateCode(Configuration, just("TestAbstractingIdentifiers"));
    return false;
}