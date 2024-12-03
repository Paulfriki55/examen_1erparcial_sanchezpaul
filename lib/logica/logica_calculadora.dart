import 'resultados_calculadora.dart';

class LogicaCalculadora {
  final List<ResultadosCalculadora> _historial = [];

  List<ResultadosCalculadora> get historial => List.unmodifiable(_historial);

  double sumar(double a, double b) => a + b;

  double restar(double a, double b) => a - b;

  double multiplicar(double a, double b) => a * b;

  double dividir(double a, double b) {
    if (b == 0) throw Exception('No se puede dividir por cero');
    return a / b;
  }

  int modulo(int a, int b) {
    if (b == 0) throw Exception('No se puede calcular el módulo con cero');
    return a % b;
  }

  ResultadosCalculadora calcularTodo(double num1, double num2) {
    final resultados = ResultadosCalculadora(
      num1: num1,
      num2: num2,
      resultados: {
        'suma': sumar(num1, num2),
        'resta1': restar(num1, num2),
        'resta2': restar(num2, num1),
        'multiplicacion': multiplicar(num1, num2),
        'division1': dividir(num1, num2),
        'division2': dividir(num2, num1),
        'modulo1': modulo(num1.toInt(), num2.toInt()),
        'modulo2': modulo(num2.toInt(), num1.toInt()),
      },
    );
    _historial.add(resultados);
    return resultados;
  }
}

