import 'package:flutter/material.dart';

import 'package:pokedex_egsys/core/injection/injector.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/infra/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_error.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_loading.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PokemonEntity>>(
        future: autoInjector<PokemonRepositoryImpl>()
            .getPokemons(limit: 20, page: 1),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return HomeError(error: snapshot.error.toString());

          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData) {
            return Scaffold(
                body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: snapshot.data!
                      .map((e) => PokemonItemWidget(pokemonEntity: e))
                      .toList(),
                ),
              ),
            ));
          }

          return HomeLoading();
        });
  }
}
