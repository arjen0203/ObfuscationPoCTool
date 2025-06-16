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