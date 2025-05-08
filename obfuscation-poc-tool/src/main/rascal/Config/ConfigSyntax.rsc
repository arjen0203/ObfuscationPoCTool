module Config::ConfigSyntax

start syntax ConcreteConfigFile =
    CodePath
    Techniques
;

syntax CodePath = "code_path" ":"  Path codePath ;

syntax Techniques = "techniques" ":" TechniqueList*;

syntax TechniqueList = "-" Technique;

syntax Technique =
    | replacingStaticValues: ReplacingStaticValues
    | abstractingStaticValues: AbstractingStaticValues
    | abstractingTypesToGeneric: AbstractingTypesToGeneric
    | replacingIdentifiers: ReplacingIdentifiers
    | abstractingIdentifiers: AbstractingIdentifiers
    | replacingLibraryCalls: ReplacingLibraryCalls
    | abstractingLibraryCalls: AbstractingLibraryCalls
    | removingLibraryCalls: RemovingLibraryCalls
    | removingComments: RemovingComments
    | replacingLinesOfCode: ReplacingLinesOfCode
    | removingLinesOfCode: RemovingLinesOfCode
;

syntax ReplacingStaticValues =
    "replacing_static_values" ":" TechniqueFields
;

syntax AbstractingStaticValues =
    "abstracting_static_values" ":" TechniqueFields
;

syntax AbstractingTypesToGeneric =
    "abstracting_types_to_generic" ":" TechniqueFields
;

syntax ReplacingIdentifiers =
    "replacing_identifiers" ":" TechniqueFields
;

syntax AbstractingIdentifiers =
    "abstracting_identifiers" ":" TechniqueFields
;

syntax ReplacingLibraryCalls =
    "replacing_library_calls" ":" TechniqueFields
;

syntax AbstractingLibraryCalls =
    "abstracting_library_calls" ":" TechniqueFields
;

syntax RemovingLibraryCalls =
    "removing_library_calls" ":" TechniqueFields
;

syntax RemovingComments =
    "removing_comments" ":" TechniqueFields
;

syntax ReplacingLinesOfCode =
    "replacing_lines_of_code" ":" TechniqueFields
;

syntax RemovingLinesOfCode =
    "removing_lines_of_code" ":" TechniqueFields
;

syntax TechniqueFields =
    | "{" TargetingType "}"
    | "{" TargetingType "," Targets "}"
    | "{" TargetingType "," Targets "," ReplacementValue "}"
;

syntax TargetingType =
    "targetingType" ":" String value
;

syntax Targets = 
    "targets" ":" TargetValue value
;

syntax TargetValue =
    | Target
    | "[" TargetList "]"
;

syntax TargetList =
    | Target
    | Target "," TargetList
;

syntax Target =
    | Int codeLine
    | "\"" Identifier identifier "\""
    | Range range
;

syntax Range = Int low "-" Int high;

syntax ReplacementValue = "replacementValue" ":" ReplacementValueInput value;

// TODO: allow escaped charachters or define differently
syntax ReplacementValueInput = "\"{" CodeString toReplace "}" "-\>" "{" CodeString replacement "}\"";

lexical String = [a-zA-Z0-9]+;
lexical CodeString = [a-zA-Z0-9\ \-\\:.,;+*^=\<\>\[\](){}\t\n\r]+;
lexical Identifier = [a-zA-Z0-9_\-]+;
lexical Path = [a-zA-Z0-9/._\\:\-]+;
lexical Int = [0-9]+;


layout Whitespace = [\ \t\n\r]*;