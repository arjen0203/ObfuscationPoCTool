module Main

import IO;
import Config::ConfigurationReader;
import Obfuscation::Obfuscator;

void main() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/TestFileDesktop.yaml|;
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration);
}
