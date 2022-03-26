class ItemModel {
  final int id;
  final String profession;
  final String name;
  final String photo; //TODO: implementar lista de fotos, endereço e descricao
  final String bairro;
  final String phone;
  final String email;
  final String instagram;
  final String facebook;
  final String whatsapp;

  ItemModel({
    required this.id,
    required this.name,
    required this.profession,
    required this.photo,
    required this.bairro,
    required this.phone,
    required this.email,
    required this.instagram,
    required this.facebook,
    required this.whatsapp,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json['id'],
        name: json['name'],
        profession: json['profession'],
        photo: json['photo'],
        bairro: json['bairro'],
        phone: json['phone'],
        email: json['email'],
        instagram: json['instagram'],
        facebook: json['facebook'],
        whatsapp: json['whatsapp'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'profession': profession,
        'name': name,
        'photo': photo,
        'bairro': bairro,
        'email': email,
        'instagram': instagram,
        'facebook': facebook,
        'whatsapp': whatsapp,
      };
}
