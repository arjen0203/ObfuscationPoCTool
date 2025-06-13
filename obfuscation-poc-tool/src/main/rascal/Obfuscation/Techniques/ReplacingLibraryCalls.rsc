module Obfuscation::Techniques::ReplacingLibraryCalls

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public str handleReplacingLibraryCalls(TargetingType targetingType, str code) {
  str augmentedCode = code;
  switch (targetingType) {
    case targetIdentifiersWithReplacement(list[str] identifierList, ReplacementFunction replacementFunction): {
        augmentedCode = replaceLibraryLinesIfTarget(code, identifierList, replacementFunction);
    }
  }

  return augmentedCode;
}

// Not the cleanest solution, since rascal does not support pattern matching for replaceAll
// Note: Due to the way it's set up it will also remove the library mention at the start of a line inside of
// a multiline comment or string decleration. But since this case is not common this can be overlooked for the PoC.
private str replaceLibraryLinesIfTarget(str code, list[str] targets, ReplacementFunction replacementFunction) {
  str result = "";
  list[str] lines = split("\n", code);
    for (str line <- lines) {
      str trimmed = trim(line);
      if (startsWith(trimmed, "#include")) {
        int quatationStart = findFirst(line, "\"");
        int arrowStart = findFirst(line, "\<");
        if (quatationStart != -1) {
          int quatationEnd = findAll(line, "\"")[1];
          if (indexOf(targets, substring(line, quatationStart + 1, quatationEnd)) != -1) {
            line = substring(line, 0, quatationStart)
              + "\"<replaceValueUsingFunction(substring(line, quatationStart + 1, quatationEnd), replacementFunction)>\""
              + substring(line, quatationEnd + 1, size(line));
          }
        } else if (arrowStart != -1) {
          int arrowEnd = findFirst(line, "\>");
          if (indexOf(targets, substring(line, arrowStart + 1, arrowEnd)) != -1) {
            line = substring(line, 0, arrowStart) 
              + "\<<replaceValueUsingFunction(substring(line, arrowStart + 1, arrowEnd), replacementFunction)>\>"
              + substring(line, arrowEnd + 1, size(line));
          }
        }
      }
      result += line + "\n";
    }
    return result;
}