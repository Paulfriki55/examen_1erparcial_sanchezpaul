import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../logica/logica_calculadora.dart';
import '../logica/resultados_calculadora.dart';
import 'widgets/widget_resultados.dart';
import 'tema/proveedor_tema.dart';

class PantallaCalculadora extends StatefulWidget {
  const PantallaCalculadora({super.key});

  @override
  State<PantallaCalculadora> createState() => _EstadoPantallaCalculadora();
}

class _EstadoPantallaCalculadora extends State<PantallaCalculadora> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _controladorNum1 = TextEditingController();
  final _controladorNum2 = TextEditingController();
  final _logicaCalculadora = LogicaCalculadora();
  ResultadosCalculadora? _resultados;
  late AnimationController _controladorAnimacion;
  late Animation<double> _animacionOpacidad;

  @override
  void initState() {
    super.initState();
    _controladorAnimacion = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _animacionOpacidad = Tween<double>(begin: 0.0, end: 1.0).animate(_controladorAnimacion);
  }

  @override
  void dispose() {
    _controladorAnimacion.dispose();
    super.dispose();
  }

  void _calcular() {
    if (_formKey.currentState!.validate()) {
      final num1 = double.parse(_controladorNum1.text);
      final num2 = double.parse(_controladorNum2.text);

      if (num2 == 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se puede dividir por cero')),
        );
        return;
      }

      setState(() {
        _resultados = _logicaCalculadora.calcularTodo(num1, num2);
      });
      _controladorAnimacion.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    final colorScheme = tema.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Profesional'),
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () => Navigator.pushNamed(context, '/historial', arguments: _logicaCalculadora.historial),
          ),
          IconButton(
            icon: Icon(tema.brightness == Brightness.light ? Icons.dark_mode : Icons.light_mode),
            onPressed: () {
              final proveedorTema = ProveedorTema.of(context);
              proveedorTema.cambiarTema(
                tema.brightness == Brightness.light ? ThemeMode.dark : ThemeMode.light,
              );
            },
          ),
        ],
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _controladorNum1,
                  decoration: InputDecoration(
                    labelText: 'Primer número',
                    prefixIcon: Icon(Icons.looks_one, color: colorScheme.primary),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un número';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _controladorNum2,
                  decoration: InputDecoration(
                    labelText: 'Segundo número',
                    prefixIcon: Icon(Icons.looks_two, color: colorScheme.primary),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*'))],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese un número';
                    }
                    if (double.tryParse(value) == 0) {
                      return 'El número no puede ser cero';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _calcular,
                  icon: const Icon(Icons.calculate),
                  label: const Text('Calcular'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    foregroundColor: colorScheme.onPrimary,
                  ),
                ),
                if (_resultados != null) ...[
                  const SizedBox(height: 24),
                  FadeTransition(
                    opacity: _animacionOpacidad,
                    child: WidgetResultados(resultados: _resultados!),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

