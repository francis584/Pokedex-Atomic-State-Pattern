// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokedex_egsys/core/usecase/usecase.dart';
import 'package:pokedex_egsys/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/home/domain/repositories/pokemon_repository.dart';

class GetPokemonsParams {
  final int page;
  final int limit;

  const GetPokemonsParams({
    required this.page,
    required this.limit,
  });
}

class GetAllPokemonsUsecase
    extends UseCase<List<PokemonEntity>, GetPokemonsParams> {
  final PokemonRepository pokemonRepository;
  GetAllPokemonsUsecase({
    required this.pokemonRepository,
  });

  @override
  Future<List<PokemonEntity>> call(GetPokemonsParams params) async {
    return pokemonRepository.getPokemons(
        limit: params.limit, page: params.page);
  }
}
