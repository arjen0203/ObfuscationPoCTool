module Main

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;
import util::Maybe;
import Tests::AllTests;

loc testLoc = |project://obfuscation-poc-tool/TestFiles/TestConfigs/Manual/TestFileDesktop.yaml|;

void preProcess() {
    loc configPath = testLoc;
    Configuration = parseConfigFile(configPath);
    PreProcessObfuscation(Configuration, nothing());
}

void process() {
    loc configPath = testLoc;
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration, nothing());
}

void tests() {
    runTests();
}