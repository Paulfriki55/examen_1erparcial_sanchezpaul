import 'package:flutter/material.dart';
import '../logica/resultados_calculadora.dart';

class PantallaHistorial extends StatelessWidget {
  const PantallaHistorial({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ResultadosCalculadora> historial = ModalRoute.of(context)!.settings.arguments as List<ResultadosCalculadora>;
    final tema = Theme.of(context);
    final colorScheme = tema.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Historial de Cálculos'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              colorScheme.primary.withOpacity(0.1),
              colorScheme.secondary.withOpacity(0.1),
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: historial.length,
          itemBuilder: (context, index) {
            final resultado = historial[index];
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: ListTile(
                title: Text('${resultado.num1} y ${resultado.num2}', style: tema.textTheme.titleMedium),
                subtitle: Text('Suma: ${resultado.resultados['suma'].toStringAsFixed(2)}', style: tema.textTheme.bodyMedium),
                trailing: Text(
                  '${resultado.fechaHora.day}/${resultado.fechaHora.month}/${resultado.fechaHora.year}',
                  style: tema.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Resultados para ${resultado.num1} y ${resultado.num2}'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: resultado.resultados.entries.map((entry) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text('${entry.key}: ${entry.value.toStringAsFixed(2)}', style: tema.textTheme.bodyLarge),
                              );
                            }).toList(),
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cerrar'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

