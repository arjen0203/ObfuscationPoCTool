module Obfuscation::Techniques::AbstractingIdentifiers

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public Declaration handleAbstractingIdentifiers(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  switch (targetingType) {
    case targetIdentifiers(list[str] identifierList): {
      augmentedAST = visit(ast) {
        case decl: simpleDeclaration(declSpecifier(_, integer()), [declarator(_, _, _)]) => AbstractNameDeclerationIfTarget(decl, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [arrayDeclarator(_, _, _, _)]) => AbstractNameDeclerationIfTarget(decl, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [declarator(_, _, _)]) => AbstractNameDeclerationIfTarget(decl, identifierList)
        // TODO: Array's
        // TODO: additional types, such as float, bool, etc
      }
      // TODO: add targetAll
    }
  }

  return augmentedAST;
}


// TODO: fix mapping of generated names to old names and vice versa
private Declaration AbstractNameDeclerationIfTarget(Declaration decl, list[str] targets){
  str currentIdentifier = decl.declarators[0].name.\value;
  if (indexOf(targets, currentIdentifier) != -1) {
    str replacementValue = NextAbstractIdentifier();
    decl.declarators[0].name.\value = replacementValue;
  }
  return decl;
}
