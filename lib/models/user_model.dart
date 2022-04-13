import 'package:ache_facil/models/favorite_model.dart';

class UserModel {
  String? name;
  String? photo;
  String? phone;
  String? email;
  List<Favorite>? favorites;

  UserModel({this.name, this.photo, this.phone, this.email, this.favorites});

  UserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    photo = json['photo'];
    phone = json['phone'];
    email = json['email'];
    if (json['favorites'] != null) {
      favorites = <Favorite>[];
      json['favorites'].forEach((v) {
        favorites!.add(Favorite.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['photo'] = photo;
    data['phone'] = phone;
    data['email'] = email;
    if (favorites != null) {
      data['favorites'] = favorites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
