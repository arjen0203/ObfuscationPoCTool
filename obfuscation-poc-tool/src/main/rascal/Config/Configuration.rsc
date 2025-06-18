module Config::Configuration

data Configuration = configuration(loc codePath, loc outputPath, list[Technique] techniqueList);

data Technique
	= replacingStaticValues(TargetingType targetingType)
    | abstractingStaticValues(TargetingType targetingType)
    | abstractingTypesToGeneric(TargetingType targetingType)
    | breakingRelations(TargetingType targetingType)
    | replacingIdentifiers(TargetingType targetingType)
    | abstractingIdentifiers(TargetingType targetingType)
    | replacingLibraryCalls(TargetingType targetingType)
    | abstractingLibraryCalls(TargetingType targetingType)
    | removingLibraryCalls(TargetingType targetingType)
    | removingComments(TargetingType targetingType)
    | replacingLinesOfCode(TargetingType targetingType)
    | removingLinesOfCode(TargetingType targetingType);
	
data TargetingType
    = targetAll()
    | targetLinesOfCode(list [linesOfCodeTarget] linesOfCodeTargetList)
    | targetIdentifiers(list [str] identifierList)
    | targetLinesOfCodeWithReplacement(list [linesOfCodeTarget] linesOfCodeTargetList, ReplacementFunction replacementFunction)
    | targetIdentifiersWithReplacement(list [str] identifierList, ReplacementFunction replacementFunction);

data ReplacementFunction
    = replaceAll(str replaceValue)
    | replaceWith(str targetValue, str replaceValue);

data linesOfCodeTarget
    = singleLine(int codeLine)
    | range(int startLine, int endLine);