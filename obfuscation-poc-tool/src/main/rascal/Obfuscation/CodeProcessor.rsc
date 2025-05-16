module Obfuscation::CodeProcessor

import IO;

public str readFileToString(loc path) {
    println("AAAAAAAAAAA: <path>");
    return readFile(path);
}

public void writeStringToFile(loc path, str content) {
    writeFile(path, content);
}
