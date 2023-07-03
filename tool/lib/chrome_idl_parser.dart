library chrome_idl_parser;

import 'package:petitparser/parser.dart';
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

  /// Parse the enum declarations.
  Parser enumDeclaration() =>
      docString +
      attributeDeclaration.maybe +
      reserved["enum"] +
      identifier +
      braces(enumBody.sepBy(comma)) +
      semi;

  /// Parse the enum values.
  Parser<Sequence2<List<String>, String>> enumBody() =>
      seq2(ref0(docString), ref0(identifier));

  Parser<IDLAttributeDeclaration> attributeDeclaration() => ref0(attribute)
      .plusSeparated(ref1(token, ','))
      .skip(before: char('['), after: char(']'))
      .map((e) => IDLAttributeDeclaration(e.elements));

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
      ref0(stringLiteralInParentheses) |
      ref0(integer) |
      ref0(integerList);

  Parser<String> stringLiteral() =>
      seq3(char('"'), pattern('^"').star(), char('"'))
          .map3((_, e, __) => e)
          .flatten();

  Parser stringLiteralInParentheses() =>
      ref0(stringLiteral).skip(before: char('('), after: char(')'));

  Parser<int> integer() => ref1(token, digit().plus()).flatten().map(int.parse);

  Parser<List<int>> integerList() => ref0(integer)
      .plusSeparated(ref1(token, ','))
      .skip(before: char('('), after: char(')'))
      .map((e) => e.elements);

  Parser<String> identifier() =>
      ref1(token, ref0(identifierStart) & ref0(identifierPart).star())
          .map((t) => t.input);

  Parser identifierStart() => letter() | anyOf(r'_$');

  Parser identifierPart() => ref0(identifierStart) | digit();

  /// Parser all documentation strings and spaces between.
  Parser<List<String>> docString() => ref0(singleDocString).star();

  Parser<String> singleDocString() => (ref0(singleLineComment) |
          ref0(multiLineDocComment) |
          ref0(multiLineComment))
      .cast<String>();

  Parser<String> singleLineComment() => ref0(newlineLexicalToken)
      .neg()
      .star()
      .skip(before: string('//'), after: ref0(newlineLexicalToken).optional())
      .map((e) => e.join());

  Parser<String> multiLineDocComment() =>
      (ref0(multiLineComment) | string('*/').neg())
          .star()
          .skip(before: string('/**'), after: string('*/'))
          .map((e) => e.join());

  Parser<String> multiLineComment() =>
      (ref0(multiLineComment) | string('*/').neg())
          .star()
          .skip(before: string('/*'), after: string('*/'))
          .map((e) => e.join());

  Parser newlineLexicalToken() => pattern('\n\r');
}

class ChromeIDLParser {
  final _parser = ChromeIDLGrammar();

  late final docString = _parser.buildFrom(_parser.docString()).end();

  late final attributeDeclaration =
      _parser.buildFrom(_parser.attributeDeclaration()).end();
}

/*      // Attribute where name=value
  (identifier + symbol('=') + identifier
  ^ idlAttributeAssignedValueMapping)
  // Attribute where [name="string"]
  | (identifier + symbol('=') + stringLiteral
  ^ idlAttributeAssignedStringLiteral)
  // Attribute where [name=("string")]
  | (identifier + symbol('=') + parens(stringLiteral)
  ^ idlAttributeAssignedStringLiteral)
  // Attribute where [maxListeners=1]
  | (identifier + symbol('=') + natural
  ^ (name, _, number) =>
      idlAttributeAssignedValueMapping(name, _, number.toString()))
  // Attribute where [name=(1,2)]
  | (identifier + symbol('=') + parens(intLiteral.sepBy(comma))
  ^ idlAttributeAssignedMultiValueMapping)
  // Attribute where [name]
  | (identifier ^ idlAttributeMapping)*/

