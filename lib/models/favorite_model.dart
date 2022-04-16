class FavoriteModel {
  int? id;
  int? idItem;
  String? name;
  String? profession;
  String? city;
  String? state;
  String? district;
  String? photo;
  String? phone;
  String? email;
  String? instaram;
  String? facebook;
  String? whatsapp;

  FavoriteModel(
      {this.id,
      required this.idItem,
      required this.name,
      required this.profession,
      required this.city,
      required this.state,
      required this.district,
      this.photo,
      required this.phone,
      required this.email,
      this.instaram,
      this.facebook,
      this.whatsapp});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idItem = json['idItem'];
    name = json['name'];
    profession = json['profession'];
    city = json['city'];
    state = json['state'];
    district = json['district'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    instaram = json['instaram'];
    facebook = json['facebook'];
    whatsapp = json['whatsapp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['idItem'] = idItem;
    data['name'] = name;
    data['profession'] = profession;
    data['city'] = city;
    data['state'] = state;
    data['district'] = district;
    data['photo'] = photo;
    data['phone'] = phone;
    data['email'] = email;
    data['instaram'] = instaram;
    data['facebook'] = facebook;
    data['whatsapp'] = whatsapp;
    return data;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'idItem': idItem,
      'name': name,
      'profession': profession,
      'city': city,
      'district': district,
      'photo': photo,
      'phone': phone,
      'email': email,
      'instagram': instaram,
      'facebook': facebook,
      'whatsapp': whatsapp,
    };
  }

  @override
  String toString() {
    return "$name";
  }
}
