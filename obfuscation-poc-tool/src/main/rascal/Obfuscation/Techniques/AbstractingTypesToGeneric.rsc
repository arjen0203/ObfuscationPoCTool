module Obfuscation::Techniques::AbstractingTypesToGeneric

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;

public Declaration handleAbstractingTypesToGeneric(TargetingType targetingType, Declaration ast) {
  Declaration augmentedAST = ast;
  switch (targetingType) {
    case targetAll(): {
      augmentedAST = visit(ast) {
        case Type t => AbstractType(t)
      }
    }
  }

  return augmentedAST;
}

// We will use void here, since c does not have something that automatically finds the type or a abstract basic type such as Object
// So for the PoC we will just accept it will no longer make it compileable
private Type AbstractType(t) {
    return \void();
}