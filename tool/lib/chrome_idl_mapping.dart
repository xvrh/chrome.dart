library chrome_idl_mapping;

import 'package:collection/collection.dart';

import 'chrome_idl_model.dart';

bool isCallback(String name) =>
    const ['callback', 'responseCallback'].contains(name);

IDLType typeWithAttribute(IDLType type, IDLAttributeDeclaration? attribute) {
  var instanceOfAttribute = attribute?.attributes.firstWhereOrNull(
      (e) => e.attributeType == IDLAttributeTypeEnum.INSTANCE_OF);
  if (type.name == 'object' && instanceOfAttribute != null) {
    type = idlAttributeTypeMapping(instanceOfAttribute, isArray: type.isArray);
  }
  return type;
}

/// Mapping the type of an attribute.
IDLType idlAttributeTypeMapping(IDLAttribute instanceOfAttribute,
    {bool isArray = false}) {
  assert(instanceOfAttribute.attributeType == IDLAttributeTypeEnum.INSTANCE_OF);
  return IDLType(instanceOfAttribute.attributeValue!, isArray: isArray);
}

/// Method to help find IDLAttributeTypeEnum by String name.
IDLAttributeTypeEnum resolveEnum(String name) {
  return IDLAttributeTypeEnum.values.singleWhere(
    (e) => e.type == name,
    orElse: () =>
        throw ArgumentError("$name cannot be resolved IDLAttributeTypeEnum"),
  );
}
