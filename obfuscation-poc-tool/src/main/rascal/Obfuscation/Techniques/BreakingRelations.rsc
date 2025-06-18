module Obfuscation::Techniques::BreakingRelations

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;

set[str] abstractedFunctions = {};

public Declaration handleBreakingRelations(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  abstractedFunctions = {};

  switch (targetingType) {
    case targetAll(): {
      augmentedAST = visit(augmentedAST) {
        case decl: functionDeclarator(_, _, _, _, _) => AbstractFunctionName(decl)
      }
      augmentedAST = visit(augmentedAST) {
        case call: functionCall(_, _) => AbstractFunctionCallName(call)
      }
    }
    case targetIdentifiers(list[str] identifierList): {
      augmentedAST = visit(augmentedAST) {
        case decl: functionDeclarator(_, _, _, _, _) => AbstractFunctionNameIfTarget(decl, identifierList)
      }
      augmentedAST = visit(augmentedAST) {
        case call: functionCall(_, _) => AbstractFunctionCallName(call)
      }
    }
  }

  return augmentedAST;
}

private Declarator AbstractFunctionName(Declarator decl) {
    str currentIdentifier = decl.name.\value;
    currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);

    str replacementValue = NextAbstractIdentifier(false);
    AddIdentifierMapping(currentIdentifier, replacementValue);
    abstractedFunctions = abstractedFunctions + currentIdentifier;
    decl.name.\value = replacementValue;
    return decl;
}

private Declarator AbstractFunctionNameIfTarget(Declarator decl, list[str] targets) {
    str currentIdentifier = decl.name.\value;
    currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
    if (currentIdentifier in targets) {
        str replacementValue = NextAbstractIdentifier(false);
        AddIdentifierMapping(currentIdentifier, replacementValue);
        abstractedFunctions = abstractedFunctions + currentIdentifier;
        decl.name.\value = replacementValue;
    }

    return decl;
}

private Expression AbstractFunctionCallName(Expression call) {
    str currentIdentifier = call.functionName.name.\value;
    currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
    if (currentIdentifier in abstractedFunctions) {
        str replacementValue = NextAbstractIdentifier(false);
        AddIdentifierMapping(currentIdentifier, replacementValue);
        call.functionName.name.\value = replacementValue;
    }
    return call;
}