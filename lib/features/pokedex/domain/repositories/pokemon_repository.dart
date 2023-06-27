import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons(
      {required int limit, required int page});

  Future<PokemonDetailsEntity> getPokemonDetailsById({required int index});

  Future<List<TypeEntity>> getTypes({required int limit, required int page});

  Future<List<PokemonEntity>> GetPokemonsByNameAndTypes(
      {required String name, required List<TypeEntity> types});
}
