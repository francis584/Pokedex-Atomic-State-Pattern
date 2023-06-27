import 'package:flutter/material.dart';

import 'package:doc_widget/doc_widget.dart';

import 'package:pokedex_egsys/core/utils/mappers/color_to_type_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/about_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/about_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/base_stats_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/base_stats_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/error_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/error_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/shimmer_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/shimmer_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_error.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_error.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_loading.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/home_loading.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/pokemon_item_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/pokemon_item_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/search_pokemon_by_name_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/search_pokemon_by_name_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/type_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/type_widget.doc_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/types_choice_chips_widget.doc_widget.dart';

void main() {
  final homeError = ElementPreview(
    document: HomeErrorDocWidget(),
    previews: [
      WidgetPreview(
        widget: HomeError(error: 'Conteúdo não encontrado'),
        description: 'Widget demonstra erros inesperados na tela principal',
      ),
    ],
  );
  final homeLoading = ElementPreview(
    document: HomeLoadingDocWidget(),
    previews: [
      WidgetPreview(
        widget: GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [HomeLoading()]),
        description:
            'Monstra uma animação enquanto os dados não foram carregados da API.',
      ),
    ],
  );
  final pokemonItemWidget = ElementPreview(
    document: PokemonItemWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: GridView.count(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              PokemonItemWidget(
                  pokemonEntity: PokemonEntity(
                      id: 1,
                      name: 'Bulbasaur',
                      image:
                          "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
                      types: [
                    TypeEntity(name: 'grass'),
                    TypeEntity(name: 'poison')
                  ]))
            ]),
        description:
            'Monstra uma card com a imagem do pokémon, seu tipo com sua cor de fundo.',
      ),
    ],
  );
  final searchPokemonByNameWidget = ElementPreview(
    document: SearchPokemonByNameWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: Wrap(children: [
          SearchPokemonByNameWidget(
              textEditingController: TextEditingController())
        ]),
        description: 'Caixa de texto para pesquisa do pokemon pelo nome',
      ),
    ],
  );
  final typeWidget = ElementPreview(
    document: TypeWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget:
            Container(color: Colors.black54, child: TypeWidget(name: 'Grass')),
        description: 'Chip que informa o tipo do pokémon',
      ),
    ],
  );
  final typesChoiceChipsWidget = ElementPreview(
    document: TypesChoiceChipsWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Wrap(
              spacing: 12,
              runSpacing: 12,
              runAlignment: WrapAlignment.spaceEvenly,
              alignment: WrapAlignment.spaceEvenly,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ChoiceChip(
                  label: Text(
                    'Flying',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  selectedColor: TypeToColorMapper()('Flying'),
                  selected: true,
                ),
                ChoiceChip(
                  label: Text(
                    'Flying',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.normal),
                  ),
                  selectedColor: TypeToColorMapper()('Flying'),
                  selected: false,
                )
              ]),
        ),
        description:
            'Chip que informa o tipo do pokémon selecionado no menu de pesquisa.',
      ),
    ],
  );

  final aboutWidget = ElementPreview(
    document: AboutWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: AboutWidget(
            pokemonDetailsEntity: PokemonDetailsEntity(
                id: 1,
                shape: 'quadruped',
                height: 7,
                weight: 69,
                abilities: ['overgrow', 'chlorophyll'],
                genderRate: 1,
                eggGroups: ['Monster', 'Plant'],
                growthRate: 'medium-slow',
                stats: {
                  "hp": 45,
                  "attack": 49,
                  "defense": 49,
                  "special-attack": 65,
                  "special-defense": 65,
                  "speed": 45,
                }),
            loading: true),
        description: 'Efeito de carregamento dos dados da aba "About":',
      ),
      WidgetPreview(
        widget: AboutWidget(
            pokemonDetailsEntity: PokemonDetailsEntity(
                id: 1,
                shape: 'quadruped',
                height: 7,
                weight: 69,
                abilities: ['overgrow', 'chlorophyll'],
                genderRate: 1,
                eggGroups: ['Monster', 'Plant'],
                growthRate: 'medium-slow',
                stats: {
                  "hp": 45,
                  "attack": 49,
                  "defense": 49,
                  "special-attack": 65,
                  "special-defense": 65,
                  "speed": 45,
                }),
            loading: false),
        description: 'Aba "About" carregada:',
      ),
    ],
  );

  final baseStatsWidget = ElementPreview(
    document: BaseStatsWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: BaseStatsWidget(loading: true),
        description: 'Efeito de carregamento dos dados da aba "Stats":',
      ),
      WidgetPreview(
        widget: BaseStatsWidget(
            pokemonDetailsEntity: PokemonDetailsEntity(
                id: 1,
                shape: 'quadruped',
                height: 7,
                weight: 69,
                abilities: ['overgrow', 'chlorophyll'],
                genderRate: 1,
                eggGroups: ['Monster', 'Plant'],
                growthRate: 'medium-slow',
                stats: {
                  "hp": 45,
                  "attack": 49,
                  "defense": 49,
                  "special-attack": 65,
                  "special-defense": 65,
                  "speed": 45,
                }),
            loading: false),
        description: 'Aba "Stats" carregada:',
      ),
    ],
  );

  final errorWidget = ElementPreview(
    document: DetailsErrorWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: DetailsErrorWidget(message: 'Ocorreu um erro inesperado.'),
        description: 'Widget responsável por exibir um erro inesperado.',
      ),
    ],
  );

  final shimmerWidget = ElementPreview(
    document: ShimmerWidgetDocWidget(),
    previews: [
      WidgetPreview(
        widget: Wrap(
          spacing: 10,
          runAlignment: WrapAlignment.spaceAround,
          children: [
            ShimmerWidget(width: 60),
            ShimmerWidget(width: 100),
            ShimmerWidget(width: 40),
            ShimmerWidget(width: 20),
          ],
        ),
        description:
            'Widget usado na construção dos efeitos de carregamento, exibindo uma animação shimmer.',
      ),
    ],
  );

  // final detailsPage = ElementPreview(
  //   document: DetailsPageDocWidget(),
  //   previews: [
  //     WidgetPreview(
  //       widget: DetailsPage(
  //           pokemonEntity: PokemonEntity(
  //               id: 1,
  //               name: 'Bulbasaur',
  //               image:
  //                   "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg",
  //               types: [
  //             TypeEntity(name: 'grass'),
  //             TypeEntity(name: 'poison')
  //           ])),
  //       description: 'Tela de detalhes do pokémon',
  //     ),
  //   ],
  // );

  runApp(DocPreview(title: 'Pokédex Docs', sections: [
    ElementsSection(
      title: 'Home Page',
      elements: [
        homeError,
        homeLoading,
        pokemonItemWidget,
        searchPokemonByNameWidget,
        typeWidget,
        typesChoiceChipsWidget
      ],
    ),
    ElementsSection(
      title: 'Details Page',
      elements: [
        aboutWidget,
        baseStatsWidget,
        errorWidget,
        shimmerWidget,
      ],
    )
  ])); // Application that will show all elements.
}
