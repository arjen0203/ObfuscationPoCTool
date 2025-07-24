module Obfuscation::Techniques::AbstractingStaticValues

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;

public Declaration handleAbstractingStaticValues(TargetingType targetingType, Declaration ast) {
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
      augmentedAST = visit(ast) {
        case decl: simpleDeclaration(declSpecifier(_, integer()), [declarator(_, _, _)]) => AbstractValueIntegerIfTarget(decl, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [arrayDeclarator(_, _, _, _)]) => AbstractValueStringIfTarget(decl, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [declarator(_, _, _)]) => AbstractValueCharIfTarget(decl, identifierList)
        // TODO: Array's
        // TODO: additional types, such as float, bool, etc
      }
    }
  }

  return augmentedAST;
}

private Declaration AbstractValueCharIfTarget(Declaration decl, list[str] targets){
  str currentIdentifier = decl.declarators[0].name.\value;
  currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
  if (indexOf(targets, currentIdentifier) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractChar()>";
  return decl;
}

private Declaration AbstractValueIntegerIfTarget(Declaration decl, list[str] targets){
  str currentIdentifier = decl.declarators[0].name.\value;
  currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
  if (indexOf(targets, currentIdentifier) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractInt()>";
  return decl;
}

private Declaration AbstractValueStringIfTarget(Declaration decl, list[str] targets){
  str currentIdentifier = decl.declarators[0].name.\value;
  currentIdentifier = IfHasIdentifierMappingReplace(currentIdentifier);
  if (indexOf(targets, currentIdentifier) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractString()>";
  return decl;
}

private Declaration AbstractValueChar(Declaration decl){
  if (decl.declarators[0].initializer.initializer has \value) {
    decl.declarators[0].initializer.initializer.\value = "<NextAbstractChar()>";
  }
  return decl;
}

private Declaration AbstractValueInteger(Declaration decl){
  if (decl.declarators[0].initializer.initializer has \value) {
    decl.declarators[0].initializer.initializer.\value = "<NextAbstractInt()>";
  }
  return decl;
}

private Declaration AbstractValueString(Declaration decl){
  if (decl.declarators[0].initializer.initializer has \value) {
    decl.declarators[0].initializer.initializer.\value = "<NextAbstractString()>";
  }
  return decl;
}