import 'package:flutter/material.dart';

import 'package:pokedex_egsys/core/injection/injector.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/home_page.dart';

void main() {
  setupInjector();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex egSYS',
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: false,
      ),
      home: HomePage(),
    );
  }
}
