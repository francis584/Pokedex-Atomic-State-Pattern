// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/details/widgets/shimmer_widget.dart';

class BaseStatsWidget extends StatelessWidget {
  final PokemonDetailsEntity? pokemonDetailsEntity;
  final bool loading;
  const BaseStatsWidget({
    Key? key,
    this.pokemonDetailsEntity,
    required this.loading,
  }) : super(key: key);

  MaterialColor _progressBarColor(double percent) {
    return percent < 50.0 ? Colors.deepOrange : Colors.lightGreen;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'HP',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Attack',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Defense',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Sp. Atk',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Sp. Def',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Speed',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 40)
                  : Text(
                      'Total',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black38,
                          fontWeight: FontWeight.bold),
                    ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['hp']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['attack']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['defense']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['special-attack']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['special-defense']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats['speed']}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: loading
                  ? ShimmerWidget(width: 20)
                  : Text(
                      '${pokemonDetailsEntity!.stats.values.reduce((previousValue, element) => previousValue + element)}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
            ),
          ],
        ),
        Column(
          children: [
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(
                            pokemonDetailsEntity!.stats['hp']!.toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value: (pokemonDetailsEntity!.stats['hp']!.toDouble() /
                            100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(
                            pokemonDetailsEntity!.stats['attack']!.toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value:
                            (pokemonDetailsEntity!.stats['attack']!.toDouble() /
                                100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(
                            pokemonDetailsEntity!.stats['defense']!.toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value: (pokemonDetailsEntity!.stats['defense']!
                                .toDouble() /
                            100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(pokemonDetailsEntity!
                            .stats['special-attack']!
                            .toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value: (pokemonDetailsEntity!.stats['special-attack']!
                                .toDouble() /
                            100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(pokemonDetailsEntity!
                            .stats['special-defense']!
                            .toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value: (pokemonDetailsEntity!.stats['special-defense']!
                                .toDouble() /
                            100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(
                            pokemonDetailsEntity!.stats['speed']!.toDouble()),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value:
                            (pokemonDetailsEntity!.stats['speed']!.toDouble() /
                                100),
                      ),
                    ),
                  ),
            loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShimmerWidget(width: 180),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 13),
                    child: SizedBox(
                      width: 180,
                      child: LinearProgressIndicator(
                        color: _progressBarColor(pokemonDetailsEntity!
                                .stats.values
                                .reduce((previousValue, element) =>
                                    previousValue + element)
                                .toDouble() /
                            6),
                        backgroundColor: Colors.black.withOpacity(0.05),
                        value: pokemonDetailsEntity!.stats.values
                                .reduce((previousValue, element) =>
                                    previousValue + element)
                                .toDouble() /
                            600,
                      ),
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
