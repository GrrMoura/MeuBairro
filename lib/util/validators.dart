class ValidatorsUtils {
  static bool validateDate(String value) {
    if (value.isEmpty) {
      return false;
    }
    final components = value.split("/");
    var diaDoMes = 31;
    if (components.length == 3) {
      final dia = int.tryParse(components[0]);
      final mes = int.tryParse(components[1]);
      final ano = int.tryParse(components[2]);

      if (mes == 2) {
        diaDoMes = 29;
      }

      if (dia != null && mes != null && ano != null) {
        final date = DateTime(ano, mes, dia);
        if (date.year == ano && date.month == mes && date.day == dia) {
          DateTime dateNow = DateTime.now();
          if (date.year < dateNow.year &&
              date.month <= 12 &&
              date.day <= diaDoMes) {
            return true;
          }
        }
      }
    }
    return false;
  }
}
