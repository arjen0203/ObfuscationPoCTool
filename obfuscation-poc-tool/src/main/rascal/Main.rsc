module Main

import IO;
import Config::ConfigurationReader;
import Config::Configuration;
import Obfuscation::Obfuscator;

void main() {
    loc configPath = |project://obfuscation-poc-tool/TestFiles/TestConfigs/Example.yaml|;
    println("argument: <configPath>");
    Configuration = parseConfigFile(configPath);
    ObfuscateCode(Configuration);
}
