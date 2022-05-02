import 'package:ache_facil/models/item_model.dart';

class ItemViewModel extends ItemModel {
  ItemViewModel(
      {required int id,
      required String name,
      required String profession,
      String? fotoPrincipal,
      List<String>? photos,
      required String photo,
      required String state,
      required String city,
      required String district,
      required String phone,
      required String email,
      required String instagram,
      required String facebook,
      required String whatsapp})
      : super(
            id: id,
            name: name,
            profession: profession,
            photos: photos,
            photo: photo,
            state: state,
            city: city,
            district: district,
            phone: phone,
            email: email,
            instagram: instagram,
            facebook: facebook,
            whatsapp: whatsapp);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profession'] = profession;
    data['name'] = name;
    data['photos'] = photos;
    data['state'] = state;
    data['city'] = city;
    data['district'] = district;
    data['email'] = email;
    data['instagram'] = instagram;
    data['facebook'] = facebook;
    data['whatsapp'] = whatsapp;
    return data;
  }
}
