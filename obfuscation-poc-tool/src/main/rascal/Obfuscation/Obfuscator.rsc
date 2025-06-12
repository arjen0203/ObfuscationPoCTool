module Obfuscation::Obfuscator

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;

public void ObfuscateCode(Configuration configuration) {
    str codeString = readFileToString(configuration.codePath);
    //println("The code as string: <codeString>");
    Declaration ast = convertCodeStringToAST(codeString);
    //println(ast);

    //createASTFormatter();
    println();
    println("ast: <ast>");
    Declaration augmentedAST = ApplyASTTechniques(ast, configuration);
    println();
    println("AugmentedAST: <augmentedAST>");
    str newCodeString = convertASTtoString(augmentedAST);
    //println(newCodeString);

    writeStringToFile(configuration.outputPath, newCodeString);
}

public Declaration ApplyASTTechniques(Declaration ast, Configuration config) {
    Declaration augmentedAST = ast;

    for (tech <- config.techniqueList) {
        switch (tech) {
            case replacingStaticValues(TargetingType targetingType): {
                augmentedAST = handleReplacingStaticValues(targetingType, augmentedAST);
            }
            case abstractingStaticValues(TargetingType targetingType): {
                augmentedAST = handleAbstractingStaticValues(targetingType, augmentedAST);
            }
            case abstractingTypesToGeneric(TargetingType targetingType): {
                augmentedAST = handleAbstractingTypesToGeneric(targetingType, augmentedAST);
            }
            case replacingIdentifiers(TargetingType targetingType): {
                augmentedAST = handleReplacingIdentifiers(targetingType, augmentedAST);
            }
            case abstractingIdentifiers(TargetingType targetingType): {
                augmentedAST = handleAbstractingIdentifiers(targetingType, augmentedAST);
            }
            case replacingLibraryCalls(TargetingType targetingType): {
                augmentedAST = handleReplacingLibraryCalls(targetingType, augmentedAST);
            }
            case abstractingLibraryCalls(TargetingType targetingType): {
                augmentedAST = handleAbstractingLibraryCalls(targetingType, augmentedAST);
            }
            case removingLibraryCalls(TargetingType targetingType): {
                augmentedAST = handleRemovingLibraryCalls(targetingType, augmentedAST);
            }
            case removingComments(TargetingType targetingType): {
                augmentedAST = handleRemovingComments(targetingType, augmentedAST);
            }
            case replacingLinesOfCode(TargetingType targetingType): {
                augmentedAST = handleReplacingLinesOfCode(targetingType, augmentedAST);
            }
            case removingLinesOfCode(TargetingType targetingType): {
                augmentedAST = handleRemovingLinesOfCode(targetingType, augmentedAST);
            }
        }
    }
  return augmentedAST;
}

Declaration handleReplacingStaticValues(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling replacingStaticValues");
  return ast;
}

Declaration handleAbstractingStaticValues(TargetingType targetingType, Declaration ast) {
  println();
  println("Handling abstractingStaticValues");
  Declaration augmentedAST = ast;
  switch (targetingType) {
    case targetAll(): {
        augmentedAST = visit(ast) {
            case decl: simpleDeclaration(declSpecifier(_, integer()), [declarator(_, _, _)]) => AbstractValueInteger(decl)
            case decl: simpleDeclaration(declSpecifier(_, char()), [arrayDeclarator(_, _, _, _)]) => AbstractValueString(decl)
            case decl: simpleDeclaration(declSpecifier(_, char()), [declarator(_, _, _)]) => AbstractValueChar(decl)
            // TODO: Array's
            // TODO: additional types, such as float, bool, etc
        }

    }

    case targetIdentifiers(list[str] identifierList): {
        println("Targeting identifiers:");
        for (id <- identifierList) {
        println(" - Identifier: <id>");
        }
    }
  }

  return augmentedAST;
}

private Declaration AbstractValueChar(Declaration decl){
    println("decl: <decl>");
    return decl;
}


private Declaration AbstractValueInteger(Declaration decl){
    decl.declarators[0].initializer.initializer.\value = "<NextAbstractInt()>";
    return decl;
}

private Declaration AbstractValueString(Declaration decl){
    println("decl: <decl>");
    return decl;
}

Declaration handleAbstractingTypesToGeneric(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling abstractingTypesToGeneric");
  return ast;
}

Declaration handleReplacingIdentifiers(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling replacingIdentifiers");
  return ast;
}

Declaration handleAbstractingIdentifiers(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling abstractingIdentifiers");
  return ast;
}

Declaration handleReplacingLibraryCalls(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling replacingLibraryCalls");
  return ast;
}

Declaration handleAbstractingLibraryCalls(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling abstractingLibraryCalls");
  return ast;
}

Declaration handleRemovingLibraryCalls(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling removingLibraryCalls");
  return ast;
}

Declaration handleRemovingComments(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling removingComments");
  return ast;
}

Declaration handleReplacingLinesOfCode(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling replacingLinesOfCode");
  return ast;
}

Declaration handleRemovingLinesOfCode(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling removingLinesOfCode");
  return ast;
}
