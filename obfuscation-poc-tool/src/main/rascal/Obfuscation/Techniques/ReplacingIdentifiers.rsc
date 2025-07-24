module Obfuscation::Techniques::ReplacingIdentifiers

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public Declaration handleReplacingIdentifiers(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  switch (targetingType) {
    case targetIdentifiersWithReplacement(list[str] identifierList, ReplacementFunction replacementFunction): {
      augmentedAST = visit(ast) {
        case Name identifierName => ReplaceNameIfTarget(identifierName, replacementFunction, identifierList)
      }
    }
  }

  return augmentedAST;
}

private Name ReplaceNameIfTarget(Name identifierName, ReplacementFunction replacementFunction, list[str] targets){
  if (identifierName has \value) {
    str currentIdentifier = identifierName.\value;
    currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
    if (indexOf(targets, currentIdentifier) != -1) {
      str replacementValue = replaceValueUsingFunction(currentIdentifier, replacementFunction);
      AddIdentifierMapping(currentIdentifier, replacementValue);
      identifierName.\value = replacementValue;
    }
  }
  return identifierName;
}