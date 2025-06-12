module Obfuscation::Techniques::ReplacingStaticValues

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public Declaration handleReplacingStaticValues(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  switch (targetingType) {
    case targetIdentifiersWithReplacement(list[str] identifierList, ReplacementFunction replacementFunction): {
      augmentedAST = visit(ast) {
        case decl: simpleDeclaration(declSpecifier(_, integer()), [declarator(_, _, _)]) => ReplaceValueIntegerIfTarget(decl, replacementFunction, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [arrayDeclarator(_, _, _, _)]) => ReplaceValueStringIfTarget(decl, replacementFunction, identifierList)
        case decl: simpleDeclaration(declSpecifier(_, char()), [declarator(_, _, _)]) => ReplaceValueCharIfTarget(decl, replacementFunction, identifierList)
        // TODO: Array's
        // TODO: additional types, such as float, bool, etc
      }
    }
  }

  return augmentedAST;
}

private Declaration ReplaceValueCharIfTarget(Declaration decl, ReplacementFunction replacementFunction, list[str] targets){
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) {
    str currentValue = decl.declarators[0].initializer.initializer.\value;
    str replacementValue = replaceValueUsingFunction(substring(currentValue, 1, 2), replacementFunction);
    decl.declarators[0].initializer.initializer.\value = "\'<replacementValue>\'";
  }
  return decl;
}

private Declaration ReplaceValueIntegerIfTarget(Declaration decl, ReplacementFunction replacementFunction, list[str] targets){
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) {
    str currentValue = decl.declarators[0].initializer.initializer.\value;
    str replacementValue = replaceValueUsingFunction(currentValue, replacementFunction);
    decl.declarators[0].initializer.initializer.\value = "<replacementValue>";
  }
  return decl;
}

private Declaration ReplaceValueStringIfTarget(Declaration decl, ReplacementFunction replacementFunction, list[str] targets){
  if (indexOf(targets, decl.declarators[0].name.\value) != -1) {
    str currentValue = decl.declarators[0].initializer.initializer.\value;
    str replacementValue = replaceValueUsingFunction(substring(currentValue, 1, size(currentValue) - 1), replacementFunction);
    decl.declarators[0].initializer.initializer.\value = "\"<replacementValue>\"";
  }
  return decl;
}
