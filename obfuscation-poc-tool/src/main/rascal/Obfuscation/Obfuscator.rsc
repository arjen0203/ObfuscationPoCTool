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

    // createASTFormatter();
    Declaration augmentedAST = ApplyASTTechniques(ast, configuration);

    str newCodeString = convertASTtoString(augmentedAST);
    //println(newCodeString);
    writeStringToFile(configuration.outputPath, newCodeString);
}

public Declaration ApplyASTTechniques(Declaration ast, Configuration config) {
    Declaration augmentedAST = ast;

    for (tech <- config.techniqueList) {
        switch (tech) {
            case replacingStaticValues(TargetingType targetingType): {
                Declaration augmentedAST = handleReplacingStaticValues(targetingType, ast);
            }
            case abstractingStaticValues(TargetingType targetingType): {
                Declaration augmentedAST = handleAbstractingStaticValues(targetingType, ast);
            }
            case abstractingTypesToGeneric(TargetingType targetingType): {
                Declaration augmentedAST = handleAbstractingTypesToGeneric(targetingType, ast);
            }
            case replacingIdentifiers(TargetingType targetingType): {
                Declaration augmentedAST = handleReplacingIdentifiers(targetingType, ast);
            }
            case abstractingIdentifiers(TargetingType targetingType): {
                Declaration augmentedAST = handleAbstractingIdentifiers(targetingType, ast);
            }
            case replacingLibraryCalls(TargetingType targetingType): {
                Declaration augmentedAST = handleReplacingLibraryCalls(targetingType, ast);
            }
            case abstractingLibraryCalls(TargetingType targetingType): {
                Declaration augmentedAST = handleAbstractingLibraryCalls(targetingType, ast);
            }
            case removingLibraryCalls(TargetingType targetingType): {
                Declaration augmentedAST = handleRemovingLibraryCalls(targetingType, ast);
            }
            case removingComments(TargetingType targetingType): {
                Declaration augmentedAST = handleRemovingComments(targetingType, ast);
            }
            case replacingLinesOfCode(TargetingType targetingType): {
                Declaration augmentedAST = handleReplacingLinesOfCode(targetingType, ast);
            }
            case removingLinesOfCode(TargetingType targetingType): {
                Declaration augmentedAST = handleRemovingLinesOfCode(targetingType, ast);
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
  // TODO: implement logic
  println("Handling abstractingStaticValues");
  return ast;
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
