module Obfuscation::Techniques::AbstractingIdentifiers

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

map[str, str] abstractedNames = ();

public Declaration handleAbstractingIdentifiers(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  abstractedNames = ();

  switch (targetingType) {
    case targetIdentifiers(list[str] identifierList): {
      augmentedAST = visit(ast) {
        case Name identifierName => AbstractNameIfTarget(identifierName, identifierList)
      }
    }
    case targetAll(): {
      augmentedAST = visit(ast) {
        case Name identifierName => AbstractName(identifierName)
      }
    }
  }

  return augmentedAST;
}

private Name AbstractName(Name identifierName){
  if( identifierName has \value) {
    str currentIdentifier = identifierName.\value;
    currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
    str replacementValue = "";
    if (currentIdentifier in abstractedNames) {
      replacementValue = abstractedNames[currentIdentifier];
    } else {
      replacementValue = NextAbstractIdentifier(false);
      abstractedNames[currentIdentifier] = replacementValue;
      AddIdentifierMapping(currentIdentifier, replacementValue);
    }
    identifierName.\value = replacementValue;
  }
  
  return identifierName;
}

private Name AbstractNameIfTarget(Name identifierName, list[str] targets){
  str currentIdentifier = identifierName.\value;
  currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
  if (indexOf(targets, currentIdentifier) != -1) {
    str replacementValue = "";
    if (currentIdentifier in abstractedNames) {
      replacementValue = abstractedNames[currentIdentifier];
    } else {
      replacementValue = NextAbstractIdentifier(false);
      abstractedNames[currentIdentifier] = replacementValue;
      AddIdentifierMapping(currentIdentifier, replacementValue);
    }
    identifierName.\value = replacementValue;
  }
  return identifierName;
}