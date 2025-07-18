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
import Tests::TestFormatter;

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
    switch (isTest) {
        case nothing(): return format(ast);
        case just(testName): return formatTest(ast, testName);
    }
    return format(ast);
}

public void createASTFormatter(loc inputFile, Maybe[str] isTest) {
    loc formatterLocation;
    str moduleName;
    switch (isTest) {
        case nothing(): {
            formatterLocation = |project://obfuscation-poc-tool/src/main/rascal/obfuscation/GeneratedFormatter.rsc|;
            moduleName = "Obfuscation::GeneratedFormatter";
        }
        case just(testName): {
            formatterLocation = |project://obfuscation-poc-tool/src/main/rascal/Tests/TestFormatters| + "<testName>Formatter.rsc";
            moduleName = "Tests::TestFormatters::<testName>Formatter";
        }
    }
    //println(formatterLocation);
    
    str prettyPrinter = filesToPrettyPrinter(find(|project://obfuscation-poc-tool/TestFiles/TestCodes/FormatterInput|, "c") + {inputFile}, #Declaration, parseC);
    prettyPrinter = replaceAll(prettyPrinter, "format(if", "format(\\if");
    prettyPrinter = replaceAll(prettyPrinter, "format(void(", "format(\\void(");
    prettyPrinter = replaceAll(prettyPrinter, "format(for(", "format(\\for(");
    prettyPrinter = replaceAll(prettyPrinter, "format(return(", "format(\\return(");
    prettyPrinter = replaceAll(prettyPrinter, "format(break(", "format(\\break(");
    prettyPrinter = replaceAll(prettyPrinter, "format(switch(", "format(\\switch(");
    prettyPrinter = replaceAll(prettyPrinter, "format(continue(", "format(\\continue(");
    prettyPrinter = replaceAll(prettyPrinter, "format(case(", "format(\\case(");
    prettyPrinter = replaceAll(prettyPrinter, "format(while(", "format(\\while(");

    str prettyPrinterWithImport = "module <moduleName>
    '
    'import lang::cpp::AST;
    '
    '<prettyPrinter>
    '";

    writeFile(formatterLocation,
    prettyPrinterWithImport);
}