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
        case decl: simpleDeclaration(declSpecifier(_, integer()), [declarator(_, _, _)]) => ReplaceNameDeclerationIfTarget(decl, replacementFunction, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [arrayDeclarator(_, _, _, _)]) => ReplaceNameDeclerationIfTarget(decl, replacementFunction, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [declarator(_, _, _)]) => ReplaceNameDeclerationIfTarget(decl, replacementFunction, identifierList)
        // TODO: Array's
        // TODO: additional types, such as float, bool, etc
      }
    }
  }

  return augmentedAST;
}

// TODO: fix mapping of generated names to old names and vice versa
private Declaration ReplaceNameDeclerationIfTarget(Declaration decl, ReplacementFunction replacementFunction, list[str] targets){
  str currentIdentifier = decl.declarators[0].name.\value;
  currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
  if (indexOf(targets, currentIdentifier) != -1) {
    str replacementValue = replaceValueUsingFunction(currentIdentifier, replacementFunction);
    AddIdentifierMapping(currentIdentifier, replacementValue);
    decl.declarators[0].name.\value = replacementValue;
  }
  return decl;
}
