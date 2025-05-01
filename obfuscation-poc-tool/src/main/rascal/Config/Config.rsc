module ObfuscationPoCTool::Config::ConfigSyntax

start syntax ConfigFile = "code_path" ":" StringLiteral
    "techniques" ":" "[" Technique "," "]"
;

syntax Technique =
    ReplacingStaticValues
  | AbstractingStaticValues
  | AbstractingTypesToGeneric
  | ReplacingIdentifiers
  | AbstractingIdentifiers
  | ReplacingLibraryCalls
  | AbstractingLibraryCalls
  | RemovingLibraryCalls
  | RemovingComments
  | ReplacingLinesOfCode
  | RemovingLinesOfCode
;

syntax ReplacingStaticValues =
    "-" "replacing_static_values" ":" "{" TargetingWithLinesOfCode "," "replacementValue" ":" StringLiteral "}"
;

syntax AbstractingStaticValues =
    "-" "abstracting_static_values" ":" "{" "targetingType" ":" "all" "}"
;

syntax AbstractingTypesToGeneric =
    "-" "abstracting_types_to_generic" ":" "{" "targetingType" ":" "all" "}"
;

syntax ReplacingIdentifiers =
    "-" "replacing_identifiers" ":" "{" TargetingWithIdentifiers "," "replacementValue" ":" StringLiteral "}"
;

syntax AbstractingIdentifiers =
    "-" "abstracting_identifiers" ":" "{" "targetingType" ":" "all" "}"
;

syntax ReplacingLibraryCalls =
    "-" "replacing_library_calls" ":" "{" TargetingWithIdentifiers "," "replacementValue" ":" StringLiteral "}"
;

syntax AbstractingLibraryCalls =
    "-" "abstracting_library_calls" ":" "{" TargetingWithIdentifiers "}"
;

syntax RemovingLibraryCalls =
    "-" "removing_library_calls" ":" "{" "targetingType" ":" "all" "}"
;

syntax RemovingComments =
    "-" "removing_comments" ":" "{" "targetingType" ":" "all" "}"
;

syntax ReplacingLinesOfCode =
    "-" "replacing_lines_of_code" ":" "{" TargetingWithLinesOfCode "," "replacementValue" ":" StringLiteral "}"
;

syntax RemovingLinesOfCode =
    "-" "removing_lines_of_code" ":" "{" TargetingWithLinesOfCode "}"
;

// Shared syntax for targeting

syntax TargetingWithLinesOfCode =
    "targetingType" ":" "linesOfCode" "," "targets" ":" LineTargetList
;

syntax TargetingWithIdentifiers =
    "targetingType" ":" "identifier" "," "targets" ":" IdentifierTargets
;

syntax LineTargetList =
    "[" {LineTarget, ","} "]"
;

syntax LineTarget =
    IntegerLiteral
  | StringLiteral // for ranges like "23-43"
;

syntax IdentifierTargets =
    StringLiteral
  | "[" {StringLiteral, ","} "]"
;
