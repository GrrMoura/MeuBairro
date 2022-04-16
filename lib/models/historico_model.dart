class Historico {
  final int? id;
  final String name;
  Historico({
    this.id,
    required this.name,
    profression,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  @override
  String toString() {
    return "$name";
  }
}
