module Tests::TestFormatters::RemovingLibraryCallsTestFormatter

import lang::cpp::AST;

@synopsis{Formats abstract syntax trees back to source code.}
str format(declarator(list[void] arg_1, Name arg_2, Expression arg_3)) =
"<format(arg_2)> <format(arg_3)>";

str format(divide(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> / <format(arg_2)>";

str format(typedef()) =
"typedef";

str format(functionCall(Expression arg_1, list[void] arg_2)) =
"<format(arg_1)>()";

str format(static()) =
"static";

str format(translationUnit(list[Declaration] arg_1)) =
"// Copyright example header\r
'#include \<stdio.h\>\r
'#include \<string.h\>\r
'\r
'<"<for (value v <- arg_1) {><format(v)>\r
'<}>"[..-2]>";

str format(char()) =
"char";

str format(assign(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> = <format(arg_2)>";

str format(structFinal(list[Modifier] arg_1, Name arg_2, list[void] arg_3, list[Declaration] arg_4)) =
"<"<for (value v <- arg_1) {><format(v)><}>"><format(arg_2)>typedef struct {\r
'    <"<for (value v <- arg_4) {><format(v)>\r
'    <}>"[..-6]>\r
'}";

str format(idExpression(Name arg_1)) =
"<format(arg_1)>";

str format(simpleDeclaration(DeclSpecifier arg_1, list[Declarator] arg_2)) =
"<format(arg_1)> <"<for (value v <- arg_2) {><format(v)>, <}>"[..-2]>;";

str format(functionDeclarator(list[Declaration] arg_1, list[void] arg_2, Name arg_3, list[Declaration] arg_4, list[void] arg_5)) =
"<"<for (value v <- arg_1) {><format(v)><}>"> <format(arg_3)>(<"<for (value v <- arg_4) {><format(v)>, <}>"[..-2]>)";

str format(simpleDeclaration(DeclSpecifier arg_1, list[void] arg_2)) =
"<format(arg_1)>;";

str format(equalsInitializer(Expression arg_1)) =
"= <format(arg_1)>";

str format(const()) =
"const";

str format(\for(Statement arg_1, Expression arg_2, Expression arg_3, Statement arg_4)) =
"for (<format(arg_1)> <format(arg_2)>; <format(arg_3)>) <format(arg_4)>";

str format(plus(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> + <format(arg_2)>";

str format(lessThan(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> \< <format(arg_2)>";

str format(prefixIncr(Expression arg_1)) =
"++<format(arg_1)>";

str format(greaterThan(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> \> <format(arg_2)>";

str format(lessEqual(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> \<= <format(arg_2)>";

str format(bracketed(Expression arg_1)) =
"(<format(arg_1)>)";

str format(arrayModifier(list[void] arg_1, Expression arg_2)) =
"[<format(arg_2)>]";

str format(postfixIncr(Expression arg_1)) =
"<format(arg_1)>++";

str format(pointer(list[void] arg_1)) =
"*";

str format(fieldReference(Expression arg_1, Name arg_2)) =
"<format(arg_1)>.<format(arg_2)>";

str format(declSpecifier(list[void] arg_1, Type arg_2)) =
"<format(arg_2)>";

str format(etsEnum(list[void] arg_1, Name arg_2)) =
"enum <format(arg_2)>";

str format(equals(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> == <format(arg_2)>";

str format(functionDeclarator(list[void] arg_1, list[void] arg_2, Name arg_3, list[Declaration] arg_4, list[void] arg_5)) =
"<format(arg_3)>(<"<for (value v <- arg_4) {><format(v)>, <}>"[..-2]>)";

str format(name(str arg_1)) =
"<arg_1>";

str format(declSpecifier(list[Modifier] arg_1, Type arg_2)) =
"<"<for (value v <- arg_1) {><format(v)> <}>"[..-1]> <format(arg_2)>";

str format(functionDeclarator(list[void] arg_1, list[void] arg_2, Name arg_3, list[void] arg_4, list[void] arg_5)) =
"(<format(arg_3)>o";

str format(declarator(list[Declaration] arg_1, Name arg_2)) =
"<"<for (value v <- arg_1) {><format(v)><}>"> <format(arg_2)>";

str format(multiply(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> * <format(arg_2)>";

str format(\if(Expression arg_1, Statement arg_2)) =
"if (<format(arg_1)>) <format(arg_2)>";

str format(namedTypeSpecifier(list[void] arg_1, Name arg_2)) =
"<format(arg_2)>";

str format(initializerList(list[Expression] arg_1)) =
"{<"<for (value v <- arg_1) {><format(v)>, <}>"[..-2]>}";

str format(minus(Expression arg_1)) =
"-<format(arg_1)>";

str format(\return(Expression arg_1)) =
"return <format(arg_1)>;";

str format(enumerator(Name arg_1)) =
"<format(arg_1)>";

str format(modAuto()) =
"auto";

str format(arrayDeclarator(list[void] arg_1, Name arg_2, list[Expression] arg_3, Expression arg_4)) =
"<format(arg_2)><"<for (value v <- arg_3) {><format(v)><}>"> <format(arg_4)>";

str format(functionCall(Expression arg_1, list[Expression] arg_2)) =
"<format(arg_1)>(<"<for (value v <- arg_2) {><format(v)>, <}>"[..-2]>)";

str format(amper(Expression arg_1)) =
"&<format(arg_1)>";

str format(plusAssign(Expression arg_1, Expression arg_2)) =
"<format(arg_1)> += <format(arg_2)>";

str format(\void()) =
"void";

str format(declarator(list[void] arg_1, Name arg_2)) =
"<format(arg_2)>";

str format(integerConstant(str arg_1)) =
"<arg_1>";

str format(arraySubscriptExpression(Expression arg_1, Expression arg_2)) =
"<format(arg_1)>[<format(arg_2)>]";

str format(enum(list[void] arg_1, Name arg_2, list[Declaration] arg_3)) =
"enum <format(arg_2)> { <"<for (value v <- arg_3) {><format(v)>, <}>"[..-2]> }";

str format(floatConstant(str arg_1)) =
"<arg_1>";

str format(expressionStatement(Expression arg_1)) =
"<format(arg_1)>;";

str format(declarationStatement(Declaration arg_1)) =
"<format(arg_1)>";

str format(declarator(list[Declaration] arg_1, Name arg_2, Expression arg_3)) =
"<"<for (value v <- arg_1) {><format(v)><}>"> <format(arg_2)> <format(arg_3)>";

str format(stringLiteral(str arg_1)) =
"<arg_1>";

str format(compoundStatement(list[Statement] arg_1)) =
"{\r
'        <"<for (value v <- arg_1) {><format(v)><}>">\r
'    }";

str format(functionDefinition(DeclSpecifier arg_1, Declarator arg_2, list[void] arg_3, Statement arg_4)) =
"<format(arg_1)> <format(arg_2)> <format(arg_4)>";

str format(float()) =
"float";

str format(arrayModifier(list[void] arg_1)) =
"[]";

str format(\if(Expression arg_1, Statement arg_2, Statement arg_3)) =
"if (<format(arg_1)>) <format(arg_2)> else <format(arg_3)>";

str format(parameter(DeclSpecifier arg_1, Declarator arg_2)) =
"<format(arg_1)> <format(arg_2)>";

str format(charConstant(str arg_1)) =
"<arg_1>";

str format(fieldReferencePointerDeref(Expression arg_1, Name arg_2)) =
"<format(arg_1)>-\><format(arg_2)>";

str format(integer()) =
"int";


