import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import 'package:pokedex_egsys/core/utils/mappers/color_to_type_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/details_atom.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/home/widgets/type_widget.dart';

class PokemonItemWidget extends StatelessWidget {
  final PokemonEntity pokemonEntity;
  const PokemonItemWidget({super.key, required this.pokemonEntity});

  @override
  Widget build(BuildContext context) {
    final typeToColorMapper = TypeToColorMapper();

    return GestureDetector(
      onTap: () {
        detailsPokemonSelected.setValue(pokemonEntity);
        context.push('/details', extra: pokemonEntity);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                color: typeToColorMapper(pokemonEntity.types[0].name)
                    .withOpacity(0.8),
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
                        children: pokemonEntity.types
                            .map((type) => TypeWidget(name: type.name))
                            .toList(),
                      ),
                      Expanded(
                          child: Container(
                        width: 100,
                        height: 70,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            left: 48,
            child: pokemonEntity.image.contains('assets')
                ? SvgPicture.asset(
                    pokemonEntity.image,
                    semanticsLabel: pokemonEntity.name,
                    width: 110,
                    height: 110,
                    fit: BoxFit.contain,
                    // ignore: deprecated_member_use
                    color: Colors.white,
                  )
                : SvgPicture.network(
                    pokemonEntity.image,
                    semanticsLabel: pokemonEntity.name,
                    width: 110,
                    height: 110,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => Padding(
                        padding: const EdgeInsets.all(4.0),
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
      ),
    );
  }
}
