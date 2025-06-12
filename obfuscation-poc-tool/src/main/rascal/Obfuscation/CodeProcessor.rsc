module Obfuscation::CodeProcessor

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import Obfuscation::GeneratedFormatter;
import String;
import List;

public str readFileToString(loc path) {
    // println("parseFile: <parseFiles([path])>");
    // println("comments:<parseForComments(path)>");
    return readFile(path);
}

public void writeStringToFile(loc path, str content) {
    //println(path);
    //println(content);
    writeFile(path, content);
}

public Declaration convertCodeStringToAST(str codeString) {

    return parseString(codeString);
}

public str convertASTtoString(Declaration ast) {
    return format(ast);
}

public void createASTFormatter(loc inputFile) {
    println(find(|project://obfuscation-poc-tool/TestFiles/TestCodes/FormatterInput|, "c"));
    str prettyPrinter = filesToPrettyPrinter(find(|project://obfuscation-poc-tool/TestFiles/TestCodes/FormatterInput|, "c") + {inputFile}, #Declaration, parseC);
    prettyPrinter = replaceAll(prettyPrinter, "format(if", "format(\\if");
    prettyPrinter = replaceAll(prettyPrinter, "format(void(", "format(\\void(");
    prettyPrinter = replaceAll(prettyPrinter, "format(for(", "format(\\for(");
    prettyPrinter = replaceAll(prettyPrinter, "format(return(", "format(\\return(");

    writeFile(|project://obfuscation-poc-tool/src/main/rascal/obfuscation/GeneratedFormatter.rsc|,
    "module Obfuscation::GeneratedFormatter
    '
    'import lang::cpp::AST;
    '
    '<prettyPrinter>
    '");
}