library chrome_idl_parser;

import 'package:petitparser/petitparser.dart';

import 'chrome_idl_mapping.dart';
import 'chrome_idl_model.dart';

final reservedNames = [
  "enum",
  "callback",
  "optional",
  "object",
  "static",
  "dictionary",
  "interface",
  "namespace",
  "or"
];

class ChromeIDLGrammar extends GrammarDefinition {
  Parser<Token> token(Object input) {
    if (input is Parser) {
      return input.token().trim();
    } else if (input is String) {
      return token(input.toParser());
    }
    throw ArgumentError.value(input, 'Invalid token parser');
  }

  @override
  Parser start() => ref0(attributeDeclaration);

  /// Parse the namespace.
  Parser<IDLNamespaceDeclaration> namespaceDeclaration() => (
        ref0(copyrightSignature).optional(),
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'namespace'),
        ref0(identifier),
        bracket('{}', ref0(namespaceBody)),
        ref1(token, ';'),
      ).toSequenceParser().map7((copyright, doc, attr, _, name, body, __) =>
          IDLNamespaceDeclaration(name,
              callbackDeclarations:
                  body.whereType<IDLCallbackDeclaration>().toList(),
              functionDeclaration:
                  body.whereType<IDLFunctionDeclaration>().firstOrNull,
              enumDeclarations: body.whereType<IDLEnumDeclaration>().toList(),
              typeDeclarations: body.whereType<IDLTypeDeclaration>().toList(),
              eventDeclaration:
                  body.whereType<IDLEventDeclaration>().firstOrNull,
              attribute: attr,
              documentation: doc,
              copyrightSignature: copyright));

  Parser<List<Object>> namespaceBody() => ref0(namespaceBodyElement).star();

  Parser<Object> namespaceBodyElement() => [
        ref0(functionDeclaration),
        ref0(typeDeclaration),
        ref0(eventDeclaration),
        ref0(callbackDeclaration),
        ref0(enumDeclaration),
        ref0(propertiesDeclaration),
      ].toChoiceParser();

  Parser<IDLEventDeclaration> eventDeclaration() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'interface'),
        ref1(token, 'Events'),
        bracket('{}', ref0(methods)),
        ref1(token, ';'),
      ).toSequenceParser().map6((doc, attr, _, __, methods, ___) =>
          IDLEventDeclaration(methods, documentation: doc, attribute: attr));

  Parser<IDLFunctionDeclaration> functionDeclaration() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'interface'),
        ref1(token, 'Functions'),
        bracket('{}', ref0(methods)),
        ref1(token, ';'),
      ).toSequenceParser().map6((doc, attr, _, __, methods, ___) =>
          IDLFunctionDeclaration(methods, documentation: doc, attribute: attr));

  Parser<IDLFunctionDeclaration> propertiesDeclaration() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'interface'),
        ref1(token, 'Properties'),
        bracket('{}', ref0(methods)),
        ref1(token, ';'),
      ).toSequenceParser().map6((doc, attr, _, __, methods, ___) =>
          IDLFunctionDeclaration(methods, documentation: doc, attribute: attr));

  Parser<List<IDLMethod>> methods() => ref0(method).star();

  /// Parse the dictionary definitions.
  // Note: Also need to parse methods within a type declaration.
  // This happens in IDL such as app_window.idl.
  // What we should do is in the mapping method
  // check the runtime type and put separate them
  // between methods and members.
  Parser<IDLTypeDeclaration> typeDeclaration() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'dictionary'),
        ref0(identifier),
        bracket('{}', ref0(typeBody)),
        ref1(token, ';'),
      ).toSequenceParser().map6((doc, attr, _, name, body, __) =>
          IDLTypeDeclaration(name, body.whereType<IDLField>().toList(),
              methods: body.whereType<IDLMethod>().toList(),
              documentation: doc,
              attribute: attr));

  Parser<List<Object>> typeBody() => ref0(singleTypeBody).star();

  Parser<Object> singleTypeBody() => [
        ref0(field),
        ref0(method),
      ].toChoiceParser();

  Parser<IDLField> field() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        [
          ref0(fieldType),
          ref0(fieldOrType),
        ].toChoiceParser(),
        ref1(token, '?').optional(),
        ref0(identifier),
        ref1(token, ';'),
      ).toSequenceParser().map6((doc, attr, type, optional, name, _) =>
          IDLField(name, typeWithAttribute(type, attr),
              attribute: attr,
              isOptional: optional != null,
              documentation: doc));

  Parser<IDLMethod> method() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'static').optional(),
        ref0(fieldType),
        ref0(identifier),
        bracket('()', ref0(parameters).starSeparated(ref1(token, ','))),
        ref1(token, ';')
      ).toSequenceParser().map7((doc, attr, _, type, name, parameters, __) =>
          IDLMethod(name, type, parameters.elements,
              documentation: doc, attribute: attr));

  /// Parse a callback definition.
  Parser<IDLCallbackDeclaration> callbackDeclaration() => (
        ref0(docString),
        ref0(attributeDeclaration).optional(),
        ref1(token, 'callback'),
        ref0(identifier),
        ref1(token, '='),
        ref0(callbackMethod),
        ref1(token, ';'),
      ).toSequenceParser().map7((doc, attr, _, name, __, parameters, ___) =>
          IDLCallbackDeclaration(name, parameters, documentation: doc));

  Parser<List<IDLParameter>> callbackMethod() => (
        ref1(token, 'void'),
        ref1(token, '('),
        ref0(parameters).starSeparated(ref1(token, ',')),
        ref1(token, ')')
      ).toSequenceParser().map4((_, __, p2, ___) => p2.elements);

  Parser<IDLParameter> parameters() => (
        ref0(attributeDeclaration).optional(),
        ref1(token, 'optional').optional(),
        ref0(parameterType),
        ref0(identifier),
      ).toSequenceParser().map4((attr, optional, type, name) {
        type = typeWithAttribute(type, attr);

        return IDLParameter(name, type,
            attribute: attr,
            isOptional: optional != null,
            isCallback: isCallback(name));
      });

  Parser<IDLType> parameterType() => [
        (ref0(identifier), string('[]'))
            .toSequenceParser()
            .map2((id, _) => IDLType(id, isArray: true)),
        ref0(identifier).map((id) => IDLType(id)),
        ref0(fieldOrType)
      ].toChoiceParser();

  Parser<IDLType> fieldOrType() => (
        ref1(token, '('),
        ref0(fieldSingleOrTypeDeclaration).plusSeparated(ref1(token, 'or')),
        ref1(token, ')')
      ).toSequenceParser().map((_) => IDLType('object'));

  // TODO: return idl type with attribute. Not propagating at the moment.
  Parser fieldSingleOrTypeDeclaration() => (
        ref0(attributeDeclaration).optional(),
        ref0(fieldType)
      ).toSequenceParser();

  // TODO: refactor with callbackParameterType
  Parser<IDLType> fieldType() => (ref0(identifier), string('[]').optional())
      .toSequenceParser()
      .map2((id, array) => IDLType(id, isArray: array != null));

  /// Parse the enum declarations.
  Parser<IDLEnumDeclaration> enumDeclaration() => seq6(
          ref0(docString),
          ref0(attributeDeclaration).optional(),
          ref1(token, 'enum'),
          ref0(identifier),
          bracket('{}', ref0(enumBody).plusSeparated(ref1(token, ','))),
          ref1(token, ';'))
      .map6((doc, attr, _, id, body, __) => IDLEnumDeclaration(
          id, body.elements,
          documentation: doc, attribute: attr));

  /// Parse the enum values.
  Parser<IDLEnumValue> enumBody() =>
      (ref0(docString), ref0(attributeDeclaration).optional(), ref0(identifier))
          .toSequenceParser()
          .map3((doc, attr, id) => IDLEnumValue(id, documentation: doc));

  Parser<IDLAttributeDeclaration> attributeDeclaration() => (
        ref1(token, '['),
        ref0(attribute).plusSeparated(ref1(token, ',')),
        ref1(token, ']')
      )
          .toSequenceParser()
          .map3((_, e, __) => IDLAttributeDeclaration(e.elements));

  Parser<IDLAttribute> attribute() => ref0(attributeLexical).map((e) {
        String? attributeValue;
        List? attributeValues;
        var parsedValue = e.$2;
        if (parsedValue is List) {
          attributeValues = parsedValue;
        } else if (parsedValue is String) {
          attributeValue = parsedValue;
        }

        return IDLAttribute(resolveEnum(e.$1),
            attributeValue: attributeValue, attributeValues: attributeValues);
      });

  Parser<(String, Object?)> attributeLexical() =>
      (ref0(identifier) & (ref1(token, '=') & ref0(attributeValue)).optional())
          .map((e) {
        var attributeName = e[0] as String;

        var parsedValue = (e[1] as List?)?[1];
        return (attributeName, parsedValue);
      });

  Parser attributeValue() =>
      ref0(identifier) |
      ref0(stringLiteral) |
      ref0(stringList) |
      ref0(integer) |
      ref0(integerList);

  Parser<String> stringLiteral() =>
      seq3(char('"'), char('"').neg().starString(), char('"'))
          .map3((_, e, __) => e);

  Parser<List<String>> stringList() =>
      bracket('()', ref0(stringLiteral).plusSeparated(ref1(token, ',')))
          .map((e) => e.elements);

  Parser<int> integer() => ref1(token, digit().plus()).flatten().map(int.parse);

  Parser<List<int>> integerList() =>
      bracket('()', ref0(integer).plusSeparated(ref1(token, ',')))
          .map((e) => e.elements);

  Parser<String> identifier() =>
      ref1(token, ref0(identifierStart) & ref0(identifierPart).star())
          .map((t) => t.input);

  Parser identifierStart() => letter() | anyOf(r'_$');

  Parser identifierPart() => ref0(identifierStart) | digit() | char('.');

  /// Parse the copyright signature at the top of all idl files.
  Parser<String> copyrightSignature() {
    var end = 'LICENSE file.';
    return (
      string('// Copyright'),
      string(end).neg().star(),
      string(end),
      newline()
    ).toSequenceParser().skip(before: whitespace().star()).flatten();
  }

  /// Parser all documentation strings and spaces between.
  Parser<List<String>> docString() =>
      ref0(singleDocString).skip(before: whitespace().star()).star();

  Parser<String> singleDocString() =>
      [ref0(singleLineComment), ref0(multiLineComment)].toChoiceParser();

  Parser<String> singleLineComment() => (
        string('//'),
        ref0(newlineLexicalToken).neg().star(),
        ref0(newlineLexicalToken).optional()
      ).toSequenceParser().map3((_, e, __) => e.join());

  Parser<String> multiLineComment() => (
        [string('/**'), string('/*')].toChoiceParser(),
        string('*/').neg().star(),
        string('*/')
      ).toSequenceParser().map3((_, e, __) => e.join());

  Parser newlineLexicalToken() => pattern('\n\r');

  Parser<T> bracket<T>(String brackets, Parser<T> parser) => (
        ref1(token, brackets[0]),
        parser,
        ref1(token, brackets[1])
      ).toSequenceParser().map3((_, p1, __) => p1);
}

