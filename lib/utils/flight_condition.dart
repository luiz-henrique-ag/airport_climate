class FlightCondition {
  static String analisarViabilidade(String? condicaoClimatica,
      String? visibilidade, String? velocidadeVento) {
    visibilidade = visibilidade!.replaceAll(RegExp("[><]"), "");
    int visibility = int.parse(visibilidade);
    int windSpeed = int.parse(velocidadeVento!);

    List<String> ensolarado = ["ps", "cl"];
    List<String> chuvoso = [
      "ec",
      "ci",
      "c",
      "pp",
      "cm",
      "cn",
      "pt",
      "pm",
      "pc",
      "cv",
      "ch",
      "t",
      "pnt",
      "psc",
      "pcm",
      "pct",
      "pcn",
      "ct",
      "ppm",
      "ppt",
      "ppn"
    ];
    List<String> nublado = [
      "np",
      "pn",
      "e",
      "n",
      "nv",
      "npt",
      "npn",
      "ncn",
      "nct",
      "ncm",
      "npn",
      "npp",
      "vn"
    ];

    // Analisar visibilidade e velocidade do vento para determinar a viabilidade do voo
    if ((ensolarado.contains(condicaoClimatica) &&
            visibility >= 5000 &&
            visibility <= 10000 &&
            windSpeed >= 0 &&
            windSpeed <= 10) ||
        (nublado.contains(condicaoClimatica) &&
            visibility >= 5000 &&
            visibility <= 10000 &&
            windSpeed >= 0 &&
            windSpeed <= 15) ||
        (chuvoso.contains(condicaoClimatica) &&
            visibility >= 2000 &&
            visibility < 5000 &&
            windSpeed >= 10 &&
            windSpeed <= 25) ||
        (chuvoso.contains(condicaoClimatica) &&
            visibility < 2000 &&
            windSpeed >= 20 &&
            windSpeed <= 35) ||
        (nublado.contains(condicaoClimatica) &&
            visibility < 500 &&
            windSpeed >= 0 &&
            windSpeed <= 5) ||
        (condicaoClimatica == "t" &&
            visibility >= 5000 &&
            visibility <= 10000 &&
            windSpeed > 35)) {
      return "Ótimo";
    } else if ((ensolarado.contains(condicaoClimatica) ||
            nublado.contains(condicaoClimatica) ||
            condicaoClimatica == "t") &&
        visibility >= 5000 &&
        visibility <= 10000 &&
        windSpeed >= 0 &&
        windSpeed <= 15) {
      return "Bom";
    } else if ((chuvoso.contains(condicaoClimatica) ||
            condicaoClimatica == "t") &&
        visibility >= 2000 &&
        visibility < 5000 &&
        windSpeed >= 10 &&
        windSpeed <= 25) {
      return "Cauteloso";
    } else {
      return "Não Recomendado";
    }
  }
}
