module Main

import IO;
import Config::ConfigurationReader;

void main() {
    loc configPath = |project://obfuscation-poc-tool/TestConfigs/Example.yaml|;
    println("argument: <configPath>");
    parseConfigFile(configPath);
}
