import 'package:flutter/material.dart';

class ProveedorTema extends StatefulWidget {
  final Widget child;

  const ProveedorTema({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<ProveedorTema> createState() => _EstadoProveedorTema();

  static _EstadoProveedorTema of(BuildContext context) {
    return context.findAncestorStateOfType<_EstadoProveedorTema>()!;
  }

  static ThemeData get temaClaro => _EstadoProveedorTema.temaClaro;
  static ThemeData get temaOscuro => _EstadoProveedorTema.temaOscuro;
}

class _EstadoProveedorTema extends State<ProveedorTema> {
  ThemeMode _modoTema = ThemeMode.light;

  ThemeMode get modoTema => _modoTema;

  void cambiarTema(ThemeMode nuevoModo) {
    setState(() {
      _modoTema = nuevoModo;
    });
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  static final ThemeData temaClaro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        elevation: 8,
        shadowColor: Colors.deepPurple.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[200],
    ),
  );

  static final ThemeData temaOscuro = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.deepPurple,
        elevation: 8,
        shadowColor: Colors.deepPurple.withOpacity(0.5),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: const BorderSide(color: Colors.deepPurple, width: 2),
      ),
      filled: true,
      fillColor: Colors.grey[800],
    ),
  );
}

