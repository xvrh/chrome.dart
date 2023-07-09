import 'utils/split_words.dart';
import 'utils/string_helpers.dart';

class ChromeApi {
  final String name;
  final String documentation;
  final List<Event> events;
  final List<Method> functions;
  final Map<String, Property> properties;
  final List<Dictionary> dictionaries;
  final List<Enumeration> enumerations;

  ChromeApi({
    required this.documentation,
    required this.properties,
    required this.name,
    required this.events,
    required this.functions,
    required this.dictionaries,
    required this.enumerations,
  });
}

class TypeRef {
  String rawName;
  final bool isArray;
  String? url;

  TypeRef._(this.rawName, this.url, {this.isArray = false});

  factory TypeRef(String name, {bool isArray = false}) {
    var (rawName, url) = _nameAndUrl(name);
    return TypeRef._(rawName, url, isArray: isArray);
  }

  static (String, String?) _nameAndUrl(String name) {
    var split = name.split('.');
    if (split.length > 1) {
      var url = '${snakeCase(splitWords(split.first))}.dart';
      return (split.last, url);
    } else {
      return (name, null);
    }
  }

  String get bindingName => isArray ? 'JSArray' : _toJsName(rawName);

  static String _toJsName(String type) {
    return const {
          'integer': 'int',
          'long': 'int',
          'boolean': 'bool',
          'DOMString': 'String',
          'string': 'String',
          'number': 'num',
          'object': 'JSObject',
          'ArrayBuffer': 'JSArrayBuffer',
          'any': 'JSAny',
          'function': 'JSFunction',
          'InjectedFunction': 'JSFunction',
          'Date': 'JSObject', //TODO(xha): convert to a dart DateTime?
          'binary': 'JSAny', //TODO: JSArrayBuffer ??
          //TODO(xha): link to "package:web"?
          'SubtleCrypto': 'JSObject',
          'Blob': 'JSObject',
        }[type] ??
        type;
  }
}

class Event {
  final String name;
  final String documentation;

  Event(this.name, this.documentation);
}

class Method {
  final String name;
  final String documentation;
  final List<Property> parameters;

  Method(this.name, {required this.parameters, required this.documentation});
}

class Enumeration {
  final String name;
  final String documentation;
  final List<EnumerationValue> values;

  Enumeration(this.name, {required this.documentation, required this.values});
}

class EnumerationValue {
  final String name;
  final String documentation;

  EnumerationValue({required this.name, required this.documentation});
}

class Dictionary {
  final String name;
  final List<Property> properties;
  final List<Method> methods;
  final String documentation;

  Dictionary(this.name,
      {required this.methods,
      required this.properties,
      required this.documentation});
}

class Property {
  final String name;
  final TypeRef type;
  final bool optional;
  final String documentation;

  Property(
    this.name, {
    required this.type,
    required this.optional,
    required this.documentation,
  });
}
