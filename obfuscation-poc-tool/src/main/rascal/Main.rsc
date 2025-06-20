module Main

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;
import util::Maybe;


void main() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/Manual/TestFileDesktop.yaml|;
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration, nothing());
}

void preProcess() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/Manual/TestFileDesktop.yaml|;
    Configuration = parseConfigFile(configPath);
    PreProcessObfuscation(Configuration, nothing());
}
