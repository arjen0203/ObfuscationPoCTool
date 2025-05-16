module Obfuscation::Obfuscator

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;

public void ObfuscateCode(Configuration configuration) {
    str codeString = readFileToString(configuration.codePath);
    println("The code as string: <codeString>");
    writeStringToFile(configuration.outputPath, codeString);
}

