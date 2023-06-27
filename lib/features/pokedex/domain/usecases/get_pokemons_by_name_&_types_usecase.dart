// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokedex_egsys/core/usecase/usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonsByNameAndTypesParams {
  final String name;
  final List<TypeEntity> types;

  const GetPokemonsByNameAndTypesParams({
    required this.name,
    required this.types,
  });
}

class GetPokemonsByNameAndTypesUsecase
    extends UseCase<List<PokemonEntity>, GetPokemonsByNameAndTypesParams> {
  final PokemonRepository pokemonRepository;
  GetPokemonsByNameAndTypesUsecase({
    required this.pokemonRepository,
  });

  @override
  Future<List<PokemonEntity>> call(
      GetPokemonsByNameAndTypesParams params) async {
    return pokemonRepository.getPokemonsByNameAndTypes(
        name: params.name, types: params.types);
  }
}
