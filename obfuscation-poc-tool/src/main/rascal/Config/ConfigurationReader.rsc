module Config::ConfigurationReader

import IO;
import ParseTree;
import List;
import String;
import Config::ConfigSyntax;
import Config::Configuration;
 
public Configuration parseConfigFile(loc filePath) {
    ConcreteConfigFile concreteConfig = parseConfigFileToTree(filePath);
    // println("concreteConfig: <concreteConfig>");
    Configuration config = ConvertConcreteConfigFileToConfiguration(concreteConfig);
    // println("config: <config>");
    return config;
}

private ConcreteConfigFile parseConfigFileToTree(loc filePath) {
    return parse(#ConcreteConfigFile, filePath);
}

private Configuration ConvertConcreteConfigFileToConfiguration(ConcreteConfigFile concreteConfig) {
    loc codePath = |file:///| + "<concreteConfig.codePath.path>";
    loc outputPath = |file:///| + "<concreteConfig.outputPath.path>";
    list[TechniqueItem] techs = [technique | technique <- concreteConfig.techniques.techniqueList];
    return configuration(codePath, outputPath, ConvertTechniques(techs));
}

private list[Technique] ConvertTechniques(list[TechniqueItem] techniqueList) {
    list[Technique] techniques = [];
    for (techniqueItem <- techniqueList){
        TechniqueType techniqueType = techniqueItem.technique;
        switch (techniqueType){
            case (TechniqueType) `replacing_static_values : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + replacingStaticValues(fieldType);
                }
            case (TechniqueType) `abstracting_static_values : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + abstractingStaticValues(fieldType);
                }
            case (TechniqueType) `abstracting_types_to_generic : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + abstractingTypesToGeneric(fieldType);
                }
            case (TechniqueType) `breaking_relations : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + breakingRelations(fieldType);
                }
            case (TechniqueType) `replacing_identifiers : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + replacingIdentifiers(fieldType);
                }
            case (TechniqueType) `abstracting_identifiers : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + abstractingIdentifiers(fieldType);
                }
            case (TechniqueType) `replacing_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + replacingLibraryCalls(fieldType);
                }
            case (TechniqueType) `abstracting_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + abstractingLibraryCalls(fieldType);
                }
            case (TechniqueType) `removing_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + removingLibraryCalls(fieldType);
                }
            case (TechniqueType) `removing_comments : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + removingComments(fieldType);
                }
            case (TechniqueType) `replacing_lines_of_code : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + replacingLinesOfCode(fieldType);
                }
            case (TechniqueType) `removing_lines_of_code : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFields(fields);
                    techniques = techniques + removingLinesOfCode(fieldType);
                }
            default:
                println("did not find pattern");
        }
    };
    return techniques;
}

private TargetingType ConvertFields(TechniqueFields fields) {
    switch (fields) {
        case (TechniqueFields) `{ <TargetingTypeDecleration targetingType> }`: 
            {
                return ConvertFieldsOnlyType(targetingType);
            }
        case (TechniqueFields) `{ <TargetingTypeDecleration targetingType> , <Targets targets>}`: 
            {
                return ConvertFieldsTypeAndTargets(targetingType, targets);
            }
        case (TechniqueFields) `{ <TargetingTypeDecleration targetingType> , <Targets targets>, <ReplacementValue replacementValue> }`:
            {
                return ConvertFieldsTypeTargetsAndReplacement(targetingType, targets, replacementValue);
            }
        default:
            throw "Did not find techniqueFields match";
    }
}

private TargetingType ConvertFieldsOnlyType(TargetingTypeDecleration targetingTypeDecleration) {
    switch ("<targetingTypeDecleration.typeValue>") {
        case "all" : {
            return targetAll();
        }
        case "identifier" : {
            throw "No target was specified";
        }
        case "linesOfCode" : {
            throw "No target was specified";
        }
        default:
            throw "<targetingTypeDecleration.typeValue> is not an existing targeting type";
    }
}


