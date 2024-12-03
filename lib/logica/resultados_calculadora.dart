class ResultadosCalculadora {
  final double num1;
  final double num2;
  final Map<String, dynamic> resultados;
  final DateTime fechaHora;

  ResultadosCalculadora({
    required this.num1,
    required this.num2,
    required this.resultados,
  }) : fechaHora = DateTime.now();
}

