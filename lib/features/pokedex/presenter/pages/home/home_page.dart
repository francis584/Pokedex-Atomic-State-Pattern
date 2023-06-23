import 'package:flutter/material.dart';

import 'package:asp/asp.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_error.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_loading.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/pokemon_item_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/search_pokemon_by_name_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/types_choice_chips_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController scrollController = ScrollController();
  final TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initialfetch();
    fetchTypes();

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

  _openSearchMenu(BuildContext context) {
    showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        useSafeArea: true,
        showDragHandle: true,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        )),
        builder: (context) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.viewInsetsOf(context).bottom),
              child: Wrap(
                children: [
                  SearchPokemonByNameWidget(
                      textEditingController: textEditingController),
                  TypesChoiceChipsWidget(),
                  Padding(
                    padding: const EdgeInsets.all(24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () {},
                            child: Text('Limpar'),
                            style: ButtonStyle(),
                          ),
                        ),
                        SizedBox(width: 24),
                        Expanded(
                            child: ElevatedButton(
                                onPressed: () {}, child: Text('Buscar'))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [
          homeLoading,
          homePokemonsListFinished,
          homeError,
          homePokemonsList,
        ]);

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
              style: TextStyle(
                  color: Colors.black, fontSize: 32, fontFamily: 'Pocket_Monk'),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                  onPressed: () => _openSearchMenu(context),
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
                        physics: BouncingScrollPhysics(),
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