class ChromeIDLParser {
  final _parser = ChromeIDLGrammar();

  late final docString = _parser.buildFrom(_parser.docString()).end();

  late final attributeDeclaration =
      _parser.buildFrom(_parser.attributeDeclaration()).end();

  late final enumBody = _parser.buildFrom(_parser.enumBody()).end();

  late final enumDeclaration =
      _parser.buildFrom(_parser.enumDeclaration()).end();

  late final callbackParameterType =
      _parser.buildFrom(_parser.parameterType()).end();

  late final callbackParameters = _parser.buildFrom(_parser.parameters()).end();

  late final callbackMethod = _parser.buildFrom(_parser.callbackMethod()).end();

  late final callbackDeclaration =
      _parser.buildFrom(_parser.callbackDeclaration());

  late final fieldType = _parser.buildFrom(_parser.fieldType()).end();

  late final fieldOrType = _parser.buildFrom(_parser.fieldOrType()).end();

  late final fieldMethodParameters =
      _parser.buildFrom(_parser.parameters()).end();

  late final typeBody = _parser.buildFrom(_parser.typeBody()).end();

  late final typeDeclaration =
      _parser.buildFrom(_parser.typeDeclaration()).end();

  late final methods = _parser.buildFrom(_parser.methods()).end();

  late final functionDeclaration =
      _parser.buildFrom(_parser.functionDeclaration()).end();

  late final eventDeclaration =
      _parser.buildFrom(_parser.eventDeclaration()).end();

  late final namespaceBody = _parser.buildFrom(_parser.namespaceBody()).end();

  late final namespaceDeclaration =
      _parser.buildFrom(_parser.namespaceDeclaration()).end();
}
