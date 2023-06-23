// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:pokedex_egsys/core/usecase/usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';

class GetTypesParams {
  final int page;
  final int limit;

  const GetTypesParams({
    required this.page,
    this.limit = 20,
  });
}

class GetAllTypesUsecase extends UseCase<List<TypeEntity>, GetTypesParams> {
  final PokemonRepository pokemonRepository;
  GetAllTypesUsecase({
    required this.pokemonRepository,
  });

  @override
  Future<List<TypeEntity>> call(GetTypesParams params) async {
    return pokemonRepository.getTypes(limit: params.limit, page: params.page);
  }
}
