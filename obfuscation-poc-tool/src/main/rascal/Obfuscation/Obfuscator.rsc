module Obfuscation::Obfuscator

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;
import Obfuscation::Techniques::AbstractingStaticValues;
import Obfuscation::Techniques::ReplacingStaticValues;
import Obfuscation::Techniques::AbstractingLibraryCalls;
import Obfuscation::Techniques::ReplacingLibraryCalls;
import Obfuscation::Techniques::RemovingLibraryCalls;
import Obfuscation::Techniques::RemovingComments;
import Obfuscation::Techniques::ReplacingIdentifiers;
import Obfuscation::Techniques::AbstractingIdentifiers;

public void ObfuscateCode(Configuration configuration) {
    str codeString = readFileToString(configuration.codePath);
    Declaration ast = convertCodeStringToAST(codeString);

    createASTFormatter(configuration.codePath);
    println();
    println("ast: <ast>");
    PrepareObfuscation(ast, configuration);
    Declaration augmentedAST = ApplyASTTechniques(ast, configuration);
    println();
    println("AugmentedAST: <augmentedAST>");
    str newCodeString = convertASTtoString(augmentedAST);

    str augmentedNewCodeString = ApplyPostASTTechniques(newCodeString, configuration);
    writeStringToFile(configuration.outputPath, augmentedNewCodeString);
}

private void PrepareObfuscation(Declaration ast, Configuration config) {
    ResetCounters();
    ExtractExistingNames(ast, config);
}

private void ExtractExistingNames(Declaration ast, Configuration config) {
    list[str] allExistingNames = [];

    visit(ast) {
        case Name n: allExistingNames = allExistingNames + n.\value;
    }

    visit(config) {
      case replaceAll(replaceValue): allExistingNames = allExistingNames + replaceValue;
      case targetIdentifiersWithReplacement(ids, replaceWith(targetValue, replaceValue)): allExistingNames = allExistingNames + generateReplaceWithNames(ids, replaceValue, targetValue);
    }

    SetExcludedGeneratedNames(allExistingNames);
}

private list[str] generateReplaceWithNames(list[str] identifiers, str replaceWith, str toReplace) {
    list[str] names = [];
    for (id <- identifiers) {
        names = names + replaceAll(toReplace, id, replaceWith);
    }
    return names;
}

private Declaration ApplyASTTechniques(Declaration ast, Configuration config) {
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

private str ApplyPostASTTechniques(str code, Configuration config) {
    str augmentedCode = code;

    for (tech <- config.techniqueList) {
        switch (tech) {
            case replacingLibraryCalls(TargetingType targetingType): {
                augmentedCode = handleReplacingLibraryCalls(targetingType, augmentedCode);
            }
            case abstractingLibraryCalls(TargetingType targetingType): {
                augmentedCode = handleAbstractingLibraryCalls(targetingType, augmentedCode);
            }
            case removingLibraryCalls(TargetingType targetingType): {
                augmentedCode = handleRemovingLibraryCalls(targetingType, augmentedCode);
            }
            case removingComments(TargetingType targetingType): {
                augmentedCode = handleRemovingComments(targetingType, augmentedCode);
            }
        }
    }
  return augmentedCode;
}

Declaration handleAbstractingTypesToGeneric(TargetingType targetingType, Declaration ast) {
  // TODO: implement logic
  println("Handling abstractingTypesToGeneric");
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
