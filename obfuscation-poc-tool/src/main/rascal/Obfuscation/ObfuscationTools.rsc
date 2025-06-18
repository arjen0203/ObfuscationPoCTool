module Obfuscation::ObfuscationTools

import String;
import IO;
import Config::Configuration;
import List;
import util::Maybe;

list[str] alphabet = ["a", "b", "c", "d", "e", "f", "g",
                      "h", "i", "j", "k", "l", "m", "n",
                      "o", "p", "q", "r", "s", "t", "u",
                      "v", "w", "x", "y", "z"];

int abstractNameCounter = 0;
int abstractIntCounter = 0;
int abstractCharCounter = 0;

map[str, str] changedIdentifierMapping = ();

// To ensure we don't on accident generate a abstract name that already exist we keep track of the original names existing inside the code
// And those defined in the config file to make sure we don't get any unwanted changes
list[str] excludedGeneratedNames = [];

// Reset the counters such that testing will be consistent
public void ResetCounters() {
  abstractNameCounter = 0;
  abstractIntCounter = 0;
  abstractCharCounter = 0;
}

public void AddIdentifierMapping(str original, str replacement){
  changedIdentifierMapping[replacement] = original;
}

public str IfHasIdentifierMappingReplace(str currentIdentifier) {
  if (currentIdentifier in changedIdentifierMapping) return changedIdentifierMapping[currentIdentifier];
  return currentIdentifier;
}

public void SetExcludedGeneratedNames(list[str] names){
  excludedGeneratedNames = names;
}

public str NextAbstractString() {
  str name = GenerateString(abstractNameCounter, false);
  abstractNameCounter += 1;
  return "\"<name>\"";
} 

public str NextAbstractIdentifier(bool capitalizeFirst) {
  str name = GenerateString(abstractNameCounter, capitalizeFirst);
  abstractNameCounter += 1;
  return name;
} 

public str NextAbstractLibrary() {
  str name = GenerateString(abstractNameCounter, false);
  abstractNameCounter += 1;
  return "<name>.h";
} 

private str GenerateString(int count, bool capitalize) {
  str name = "";
  int n = count;

  do {
    int rem = n % 26;
    name = alphabet[rem] + name;
    n = n / 26 - 1;
  } while (n >= 0);

  if (capitalize && size(name) > 0) {
    name = toUpperCase(substring(name, 0, 1)) + substring(name, 1);
  }
  if (indexOf(excludedGeneratedNames, name) != -1) {
     abstractNameCounter += 1;
     return GenerateString(abstractNameCounter, capitalize);
  }
  return name;
}

public int NextAbstractInt() {
  abstractInt = abstractIntCounter;
  abstractIntCounter = abstractIntCounter + 1;
  return abstractInt;
}

public str NextAbstractChar() {
  int rem = abstractCharCounter % 26;
  bool isCapitalized = (abstractCharCounter % 52) > 26;
  abstractCharCounter = abstractCharCounter + 1;
  if (!isCapitalized) return "\'<alphabet[rem]>\'";
  else return "\'<toUpperCase(alphabet[rem])>\'";
}

public str replaceValueUsingFunction(str toReplace, ReplacementFunction replacementFunction) {
  switch (replacementFunction) {
    case replaceAll(str replaceValue): {
      return replaceValue;
    }
    case replaceWith(str targetValue, str replaceValue): {
      return replaceAll(toReplace, targetValue, replaceValue);
    }
  }
  throw "did not find replacmentFunction match";
}

list[Technique] sortTechniques(list[Technique] techniques) {
  list[tuple[int idx, Technique t]] indexed = [<i, t> | i <- index(techniques), t <- [techniques[i]]];

  indexed = sort(indexed, bool(a, b) {
    int ra = techniqueRank(a[1]);
    int rb = techniqueRank(b[1]);
    return ra == rb ? a[0] < b[0] : ra < rb;
  });
  return [t | <_, t> <- indexed];
}

private int techniqueRank(Technique t) {
  switch (t) {
    case replacingLinesOfCode(_):           return 0;
    case removingLinesOfCode(_):            return 1;
    case abstractingStaticValues(_):        return 2;
    case replacingStaticValues(_):          return 2;
    case replacingIdentifiers(_):           return 2;
    case abstractingIdentifiers(_):         return 2;
    case removingComments(_):               return 2;
    case abstractingTypesToGeneric(_):      return 3;
    case breakingRelations(_):              return 2;
    case replacingLibraryCalls(_):          return 4;
    case abstractingLibraryCalls(_):        return 4;
    case removingLibraryCalls(_):           return 4;
  }
}

public set[int] linesOfCodeTargetToLinesSet(list[LinesOfCodeTarget] linesOfCodeTargetList) {
  set[int] linesOfCode = {};
    for (target <- linesOfCodeTargetList) {
        switch (target) {
            case singleLine(int codeLine): {
              linesOfCode = linesOfCode + {codeLine};
            }
            case range(int startLine, int endLine): {
              linesOfCode = linesOfCode + generateIntList(startLine, endLine);
            }
        }
    }
    return linesOfCode;
}

public set[int] generateIntList(int startInt, int endInt) {
  set[int] result = {};
  for (int i <- [startInt .. endInt]) {
    result += {i};
  }
  return result;
}