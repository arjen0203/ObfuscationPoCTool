module Obfuscation::Techniques::RemovingLinesOfCode

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public str handleRemovingLinesOfCode(TargetingType targetingType, str code) {
  str augmentedCode = code;
  switch (targetingType) {
    case targetLinesOfCode(list [LinesOfCodeTarget] linesOfCodeTargetList): {
        augmentedCode = removeLines(code, linesOfCodeTargetList);
    }
  }

  return augmentedCode;
}

private str removeLines(str code, list[LinesOfCodeTarget] linesOfCodeTargetList) {
  set[int] targetLines = linesOfCodeTargetToLinesSet(linesOfCodeTargetList);
  str result = "";
  list[str] lines = split("\n", code);
    int lineCounter = 1;
    for (str line <- lines) {
        if (lineCounter notin targetLines) {
            result += line + "\n";
        }
        lineCounter = lineCounter + 1;
    }
    return result;
}