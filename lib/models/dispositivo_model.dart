class DeviceModel {
  String? idDispositivo;
  String? fabricante;
  String? modelo;
  String? so;
  String? versaoSo;

  DeviceModel(
      {this.idDispositivo,
      this.fabricante,
      this.modelo,
      this.so,
      this.versaoSo});

  DeviceModel.fromJson(Map<String, dynamic> json) {
    idDispositivo = json['idDispositivo'];
    fabricante = json['fabricante'];
    modelo = json['modelo'];
    so = json['so'];
    versaoSo = json['versaoSo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['idDispositivo'] = idDispositivo;
    data['fabricante'] = fabricante;
    data['modelo'] = modelo;
    data['so'] = so;
    data['versaoSo'] = versaoSo;
    return data;
  }
}
