module Obfuscation::CodeProcessor

import IO;
import lang::cpp::AST;
import analysis::m3::LearnPrettyPrinter;
import util::FileSystem;
import Location;
import Obfuscation::GeneratedFormatter;
import String;
import List;
import util::Maybe;

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

public str convertASTtoString(Declaration ast, Maybe[str] isTest) {
    if (isTest == nothing()) return format(ast);
}

public void createASTFormatter(loc inputFile, Maybe[str] isTest) {
    str prettyPrinter = filesToPrettyPrinter(find(|project://obfuscation-poc-tool/TestFiles/TestCodes/FormatterInput|, "c") + {inputFile}, #Declaration, parseC);
    prettyPrinter = replaceAll(prettyPrinter, "format(if", "format(\\if");
    prettyPrinter = replaceAll(prettyPrinter, "format(void(", "format(\\void(");
    prettyPrinter = replaceAll(prettyPrinter, "format(for(", "format(\\for(");
    prettyPrinter = replaceAll(prettyPrinter, "format(return(", "format(\\return(");

    if (isTest == nothing()){
        str prettyPrinterWithImport = "module Obfuscation::GeneratedFormatter
        '
        'import lang::cpp::AST;
        '
        '<prettyPrinter>
        '";

        writeFile(|project://obfuscation-poc-tool/src/main/rascal/obfuscation/GeneratedFormatter.rsc|,
        prettyPrinterWithImport);
    }
}