/*
  Parser get namespaceIdentifier => identifier.sepBy(dot) | identifier;
  /**
   * Parse the namespace.
   */
  Parser get namespaceDeclaration =>
      copyrightSignature.maybe
      + whiteSpace.maybe
      + docString
      + attributeDeclaration.maybe
      + reserved["namespace"]
      + namespaceIdentifier
      + braces(namespaceBody)
      + semi
      ^ idlNamespaceDeclarationMapping;

  /**
   * The body of the namespace. This could include function, type, event,
   * callback and enum declarations.
   */
  Parser get namespaceBody => _namespaceBody.many;

  Parser get _namespaceBody => functionDeclaration
                               | typeDeclaration
                               | eventDeclaration
                               | callbackDeclaration
                               | enumDeclaration;

  /**
   * Parse the interface Functions.
   */
  Parser get functionDeclaration =>
      (docString
      + attributeDeclaration.maybe
      + reserved["interface"]
      + symbol("Functions")
      + braces(methods)
      + semi ^ idlFunctionDeclarationMapping);

  Parser get methods => _methods.many;

  // TODO: merge _methods with _typeBody implementation
  Parser get _methods =>
      (docString
      + attributeDeclaration.maybe
      + reserved["static"].maybe
      + fieldType
      + identifier
      + parens(fieldMethodParameters.sepBy(comma))
      + semi
      ^ idlMethodParameterMapping);

  /**
   * Parse the interface Events.
   */
  Parser get eventDeclaration =>
      (docString
      + attributeDeclaration.maybe
      + reserved["interface"]
      + symbol("Events")
      + braces(methods)
      + semi ^ idlEventDeclarationMapping);

  /**
   * Parse the dictionary definitions.
   */
  // Note: Also need to parse methods within a type declaration.
  // This happens in IDL such as app_window.idl.
  // What we should do is in the mapping method
  // check the runtime type and put seperate them
  // between methods and members.
  Parser get typeDeclaration =>
      docString
      + attributeDeclaration.maybe
      + reserved["dictionary"]
      + identifier
      + braces(typeBody)
      + semi ^ idlTypeDeclarationMapping;

  Parser get typeBody => _typeBody.many;

  Parser get _typeBody =>
      // [instanceOf=FileEntry] object entry;
      (docString + attributeDeclaration + reserved["object"] + identifier + semi
          ^ idlFieldAttributeBasedTypeMapping)
      |
      // LaunchItem[]? items; or DOMString type;
      (docString + attributeDeclaration.maybe + fieldType + symbol('?').maybe + identifier + semi
          ^ idlFieldBasedTypeMapping)
      |
      // [nodoc] (DOMString or FrameOptions)? frame;
      (docString + attributeDeclaration.maybe + fieldOrType + symbol('?').maybe + identifier + semi
          ^ idlFieldBasedTypeMapping)
      |
      // static void resizeTo(long width, long height);
      // [nocompile] static Bounds getBounds();
      // Return type IDLMethod
      (docString
          + attributeDeclaration.maybe
          + reserved["static"]
          + fieldType
          + identifier
          + parens(fieldMethodParameters.sepBy(comma))
          + semi
          ^ idlMethodParameterMapping);

  Parser get fieldMethodParameters =>
      // [instanceOf=Entry] object entry
      (attributeDeclaration + reserved["object"] + identifier
        ^ (attribute, _, name) =>
            idlParameterAttributeBasedTypeMapping(name, attribute))
        |
        // GetResourcesCallback callback
        // TODO: we could use this to resolve the callback later on
        // via symbol table if needed.
        (fieldType + reserved["callback"] ^ (type, name) =>
            idlParameterMapping(name, type, false, true))
        |
        // (long or DOMString) callback
        (fieldOrType + reserved["callback"] ^ (type, name) =>
            idlParameterMapping(name, type, false, true))
        |
        // optional ResultCallback callback
        (reserved["optional"] + fieldType + reserved["callback"]
            ^ (_, type, name) => idlParameterMapping(name, type, true, true))
        |
        // optional (long or DOMString) callback
        (reserved["optional"] + fieldOrType + reserved["callback"]
            ^ (_, type, name) => idlParameterMapping(name, type, true, true))
        |
        // optional DOMString responseUrl
        (reserved["optional"] + fieldType + identifier
            ^ (_, type, name) => idlParameterMapping(name, type, true, false))
        |
        // optional (long or DOMString) height
        (reserved["optional"] + fieldOrType + identifier
            ^ (_, type, name) => idlParameterMapping(name, type, true, false))
        |
        // DOMString responseUrl or DOMString[] urls
        (fieldType + identifier ^ (type, name) =>
            idlParameterMapping(name, type, false, false))
        |
        // (long or DOMString) height
        (fieldOrType + identifier ^ (type, name) =>
            idlParameterMapping(name, type, false, false));

  // define or as a symbol.
  Parser<String> get or => symbol('or') % 'or';

  // TODO(adam): return idl type with attribute. Not propagating at the moment.
  Parser get fieldSingleOrTypeDeclaration =>
      // [instanceOf=Device] object
      attributeDeclaration.maybe + fieldType ^ (_, __) => null;

  Parser get fieldOrType =>
      // (Device or DOMString)
      parens(fieldSingleOrTypeDeclaration.sepBy(or)) ^ (_) => idlTypeOrMapping();

  // TODO: refactor with callbackParameterType
  Parser get fieldType =>
      // Device[]
      (identifier + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      //static void getFileStatuses(object[] fileEntries,
      //                            GetFileStatusesCallback callback);
      (reserved["object"] + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      // Device
      (identifier ^ (name) => idlTypeMapping(name, false))
      |
      // object
      (reserved["object"] ^ (name) => idlTypeMapping(name, false));

  /**
   * Parse a callback definition.
   */
  Parser get callbackDeclaration =>
      docString
      + attributeDeclaration.maybe
      + reserved["callback"]
      + identifier
      + symbol("=")
      + callbackMethod
      + semi ^ idlCallbackDeclarationMapping;

  Parser get callbackMethod =>
      // TODO: rename callbackParameters to callbackParameter?
      // NOTE: we used void as a symbol instead of a reserved keyword
      // for shortcut on other parsers. Proper parser should reserve
      // "void".
      // void (StorageUnitInfo[] info)
      symbol("void") + parens(callbackParameters.sepBy(comma))
      ^ (_, parameters) => parameters;

  Parser get callbackParameters =>
      // [instanceOf=Entry] object entry
      (attributeDeclaration + reserved["object"] + identifier
          ^ (attribute, __, name) =>
              idlParameterAttributeBasedTypeMapping(name, attribute))
      |
      // [instanceOf=DOMFileSystem] object[] mediaFileSystems
      (attributeDeclaration + reserved["object"] + symbol('[') + symbol(']')
          + identifier ^ (attribute, __, ___, ____, name) =>
              idlParameterAttributeBasedTypeMapping(name, attribute,
                  isArray: true))
      |
      (attributeDeclaration
      + reserved["optional"]
      + callbackParameterType
      + identifier
      ^ idlOptionalParameterAttributeRemapTypeMapping)
      |
      // optional DOMString responseUrl
      (reserved["optional"] + callbackParameterType + identifier
          ^ (_, type, name) => idlParameterMapping(name, type, true, false))
      |
      //  Device device or Device[] result
      (callbackParameterType + identifier
          ^ (type, name) => idlParameterMapping(name, type, false, false));

  Parser get callbackParameterType =>
      // Device[]
      (identifier + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      //static void getFileStatuses(object[] fileEntries,
      //                            GetFileStatusesCallback callback);
      (reserved["object"] + symbol('[') + symbol(']') ^ (name, __, ___) =>
          idlTypeMapping(name, true))
      |
      // Device
      (identifier ^ (name) => idlTypeMapping(name, false))
      |
      // object
      (reserved["object"] ^ (name) => idlTypeMapping(name, false))
      |
      // (long or DOMString)
      (fieldOrType ^ (_) => idlTypeOrMapping());

  /**
   * Parse the enum declarations.
   */
  Parser get enumDeclaration =>
      docString
      + attributeDeclaration.maybe
      + reserved["enum"]
      + identifier
      + braces(enumBody.sepBy(comma))
      + semi
      ^ idlEnumDeclarationMapping;

  /**
   * Parse the enum values.
   */
  Parser get enumBody =>
      docString + identifier ^ idlEnumValueMapping;

  /**
   * Parse the attribute declaration.
   */
  Parser get attributeDeclaration =>
      brackets(attribute.sepBy(comma)) ^ idlAttributeDeclarationMapping;

  /**
   * Parse the attribute.
   */
  Parser get attribute =>
      // Attribute where name=value
      (identifier + symbol('=') + identifier
      ^ idlAttributeAssignedValueMapping)
      // Attribute where [name="string"]
      | (identifier + symbol('=') + stringLiteral
      ^ idlAttributeAssignedStringLiteral)
      // Attribute where [name=("string")]
      | (identifier + symbol('=') + parens(stringLiteral)
      ^ idlAttributeAssignedStringLiteral)
      // Attribute where [maxListeners=1]
      | (identifier + symbol('=') + natural
      ^ (name, _, number) =>
          idlAttributeAssignedValueMapping(name, _, number.toString()))
      // Attribute where [name=(1,2)]
      | (identifier + symbol('=') + parens(intLiteral.sepBy(comma))
      ^ idlAttributeAssignedMultiValueMapping)
      // Attribute where [name]
      | (identifier ^ idlAttributeMapping);

  /**
   * Parser all documentation strings and spaces between.
   */
  Parser get docString => lexeme(_docString).many;
  Parser get _docString =>
        everythingBetween(string('//'), string('\n'))
      | everythingBetween(string('/**'), string('*/'))
      | everythingBetween(string('/*'), string('*/'));

  /**
   * Parse the copyright signature at the top of all idl files.
   */
  Parser get copyrightSignature =>
        everythingBetween(string('// Copyright'), string('LICENSE file.\n\n'))
      | everythingBetween(string('// Copyright'), string('LICENSE file.\n'));*/
