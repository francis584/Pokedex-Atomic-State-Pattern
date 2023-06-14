import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/GetPokemonDetailsByIdUsecase.dart';

import '../../fixtures/detail_fixtures.dart';
import '../../fixtures/home_fixtures.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late GetPokemonDetailsByIdUsecase getPokemonDetailsByIdUsecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    getPokemonDetailsByIdUsecase =
        GetPokemonDetailsByIdUsecase(pokemonRepository: pokemonRepository);
  });

  group('get pokemon details by id usecase', () {
    group('getPokemonDetailsById', () {
      test('should return a PokemonDetailsEntity', () async {
        // ARRANGE
        when(() => pokemonRepository.getPokemonDetailsById(
                index: HomeFixtures.pokemonEntitiesList[0].id))
            .thenAnswer(
                (invocation) async => DetailFixtures.pokemonDetailsEntity);

        // ACT
        var pokemonDetailsEntity = await getPokemonDetailsByIdUsecase(
            HomeFixtures.pokemonEntitiesList[0].id);

        // ASSERT
        expect(pokemonDetailsEntity, isA<PokemonDetailsEntity>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => pokemonRepository.getPokemonDetailsById(
            index:
                HomeFixtures.pokemonEntitiesList[0].id)).thenThrow(Failure(
            message:
                'Não foi possível carregar os detalhes do pokemon selecionado'));

        // ACT
        var pokemonEntity = getPokemonDetailsByIdUsecase(
            HomeFixtures.pokemonEntitiesList[0].id);

        // ASSERT
        await expectLater(
            pokemonEntity,
            throwsA(predicate<Failure>((p0) =>
                p0.message ==
                'Não foi possível carregar os detalhes do pokemon selecionado')));
      });
    });
  });
}
