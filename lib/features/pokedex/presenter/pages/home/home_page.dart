import 'package:flutter/material.dart';

import 'package:asp/asp.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_error.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_loading.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/pokemon_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    initialfetch();

    scrollController.addListener(() {
      if (!homePokemonsListFinished.value &&
          scrollController.position.pixels >=
              (scrollController.position.maxScrollExtent * 0.8)) {
        fetchMore();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  mostrarToast(String texto) => Fluttertoast.showToast(
        msg: texto,
        backgroundColor: Colors.grey[300],
        textColor: Colors.black,
        fontSize: 18,
        toastLength: Toast.LENGTH_LONG,
      );

  @override
  Widget build(BuildContext context) {
    context.select(() =>
        [homeLoading, homePokemonsListFinished, homeError, homePokemonsList]);

    if (homePokemonsListFinished.value) mostrarToast('Sem mais resultados');

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              'Pokedex',
              style: TextStyle(color: Colors.black, fontSize: 26),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
            )
          ],
        ),
        body: SafeArea(
          child: RefreshIndicator.adaptive(
            onRefresh: () async => initialfetch(),
            child: homeError.value.isNotEmpty
                ? SingleChildScrollView(
                    child: HomeError(error: homeError.value))
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: GridView.count(
                        controller: scrollController,
                        crossAxisCount: 2,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        children: [
                          ...homePokemonsList
                              .map((e) => PokemonItemWidget(pokemonEntity: e))
                              .toList(),
                          if (homeLoading.value)
                            ...List.generate(8, (index) => HomeLoading()),
                        ]),
                  ),
          ),
        ));
  }
}
