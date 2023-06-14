import 'package:uno/uno.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/pokedex/infra/mappers/api_to_entity_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/infra/models/pokemon_details_model.dart';
import 'package:pokedex_egsys/features/pokedex/infra/models/pokemon_model.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final Uno uno;
  PokemonRepositoryImpl({
    required this.uno,
  });

  @override
  Future<List<PokemonEntity>> getPokemons(
      {int limit = 20, required int page}) async {
    try {
      final response = await uno.get(
        '/pokemon',
        params: {'offset': '${(page - 1) * limit}', 'limit': '$limit'},
      );

      final URLs = (response.data['results'] as List)
          .map((e) => (e['url'] as String).split(uno.baseURL).last)
          .toList();

      final pokemonsList = await Future.wait(URLs.map((url) async {
        final response = await uno.get('$url');

        return PokemonModel.fromMap(response.data).toEntity();
      }));

      return pokemonsList;
    } catch (e) {
      throw Failure(message: 'Não foi possível carregar a lista de pokemons');
    }
  }

  @override
  Future<PokemonDetailsEntity> getPokemonDetailsById(
      {required int index}) async {
    try {
      final pokemonResponse = await uno.get('/pokemon/$index');

      final pokemon = PokemonDetailsModel.fromMap(pokemonResponse.data);

      final pokemonSpeciesResponse = await uno.get('/pokemon-species/$index');

      final pokemonSpecies =
          PokemonDetailsModel.fromMap(pokemonSpeciesResponse.data);

      return pokemon
          .copyWith(
            genderRate: pokemonSpecies.genderRate,
            eggGroups: pokemonSpecies.eggGroups,
            growthRate: pokemonSpecies.growthRate,
            shape: pokemonSpecies.shape,
          )
          .toEntity();
    } catch (e) {
      throw Failure(
          message: 'Não foi possível carregar os detalhes do pokemon');
    }
  }
}
