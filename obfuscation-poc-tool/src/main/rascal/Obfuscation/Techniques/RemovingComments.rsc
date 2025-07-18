module Obfuscation::Techniques::RemovingComments

import IO;
import Config::Configuration;
import Obfuscation::CodeProcessor;
import lang::cpp::AST;
import Obfuscation::ObfuscationTools;
import List;
import String;

public str handleRemovingComments(TargetingType targetingType, str code) {
  str augmentedCode = code;
  switch (targetingType) {
    case targetAll(): {
        augmentedCode = removeComments(code);
    }
  }

  return augmentedCode;
}

// Not the cleanest solution, since rascal does not support pattern matching for replaceAll
// Note: Due to the way it's set up it will also remove the // comments at the start of a line inside of
// string decleration. But since this case is not common this can be overlooked for the PoC.
private str removeComments(str code) {
  str result = "";
  bool withinMultilineComment = false;
  list[str] lines = split("\n", code);
  for (str line <- lines) {
    if (!withinMultilineComment) {
      int startComment = findFirst(line, "//");
      if (startComment != -1) {
        line = substring(line, 0, startComment);
      } else {
        int startMultilineComment = findFirst(line, "/*");
        if (startMultilineComment != -1) {
          int endMultilineComment = findFirst(line, "*/");
          if (endMultilineComment != -1) {
            line = substring(line, 0, startMultilineComment) + substring(line, endMultilineComment + 2, size(line));
          } else {
            line = substring(line, 0, startMultilineComment);
            withinMultilineComment = true;
          }
        }
      }
    } else {
      int endMultilineComment = findFirst(line, "*/");
      if (endMultilineComment != -1) {
        line = substring(line, endMultilineComment + 2, size(line));
        withinMultilineComment = false;
      } else {
        line = "";
      }
    }
    result += line + "\n";
  }
  return result;
}