module Tests::RunTests

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;
import util::Maybe;


void runTests() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/TestFileDesktop.yaml|;
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration, nothing());
}
