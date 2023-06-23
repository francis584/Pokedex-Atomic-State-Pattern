// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokedex_egsys/core/usecase/usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetPokemonDetailsByIdUsecase extends UseCase<PokemonDetailsEntity, int> {
  final PokemonRepository pokemonRepository;
  GetPokemonDetailsByIdUsecase({
    required this.pokemonRepository,
  });

  @override
  Future<PokemonDetailsEntity> call(int param) async {
    return pokemonRepository.getPokemonDetailsById(index: param);
  }
}
