class ResultadosCalculadora {
  final double num1;
  final double num2;
  final Map<String, dynamic> resultados;
  final Map<String, String> mensajesConmutatividad;
  final DateTime fechaHora;

  ResultadosCalculadora({
    required this.num1,
    required this.num2,
    required this.resultados,
    required this.mensajesConmutatividad,
  }) : fechaHora = DateTime.now();
}