// TODO: convert targets to list
// TODO: convert replacementFunction
private TargetingType ConvertFieldsTypeAndTargets(TargetingTypeDecleration targetingTypeDecleration, Targets targets) {
    switch ("<targetingTypeDecleration.typeValue>") {
        case "all" : {
            throw "for targetingType \"call\" no additional properties are nequired";
        }
        case "identifier" : {
            return targetIdentifiers(ConvertTargetIdentifierList(targets));
        }
        case "linesOfCode" : {
            return targetLinesOfCode(ConvertTargetCodeLineList(targets));
        }
        default:
            throw "<targetingTypeDecleration.typeValue> is not an existing targeting type";
    }
}

private TargetingType ConvertFieldsTypeTargetsAndReplacement(TargetingTypeDecleration targetingTypeDecleration, Targets targets, ReplacementValue replacementValue) {
        switch ("<targetingTypeDecleration.typeValue>") {
        case "all" : {
            throw "for targetingType \"call\" no additional properties are nequired";
        }
        case "identifier" : {
            return targetIdentifiersWithReplacement(ConvertTargetIdentifierList(targets), ConvertReplacementFunction(replacementValue));
        }
        case "linesOfCode" : {
            return targetLinesOfCodeWithReplacement(ConvertTargetCodeLineList(targets), ConvertReplacementFunction(replacementValue));
        }
        default:
            throw "<targetingTypeDecleration.typeValue> is not an existing targeting type";
    }
}

private list[str] ConvertTargetIdentifierList(Targets targets) {
    switch (targets.targetValue) {
        case (TargetValue) `<Target target>`: {
            return [ ConvertIdentifierTarget(target) ];
        }
        case (TargetValue) `[ <TargetList targetList> ]`: {
            return FlattenIdentifierTargetList(targetList, []);
        }
        default:
            throw "TargetValue pattern not matched!";
    }
}

list[str] FlattenIdentifierTargetList(TargetList targetList, list[str] currentList) {
  switch (targetList) {
    case (TargetList) `<Target target>`: {
        return concat([[ConvertIdentifierTarget(target)], currentList]);
    }
    case (TargetList) `<Target head>, <TargetList tail>`: {
        return concat([[ConvertIdentifierTarget(head)], FlattenIdentifierTargetList(tail, currentList), currentList]);
    }
    default:
      throw "Unrecognized TargetList structure: <targetList>";
  };
}

private str ConvertIdentifierTarget(Target target) {
  switch (target) {
    case (Target) `" <Identifier identifier> "`:
      return "<identifier>";
    case (Target) `<Int codeLine>`:
      throw "Numeric target not allowed";
    case (Target) `<Range range>`:
      throw "Range target not allowed";
    default:
      throw "Target not matched";
  };
}

private list[LinesOfCodeTarget] ConvertTargetCodeLineList(Targets targets) {
    switch (targets.targetValue) {
        case (TargetValue) `<Target target>`: {
            return [ ConvertCodeLineTarget(target) ];
        }
        case (TargetValue) `[ <TargetList targetList> ]`: {
            return FlattenCodeLineTargetList(targetList, []);
        }
        default:
            throw "TargetValue pattern not matched!";
    }
}

list[LinesOfCodeTarget] FlattenCodeLineTargetList(TargetList targetList, list[LinesOfCodeTarget] currentList) {
  switch (targetList) {
    case (TargetList) `<Target target>`: {
        return concat([[ConvertCodeLineTarget(target)], currentList]);
    }
    case (TargetList) `<Target head>, <TargetList tail>`: {
        return concat([[ConvertCodeLineTarget(head)], FlattenCodeLineTargetList(tail, currentList), currentList]);
    }
    default:
      throw "Unrecognized TargetList structure: <targetList>";
  };
}

private LinesOfCodeTarget ConvertCodeLineTarget(Target target) {
  switch (target) {
    case (Target) `<Int codeLine>`:
      return singleLine(toInt("<codeLine>"));
    case (Target) `" <Int low> - <Int high> "`: {
      return range(toInt("<low>"), toInt("<high>"));
    }
    case (Target) `" <Identifier identifier> "`:
      return singleLine(toInt("<identifier>"));
    default:
      throw "Target not matched";
  };
}

private ReplacementFunction ConvertReplacementFunction(ReplacementValue replacementValue) {
    str toReplace = "<replacementValue.replacementValueInput.toReplace>";
    str replacement = "<replacementValue.replacementValueInput.replacement>";
    if (toReplace == "*") return replaceAll(replacement);
    return replaceWith(toReplace, replacement);
}