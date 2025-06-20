module Obfuscation::Techniques::ReplacingLinesOfCode

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public str handleReplacingLinesOfCode(TargetingType targetingType, str code) {
  str augmentedCode = code;
  switch (targetingType) {
    case targetLinesOfCodeWithReplacement(list [LinesOfCodeTarget] linesOfCodeTargetList, ReplacementFunction replacementFunction): {
        augmentedCode = replaceLines(code, replacementFunction, linesOfCodeTargetList);
    }
  }

  return augmentedCode;
}

private str replaceLines(str code, ReplacementFunction replacementFunction, list[LinesOfCodeTarget] linesOfCodeTargetList) {
  set[int] targetLines = linesOfCodeTargetToLinesSet(linesOfCodeTargetList);
  str result = "";
  list[str] lines = split("\n", code);
    int lineCounter = 1;
    for (str line <- lines) {
        if (lineCounter in targetLines) {
            result += replaceValueUsingFunction(line, replacementFunction) + "\n";
        } else {
            result += line + "\n";
        }
        lineCounter = lineCounter + 1;
    }
    return result;
}