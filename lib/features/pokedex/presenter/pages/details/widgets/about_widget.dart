import 'package:flutter/material.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doc_widget/doc_widget.dart';

import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/shimmer_widget.dart';

@docWidget
class AboutWidget extends StatelessWidget {
  final PokemonDetailsEntity? pokemonDetailsEntity;
  final bool loading;
  const AboutWidget({
    Key? key,
    required this.pokemonDetailsEntity,
    required this.loading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Shape',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Height',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Weight',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Abilities',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${pokemonDetailsEntity?.shape}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${(pokemonDetailsEntity!.height / 10)} m (${(pokemonDetailsEntity!.height * 10)} cm)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${(pokemonDetailsEntity!.weight / 10)} kg',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${pokemonDetailsEntity?.abilities.first}, ${pokemonDetailsEntity?.abilities.last}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 24, left: 8),
              child: loading
                  ? ShimmerWidget(width: 100)
                  : Text(
                      'Breeding',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 16, bottom: 8),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Egg Groups',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                  child: loading
                      ? ShimmerWidget(width: 60)
                      : Text(
                          'Growth Rate',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black38,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12, top: 16, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Row(
                            children: [
                              Icon(
                                Icons.male,
                                color: Colors.blue,
                                size: 16,
                              ),
                              Text(
                                '${(100 - ((pokemonDetailsEntity!.genderRate * 100) / 8))}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 24),
                              Icon(
                                Icons.female,
                                color: Colors.deepOrange,
                                size: 16,
                              ),
                              Text(
                                '${((pokemonDetailsEntity!.genderRate * 100) / 8)}%',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${pokemonDetailsEntity?.eggGroups.first}, ${pokemonDetailsEntity?.eggGroups.last}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: loading
                        ? ShimmerWidget(width: 100)
                        : Text(
                            '${pokemonDetailsEntity?.growthRate}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
