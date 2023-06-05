import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';

import 'package:pokedex_egsys/core/utils/mappers/color_to_type_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  PokemonItemWidget({super.key, required this.pokemonEntity});
  final typeToColorMapper = TypeToColorMapper();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              color: typeToColorMapper(pokemonEntity.type[0]).withOpacity(0.8),
              borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        pokemonEntity.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      pokemonEntity.id.toString().padLeft(3, '0'),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: pokemonEntity.type
                          .map((e) => TypeWidget(name: e))
                          .toList(),
                    ),
                    Flexible(
                        child: Container(
                      width: 100,
                      height: 100,
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 12,
          right: 8,
          left: 48,
          child: pokemonEntity.image.contains('assets')
              ? SvgPicture.asset(
                  pokemonEntity.image,
                  semanticsLabel: pokemonEntity.name,
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                  color: Colors.white,
                )
              : SvgPicture.network(
                  pokemonEntity.image,
                  semanticsLabel: pokemonEntity.name,
                  width: 110,
                  height: 110,
                  fit: BoxFit.contain,
                  placeholderBuilder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Shimmer.fromColors(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(16)),
                            width: 100,
                            height: 100,
                          ),
                          baseColor: Colors.white.withOpacity(0.4),
                          highlightColor: Colors.grey[300]!)),
                ),
        ),
      ],
    );
  }
}
