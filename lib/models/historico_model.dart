class Historico {
  final int? id;
  final String name;
  Historico({
    this.id,
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': name};
  }

  @override
  String toString() {
    return "$name";
  }
}
