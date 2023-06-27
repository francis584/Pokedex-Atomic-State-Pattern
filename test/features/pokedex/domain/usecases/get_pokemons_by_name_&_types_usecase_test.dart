import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_pokemons_by_name_&_types_usecase.dart';

import '../../fixtures/home_fixtures.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late GetPokemonsByNameAndTypesUsecase getPokemonsByNameAndTypesUsecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    getPokemonsByNameAndTypesUsecase =
        GetPokemonsByNameAndTypesUsecase(pokemonRepository: pokemonRepository);
  });

  group('get pokemons by name and Types usecase', () {
    group('getPokemons', () {
      test('should return a list<PokemonEntity>', () async {
        // ARRANGE
        when(() => pokemonRepository
                .getPokemonsByNameAndTypes(name: 'pid', types: []))
            .thenAnswer((_) async => HomeFixtures.pokemonEntitiesList);

        // ACT
        var pokemonsEntityList = await getPokemonsByNameAndTypesUsecase(
            GetPokemonsByNameAndTypesParams(name: 'pid', types: []));

        // ASSERT
        expect(pokemonsEntityList, isA<List<PokemonEntity>>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() =>
            pokemonRepository
                .getPokemonsByNameAndTypes(name: 'pid', types: [])).thenThrow(
            Failure(message: 'Não foi possível carregar a lista de pokemons'));

        // ACT
        var pokemonsEntityList = getPokemonsByNameAndTypesUsecase(
            GetPokemonsByNameAndTypesParams(name: 'pid', types: []));

        // ASSERT
        await expectLater(
            pokemonsEntityList,
            throwsA(predicate<Failure>((p0) =>
                p0.message ==
                'Não foi possível carregar a lista de pokemons')));
      });
    });
  });
}
