module Obfuscation::Techniques::RemovingLibraryCalls

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public str handleRemovingLibraryCalls(TargetingType targetingType, str code) {
  str augmentedCode = code;
  switch (targetingType) {
    case targetAll(): {
        println();
    }
    case targetIdentifiers(list[str] identifierList): {
        println();
    }
  }

  return augmentedCode;
}