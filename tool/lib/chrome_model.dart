class ChromeApi {
  final String name;
  final Documentation documentation;
  final List<Event> events;
  final Map<String, Property> properties;

  ChromeApi({
    required this.documentation,
    required this.properties,
    required this.name,
    required this.events,
  });
}

class Documentation {
  Documentation(String? documentation);
}

class Event {
  final String name;
  final Documentation documentation;

  Event(this.name, this.documentation);
}

class Method {
  final String name;
  final Documentation documentation;

  Method({required this.name, required this.documentation});
}

class Enumeration {
  final String name;
  final Documentation documentation;

  Enumeration(this.name, this.documentation);
}

class Dictionary {
  final Map<String, Property> properties;

  Dictionary(this.properties);
}

class Property {
  final String typeName;
  final bool optional;
}
