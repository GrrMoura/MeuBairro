class SearchViewModel {
  String? bairro;
  String? cidade;
  String? item;

  SearchViewModel({this.bairro, this.cidade, this.item});

  SearchViewModel.fromJson(Map<String, dynamic> json) {
    bairro = json['bairro'];
    cidade = json['cidade'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bairro'] = bairro;
    data['cidade'] = cidade;
    data['item'] = item;
    return data;
  }
}
