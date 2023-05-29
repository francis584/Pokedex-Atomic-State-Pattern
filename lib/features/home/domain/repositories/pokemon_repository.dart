import 'package:pokedex_egsys/features/home/domain/entities/pokemon_entity.dart';

abstract class PokemonRepository {
  Future<List<PokemonEntity>> getPokemons(
      {required int limit, required int page});
}
