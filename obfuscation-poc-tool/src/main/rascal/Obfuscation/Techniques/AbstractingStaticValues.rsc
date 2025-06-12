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
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractChar()>";
  return decl;
}

private Declaration AbstractValueIntegerIfTarget(Declaration decl, list[str] targets){
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractInt()>";
  return decl;
}

private Declaration AbstractValueStringIfTarget(Declaration decl, list[str] targets){
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) decl.declarators[0].initializer.initializer.\value = "<NextAbstractString(false)>";
  return decl;
}

private Declaration AbstractValueChar(Declaration decl){
  decl.declarators[0].initializer.initializer.\value = "<NextAbstractChar()>";
  return decl;
}

private Declaration AbstractValueInteger(Declaration decl){
  decl.declarators[0].initializer.initializer.\value = "<NextAbstractInt()>";
  return decl;
}

private Declaration AbstractValueString(Declaration decl){
  decl.declarators[0].initializer.initializer.\value = "<NextAbstractString(false)>";
  return decl;
}