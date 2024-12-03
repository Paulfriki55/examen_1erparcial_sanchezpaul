import 'package:flutter/material.dart';
import 'package:examen_1erparcial_sanchezpaul/ui/pantalla_calculadora.dart';
import 'package:examen_1erparcial_sanchezpaul/ui/pantalla_historial.dart';
import 'package:examen_1erparcial_sanchezpaul/ui/tema/proveedor_tema.dart';

void main() {
  runApp(const MiApp());
}

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProveedorTema(
      child: Builder(
        builder: (BuildContext context) {
          final temaActual = ProveedorTema.of(context);
          return MaterialApp(
            title: 'Calculadora Profesional',
            theme: ProveedorTema.temaClaro,
            darkTheme: ProveedorTema.temaOscuro,
            themeMode: temaActual.modoTema,
            initialRoute: '/',
            routes: {
              '/': (context) => const PantallaCalculadora(),
              '/historial': (context) => const PantallaHistorial(),
            },
          );
        },
      ),
    );
  }
}