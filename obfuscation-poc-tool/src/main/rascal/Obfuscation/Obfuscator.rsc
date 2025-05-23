module Obfuscation::Obfuscator

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;

public void ObfuscateCode(Configuration configuration) {
    str codeString = readFileToString(configuration.codePath);
    println("The code as string: <codeString>");
    Declaration ast = convertCodeStringToAST(codeString);
    println(ast);

    // createASTFormatter();

    str newCodeString = convertASTtoString(ast);
    println(newCodeString);
    writeStringToFile(configuration.outputPath, newCodeString);
}