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
  final String rawName;
  final bool isArray;

  TypeRef(this.rawName) : isArray = false;

  TypeRef.array(this.rawName) : isArray = true;

  String get bindingName => isArray ? 'JSArray' : rawName;
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

  Dictionary(this.name, this.methods,
      {required this.properties, required this.documentation});
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
