class ItemModel {
  final int id;
  final String profession;
  final String name;
  List<String>? photos;
  final String city;
  final String state;
  final String district;
  final String phone;
  final String email;
  final String instagram;
  final String facebook;
  final String whatsapp;

  ItemModel({
    required this.id,
    required this.name,
    required this.profession,
    required this.photos,
    required this.state,
    required this.city,
    required this.district,
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
        photos: json['photos'],
        city: json['city'],
        state: json['state'],
        district: json['district'],
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
        'photos': photos,
        'state': photos,
        'city': photos,
        'district': photos,
        'email': email,
        'instagram': instagram,
        'facebook': facebook,
        'whatsapp': whatsapp,
      };
}
