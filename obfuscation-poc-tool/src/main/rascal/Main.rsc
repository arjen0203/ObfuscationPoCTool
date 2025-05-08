module Main

import IO;
import Config::ConfigurationReader;
import Config::ConfigSyntax;

void main() {
    loc configPath = |project://obfuscation-poc-tool/TestConfigs/ExampleShort.yaml|;
    println("argument: <configPath>");
    ConcreteConfigFile concreteConfig = parseConfigFile(configPath);
    println("concreteConfig: <concreteConfig>");
}
