class ApiServices {
  //produção
  static const String intranetUrl =
      "https://intranet.ssp.se.gov.br/API/Intranetttttt/";
  static const String consultaIntegrada =
      "https://intranet.ssp.se.gov.br/API/ConsultaIntegradaaaaaaaaaa/";

  //local
  // static final String intranetUrl = "http://10.10.1.71:3071/";
  // static final String consultaIntegrada = "http://10.10.1.71:58477/";

  static String concatIntranetUrl(String url) => intranetUrl + url;

  static String concatConsultaIntegradaUrl(String url) =>
      consultaIntegrada + url;
}
