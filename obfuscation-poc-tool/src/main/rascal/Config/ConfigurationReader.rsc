module Config::ConfigurationReader

import IO;
import ParseTree;
import Config::ConfigSyntax;
import Config::Configuration;
 
public void parseConfigFile(loc filePath) {
    ConcreteConfigFile concreteConfig = parseConfigFileToTree(filePath);
    println("concreteConfig: <concreteConfig>");
    Configuration config = ConvertConcreteConfigFileToConfiguration(concreteConfig);
    println("config: <config>");
}

private ConcreteConfigFile parseConfigFileToTree(loc filePath) {
    return parse(#ConcreteConfigFile, filePath);
}

private Configuration ConvertConcreteConfigFileToConfiguration(ConcreteConfigFile concreteConfig) {
    loc path = |file:///| + "<concreteConfig.codePath.path>";
    list[TechniqueItem] techs = [technique | technique <- concreteConfig.techniques.techniqueList];
    return configuration(path, ConvertTechniques(techs));
}

private list[Technique] ConvertTechniques(list[TechniqueItem] techniqueList) {
    list[Technique] techniques = [];
    for (techniqueItem <- techniqueList){
        TechniqueType techniqueType = techniqueItem.technique;
        switch (techniqueType){
            case (TechniqueType) `replacing_static_values : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + replacingStaticValues(fieldType);
                }
            case (TechniqueType) `abstracting_static_values : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + abstractingStaticValues(fieldType);
                }
            case (TechniqueType) `abstracting_types_to_generic : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + abstractingTypesToGeneric(fieldType);
                }
            case (TechniqueType) `replacing_identifiers : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + replacingIdentifiers(fieldType);
                }
            case (TechniqueType) `abstracting_identifiers : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + abstractingIdentifiers(fieldType);
                }
            case (TechniqueType) `replacing_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + replacingLibraryCalls(fieldType);
                }
            case (TechniqueType) `abstracting_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + abstractingLibraryCalls(fieldType);
                }
            case (TechniqueType) `removing_library_calls : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + removingLibraryCalls(fieldType);
                }
            case (TechniqueType) `removing_comments : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + removingComments(fieldType);
                }
            case (TechniqueType) `replacing_lines_of_code : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + replacingLinesOfCode(fieldType);
                }
            case (TechniqueType) `removing_lines_of_code : <TechniqueFields fields>`:
                {
                    TargetingType fieldType = ConvertFieldsOnlyAll(fields);
                    techniques = techniques + removingLinesOfCode(fieldType);
                }
            default:
                println("did not find pattern");
        }
    };
    return techniques;
}

private TargetingType ConvertFieldsOnlyAll(TechniqueFields fields) {
    return targetAll();
}