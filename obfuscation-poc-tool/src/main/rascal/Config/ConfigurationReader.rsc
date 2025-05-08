module Config::ConfigurationReader

import ParseTree;
import Config::ConfigSyntax;
 
public ConcreteConfigFile parseConfigFile(loc filePath) {
    return parse(#ConcreteConfigFile, filePath);
}