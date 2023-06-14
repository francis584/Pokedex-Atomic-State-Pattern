import 'package:pokedex_egsys/core/utils/extensions/string_extension.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/infra/models/pokemon_details_model.dart';
import 'package:pokedex_egsys/features/pokedex/infra/models/pokemon_model.dart';

extension PokemonModelX on PokemonModel {
  PokemonEntity toEntity() => PokemonEntity(
      id: id,
      name: name.capitalize(),
      image:
          sprites.other!.dreamWorld!.frontDefault ?? 'assets/svg/not-found.svg',
      type: types.map((e) => e.type!.name!.capitalize()).toList());
}

extension PokemonDetailsModelX on PokemonDetailsModel {
  PokemonDetailsEntity toEntity() => PokemonDetailsEntity(
        id: id!,
        shape: shape!.name.capitalize(),
        height: height!,
        weight: weight!,
        abilities: abilities!.map((e) => e.ability.name.capitalize()).toList(),
        genderRate: genderRate!,
        eggGroups: eggGroups!.map((e) => e.name.capitalize()).toList(),
        growthRate: growthRate!.name.capitalize(),
        stats: Map<String, int>.fromIterable(
          stats!,
          key: (element) => element.stat.name.toLowerCase(),
          value: (element) => element.baseStat,
        ),
      );
}
