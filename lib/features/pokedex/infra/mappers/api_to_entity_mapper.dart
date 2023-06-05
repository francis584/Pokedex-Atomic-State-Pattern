import 'package:pokedex_egsys/core/utils/extensions/string_extension.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/infra/models/pokemon_model.dart';

extension PokemonModelX on PokemonModel {
  PokemonEntity toEntity() => PokemonEntity(
      id: id,
      name: name,
      image:
          sprites.other!.dreamWorld!.frontDefault ?? 'assets/svg/not-found.svg',
      type: types.map((e) => e.type!.name!.capitalize()).toList());
}
