import 'package:flutter/material.dart';

import 'package:asp/asp.dart';

import 'package:pokedex_egsys/core/injection/injector.dart';
import 'package:pokedex_egsys/core/routes/routes.dart';

void main() {
  setupInjector();
  runApp(RxRoot(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Pokedex egSYS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: false,
      ),
      routerDelegate: routes.routerDelegate,
      routeInformationParser: routes.routeInformationParser,
      routeInformationProvider: routes.routeInformationProvider,
    );
  }
}
