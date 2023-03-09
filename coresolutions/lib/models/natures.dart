class Nature {
  Nature({
    required this.id,
    required this.type,
    required this.attributes,
  });

  final String id;
  final String type;
  final Attributes attributes;

  Nature.fromMap(Map<String, dynamic> x)
      : id = x["id"],
        type = x["type"],
        attributes = Attributes.fromMap(x["attributes"]);

  static List<Nature> fromMapList(List<dynamic> x) {
    return x.map((f) => Nature.fromMap(f as Map<String, dynamic>)).toList();
  }
}

class Attributes {
  Attributes({
    required this.alias,
    required this.code,
  });

  final String alias;
  final String code;

  Attributes.fromMap(Map<String, dynamic> x)
      : alias = x["alias"],
        code = x["code"];
}
