class Favorite {
  String? name;
  String? profession;
  String? photo;

  Favorite({this.name, this.profession, this.photo});

  Favorite.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profession = json['profession'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['profession'] = profession;
    data['photo'] = photo;
    return data;
  }
}
