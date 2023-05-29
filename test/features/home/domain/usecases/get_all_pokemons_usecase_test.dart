import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/home/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/home/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/home/domain/usecases/get_all_pokemons_usecase.dart';

import '../../fixtures/home_fixtures.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late GetAllPokemonsUsecase getAllPokemonsUsecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    getAllPokemonsUsecase =
        GetAllPokemonsUsecase(pokemonRepository: pokemonRepository);
  });

  group('get all pokemons usecase', () {
    group('getPokemons', () {
      test('should return a list<PokemonEntity>', () async {
        // ARRANGE
        when(() => pokemonRepository.getPokemons(limit: 20, page: 1))
            .thenAnswer((invocation) async => HomeFixtures.pokemonEntitiesList);

        // ACT
        var pokemonsEntityList =
            await getAllPokemonsUsecase(GetPokemonsParams(limit: 20, page: 1));

        // ASSERT
        expect(pokemonsEntityList, isA<List<PokemonEntity>>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => pokemonRepository.getPokemons(limit: 20, page: 1)).thenThrow(
            Failure(message: 'Não foi possível carregar a lista de pokemons'));

        // ACT
        var pokemonsEntityList =
            getAllPokemonsUsecase(GetPokemonsParams(limit: 20, page: 1));

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
