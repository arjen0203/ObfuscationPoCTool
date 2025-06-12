module Obfuscation::ObfuscationTools

import String;
import IO;

list[str] alphabet = ["a", "b", "c", "d", "e", "f", "g",
                      "h", "i", "j", "k", "l", "m", "n",
                      "o", "p", "q", "r", "s", "t", "u",
                      "v", "w", "x", "y", "z"];

int abstractNameCounter = 0;
int abstractIntCounter = 0;
int abstractCharCounter = 0;

public str NextAbstractName(bool capitalizeFirst) {
  str name = GenerateName(abstractNameCounter, capitalizeFirst);
  abstractNameCounter += 1;
  return name;
} 


private str GenerateName(int count, bool capitalize) {
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
  if (!isCapitalized) return alphabet[rem];
  else return toUpperCase(alphabet[rem]);
}