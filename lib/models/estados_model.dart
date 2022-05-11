class EstadoModel {
  int? id;
  String? sigla;
  String? nome;

  EstadoModel({
    this.id,
    this.sigla,
    this.nome,
  });

  EstadoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sigla = json['sigla'];
    nome = json['nome'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sigla'] = sigla;
    data['nome'] = nome;

    return data;
  }
}
