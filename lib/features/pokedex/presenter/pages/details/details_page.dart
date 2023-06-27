import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import 'package:pokedex_egsys/core/utils/mappers/color_to_type_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/details_atom.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/about_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/base_stats_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/error_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/type_widget.dart';

class DetailsPage extends StatefulWidget {
  final PokemonEntity pokemonEntity;
  const DetailsPage({
    Key? key,
    required this.pokemonEntity,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late final _pageController;
  late final _tabController;
  @override
  void initState() {
    super.initState();
    var index = homePokemonsList
        .indexWhere((element) => element.id == widget.pokemonEntity.id);
    _pageController = PageController(initialPage: index);
    _tabController = TabController(length: 2, vsync: this);
    fetchDetailsById.setValue(widget.pokemonEntity.id);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.select(() => [
          detailsPokemonSelected,
          detailsPokemonDetailsSelected,
          detailsError,
          detailsLoading
        ]);
    final typeToColorMapper = TypeToColorMapper();
    final _colorSelected =
        typeToColorMapper(detailsPokemonSelected.value!.types[0].name)
            .withOpacity(0.8);
    final _colorTabSelected =
        typeToColorMapper(detailsPokemonSelected.value!.types[0].name);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
        ],
      ),
      backgroundColor: _colorSelected,
      body: Stack(
        children: [
          Positioned(
              top: 100,
              right: -20,
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 200,
                width: 200,
                color: Colors.white12,
              )),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            builder: (context, scrollController) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Container(
              child: PageView.builder(
                itemCount: homePokemonsList.length,
                controller: _pageController,
                onPageChanged: (value) {
                  final pokemon = homePokemonsList[value];
                  if (!homeSearchActive.value &&
                      value == (homePokemonsList.length - 3)) {
                    fetchMore();
                  }

                  detailsPokemonSelected.setValue(pokemon);
                  fetchDetailsById.setValue(pokemon.id);
                },
                itemBuilder: (context, index) {
                  final pokemon = homePokemonsList[index];

                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Opacity(
                              opacity: 1,
                              child: Text(
                                pokemon.name,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 32,
                                    color: Colors.white),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  '#${pokemon.id.toString().padLeft(3, '0')}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: pokemon.types
                                  .map((type) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 4),
                                        child: TypeWidget(name: type.name),
                                      ))
                                  .toList(),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: Container(
                          height: 220,
                          child: pokemon.image.contains('assets')
                              ? SvgPicture.asset(
                                  pokemon.image,
                                  semanticsLabel: pokemon.name,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.contain,
                                )
                              : SvgPicture.network(
                                  pokemon.image,
                                  semanticsLabel: pokemon.name,
                                  width: 200,
                                  height: 200,
                                  fit: BoxFit.contain,
                                  placeholderBuilder: (context) => Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Shimmer.fromColors(
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            width: 100,
                                            height: 100,
                                          ),
                                          baseColor:
                                              Colors.white.withOpacity(0.4),
                                          highlightColor: Colors.grey[300]!)),
                                ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Container(
                  child: TabBar(
                      indicatorColor: _colorTabSelected,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.black38,
                      controller: _tabController,
                      tabs: [
                        Tab(
                          child: Text(
                            'About',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Base Stats',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                            maxLines: 1,
                            softWrap: false,
                          ),
                        ),
                      ]),
                ),
              ),
              Expanded(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: TabBarView(controller: _tabController, children: [
                      detailsError.value.isNotEmpty
                          ? DetailsErrorWidget(message: detailsError.value)
                          : AboutWidget(
                              loading: detailsLoading.value,
                              pokemonDetailsEntity:
                                  detailsPokemonDetailsSelected.value,
                            ),
                      detailsError.value.isNotEmpty
                          ? DetailsErrorWidget(message: detailsError.value)
                          : BaseStatsWidget(
                              loading: detailsLoading.value,
                              pokemonDetailsEntity:
                                  detailsPokemonDetailsSelected.value,
                            ),
                    ]),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
