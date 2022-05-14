class LoginViewModel {
  String? login;
  String? senha;
  bool? lembrarMe;
  bool? leitorBiometrico;
  bool? checkado;
  bool? ocupado;
  String? tokenFirebase;

  LoginViewModel(
      {this.login,
      this.senha,
      this.tokenFirebase,
      this.lembrarMe = false,
      this.leitorBiometrico = false,
      this.checkado = false,
      this.ocupado = false});

  LoginViewModel.fromJson(Map<String, dynamic> json) {
    login = json['usuario'];
    senha = json['senha'];
    tokenFirebase = json['token'];
    checkado = json['checkado'];
    lembrarMe = json['lembrarMe'];
    leitorBiometrico = json['leitorBiometrico'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['login'] = login;
    data['senha'] = senha;
    data['token'] = tokenFirebase;
    return data;
  }
}
