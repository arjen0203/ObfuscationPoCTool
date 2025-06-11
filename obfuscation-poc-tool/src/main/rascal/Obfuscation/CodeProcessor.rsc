module Obfuscation::CodeProcessor

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import Obfuscation::GeneratedFormatter;

public str readFileToString(loc path) {
    // println("parseFile: <parseFiles([path])>");
    // println("comments:<parseForComments(path)>");
    return readFile(path);
}

public void writeStringToFile(loc path, str content) {
    println(path);
    println(content);
    writeFile(path, content);
}

public Declaration convertCodeStringToAST(str codeString) {

    return parseString(codeString);
}

public str convertASTtoString(Declaration ast) {
    return format(ast);
}

public void createASTFormatter() {
    writeFile(|project://obfuscation-poc-tool/src/main/rascal/obfuscation/GeneratedFormatter.rsc|,
    "module Obfuscation::GeneratedFormatter
    '
    'import lang::cpp::AST;
    '
    '<filesToPrettyPrinter(find(|project://obfuscation-poc-tool/TestFiles/TestCodes/FormatterInput|, "c"), #Declaration, parseC)>
    '");
}