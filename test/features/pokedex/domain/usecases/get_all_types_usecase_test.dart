import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_types_usecase.dart';

import '../../fixtures/home_fixtures.dart';

class MockPokemonRepository extends Mock implements PokemonRepository {}

void main() {
  late PokemonRepository pokemonRepository;
  late GetAllTypesUsecase getAllTypesUsecase;

  setUp(() {
    pokemonRepository = MockPokemonRepository();
    getAllTypesUsecase =
        GetAllTypesUsecase(pokemonRepository: pokemonRepository);
  });

  group('get all types of pokemons usecase', () {
    group('getTypes', () {
      test('should return a list<TypeEntity>', () async {
        // ARRANGE
        when(() => pokemonRepository.getTypes(limit: 20, page: 1))
            .thenAnswer((invocation) async => HomeFixtures.typeEntitiesList);

        // ACT
        var typesEntityList =
            await getAllTypesUsecase(GetTypesParams(limit: 20, page: 1));

        // ASSERT
        expect(typesEntityList, isA<List<TypeEntity>>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => pokemonRepository.getTypes(limit: 20, page: 1)).thenThrow(
            Failure(message: 'Não foi possível carregar a lista de tipos'));

        // ACT
        var typesEntityList =
            getAllTypesUsecase(GetTypesParams(limit: 20, page: 1));

        // ASSERT
        await expectLater(
            typesEntityList,
            throwsA(predicate<Failure>((p0) =>
                p0.message == 'Não foi possível carregar a lista de tipos')));
      });
    });
  });
}
