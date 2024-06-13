import 'package:flutter/material.dart';
import 'package:flutter_attempt_01/notes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorScheme = ColorScheme.fromSeed(seedColor: Colors.indigo);
void main() {
  
  runApp(
    ProviderScope(child: MaterialApp(
    theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: const Color.fromARGB(255, 6, 212, 239),
          foregroundColor: Colors.white,
        ),
        cardTheme: CardTheme(
          margin: const EdgeInsets.all(5),
          color: colorScheme.onPrimary,
        )),
    home: const notes(),
  ))
    );
}
