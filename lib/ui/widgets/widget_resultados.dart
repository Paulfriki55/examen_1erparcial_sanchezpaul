import 'package:flutter/material.dart';
import '../../logica/resultados_calculadora.dart';

class WidgetResultados extends StatelessWidget {
  final ResultadosCalculadora resultados;

  const WidgetResultados({
    super.key,
    required this.resultados,
  });

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final colorScheme = tema.colorScheme;

    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _construirFilaResultado(context, 'Suma', '${resultados.num1} + ${resultados.num2}', resultados.resultados['suma']),
              _construirFilaResultado(context, 'Resta', '${resultados.num1} - ${resultados.num2}', resultados.resultados['resta1']),
              _construirFilaResultado(context, 'Resta invertida', '${resultados.num2} - ${resultados.num1}', resultados.resultados['resta2']),
              _construirFilaResultado(context, 'Producto', '${resultados.num1} * ${resultados.num2}', resultados.resultados['multiplicacion']),
              _construirFilaResultado(context, 'División', '${resultados.num1} / ${resultados.num2}', resultados.resultados['division1']),
              _construirFilaResultado(context, 'División invertida', '${resultados.num2} / ${resultados.num1}', resultados.resultados['division2']),
              _construirFilaResultado(context, 'Módulo', '${resultados.num1} % ${resultados.num2}', resultados.resultados['modulo1']),
              _construirFilaResultado(context, 'Módulo invertido', '${resultados.num2} % ${resultados.num1}', resultados.resultados['modulo2']),
            ],
          ),
        ),
      ),
    );
  }

  Widget _construirFilaResultado(BuildContext context, String operacion, String ecuacion, dynamic resultado) {
    final tema = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(operacion, style: tema.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
          Text('$ecuacion = ${resultado.toStringAsFixed(2)}', style: tema.textTheme.bodyLarge),
        ],
      ),
    );
  }
}

