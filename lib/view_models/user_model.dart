class UserViewModel {
  String? name;
  String? email;
  String? phone;
  String? birthdate;
  String? oldPass;
  String? newPass;

  UserViewModel(
      {this.name,
      this.email,
      this.phone,
      this.birthdate,
      this.oldPass,
      this.newPass});

  UserViewModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    birthdate = json['birthdate'];
    oldPass = json['oldPass'];
    newPass = json['newPass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['birthdate'] = birthdate;
    data['oldPass'] = oldPass;
    data['newPass'] = newPass;
    return data;
  }
}
