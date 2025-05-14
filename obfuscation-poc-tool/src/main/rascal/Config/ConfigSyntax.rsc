module Config::ConfigSyntax

start syntax ConcreteConfigFile =
    CodePath codePath
    Techniques techniques
;

syntax CodePath = "code_path" ":"  Path path ;

syntax Techniques = "techniques" ":" TechniqueItem* techniqueList;

syntax TechniqueItem = "-" TechniqueType technique;

syntax TechniqueType =
    | replacingStaticValues: "replacing_static_values" ":" TechniqueFields
    | abstractingStaticValues: "abstracting_static_values" ":" TechniqueFields
    | abstractingTypesToGeneric: "abstracting_types_to_generic" ":" TechniqueFields
    | replacingIdentifiers: "replacing_identifiers" ":" TechniqueFields
    | abstractingIdentifiers: "abstracting_identifiers" ":" TechniqueFields
    | replacingLibraryCalls: "replacing_library_calls" ":" TechniqueFields
    | abstractingLibraryCalls:  "abstracting_library_calls" ":" TechniqueFields
    | removingLibraryCalls: "removing_library_calls" ":" TechniqueFields
    | removingComments: "removing_comments" ":" TechniqueFields
    | replacingLinesOfCode: "replacing_lines_of_code" ":" TechniqueFields
    | removingLinesOfCode: "removing_lines_of_code" ":" TechniqueFields
;

syntax TechniqueFields =
    | "{" TargetingType targetingType "}"
    | "{" TargetingType targetingType "," Targets targets "}"
    | "{" TargetingType targetingType "," Targets targets "," ReplacementValue replacementValue "}"
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