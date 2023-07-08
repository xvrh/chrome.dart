class ChromeApi {
  final String name;
  final String documentation;
  final List<Event> events;
  final List<Method> functions;
  final Map<String, Property> properties;

  ChromeApi({
    required this.documentation,
    required this.properties,
    required this.name,
    required this.events,
    required this.functions,
  });
}

class Event {
  final String name;
  final String documentation;

  Event(this.name, this.documentation);
}

class Method {
  final String name;
  final String documentation;

  Method({required this.name, required this.documentation});
}

class Enumeration {
  final String name;
  final String documentation;

  Enumeration(this.name, this.documentation);
}

class Dictionary {
  final Map<String, Property> properties;

  Dictionary(this.properties);
}

class Property {
  final String typeName;
  final bool optional;

  Property({required this.typeName, required this.optional});
}
