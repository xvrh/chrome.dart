import 'chrome_type.dart';
import 'utils/string.dart';

export 'chrome_type.dart';

class ChromeApi {
  final String name;
  final String documentation;
  final List<Event> events;
  final List<Method> functions;
  final List<Property> properties;
  final List<Dictionary> dictionaries;
  final List<Enumeration> enumerations;
  final List<Typedef> typedefs;

  ChromeApi({
    required this.documentation,
    required this.properties,
    required this.name,
    required this.events,
    required this.functions,
    required this.dictionaries,
    required this.enumerations,
    required this.typedefs,
  });

  String? get group {
    var split = name.split('.');
    if (split.length > 1) {
      return split.first;
    }
    return null;
  }

  String get nameWithoutGroup => name.split('.').last;

  String get classNameWithGroup => name.upperCamel;
  String get classNameWithoutGroup => nameWithoutGroup.upperCamel;

  String get fileName => '${name.snakeCase}.dart';

  Iterable<ChromeType> get inputTypes sync* {
    var seen = <Dictionary>{};
    for (var function in functions) {
      yield* typesWithDictionaries(function.inputTypes(), seen);
    }
  }

  Iterable<ChromeType> get outputTypes sync* {
    var seen = <Dictionary>{};
    for (var property in properties) {
      yield* typesWithDictionaries(property.types(), seen);
    }
    for (var event in events) {
      yield* typesWithDictionaries(event.outputTypes(this), seen);
    }
    for (var function in functions) {
      yield* typesWithDictionaries(function.outputTypes(), seen);
    }
  }

  Iterable<ChromeType> typesWithDictionaries(
      Iterable<ChromeType> types, Set<Dictionary> seen) sync* {
    for (var type in types) {
      if (type is DictionaryType && type.url == null) {
        var dict = dictionaries.singleWhere((e) => e.name == type.name);
        if (!seen.contains(dict)) {
          seen.add(dict);
          yield* typesWithDictionaries(dict.types(), seen);
        }
      }
      yield type;
    }
  }
}

class Event {
  final String name;
  final String documentation;
  final AsyncReturnType type;

  Event(this.name, {required this.type, required this.documentation});

  Iterable<ChromeType> outputTypes(ChromeApi api) sync* {
    yield type;
    yield* type.children;
  }
}

class Method {
  final String name;
  final String documentation;
  final List<Property> parameters;
  final MethodReturn returns;
  final String? deprecated;

  Method(
    this.name, {
    required this.parameters,
    required this.documentation,
    required this.returns,
    required this.deprecated,
  });

  Iterable<ChromeType> inputTypes() sync* {
    for (var param in parameters) {
      yield* param.types();
    }
  }

  Iterable<ChromeType> outputTypes() sync* {
    yield* returns.outputTypes();
  }
}

class MethodReturn {
  final ChromeType? type;
  final String? name;
  final String? documentation;

  MethodReturn({
    required this.type,
    this.name,
    required this.documentation,
  });

  bool get isAsync => type is AsyncReturnType;

  Iterable<ChromeType> outputTypes() sync* {
    if (type != null) {
      yield type!;
      yield* type!.children;
    }
  }
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
  final List<Event> events;
  final String documentation;
  final bool isAnonymous;
  final bool isSyntheticEvent;

  Dictionary(
    this.name, {
    required this.properties,
    required this.methods,
    required this.events,
    required this.documentation,
    required this.isAnonymous,
    this.isSyntheticEvent = false,
  });

  Iterable<ChromeType> types() sync* {
    for (var prop in properties) {
      yield prop.type;
      yield* prop.type.children;
    }
    //TODO: methods, events (input or output?)
  }
}

class Property {
  final String name;
  final ChromeType type;
  final String documentation;

  Property(
    this.name, {
    required this.type,
    required this.documentation,
  });

  Iterable<ChromeType> types() sync* {
    yield type;
    yield* type.children;
  }
}

class Typedef {
  final String alias;
  final ChromeType target;
  final String documentation;

  Typedef(this.alias, {required this.target, required this.documentation});
}
