module Main

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;

void main() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/TestFileDesktop.yaml|;
    // println("argument: <configPath>");
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration);
}
