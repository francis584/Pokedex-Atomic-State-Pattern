// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uno/uno.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_egsys/features/pokedex/infra/repositories/pokemon_repository_impl.dart';

import '../../fixtures/detail_fixtures.dart';
import '../../fixtures/home_fixtures.dart';

class MockUno extends Mock implements Uno {
  @override
  String get baseURL => "https://pokeapi.co/api/v2";
}

class MockResponse extends Mock implements Response {
  dynamic data;
  MockResponse({
    required this.data,
  });
}

void main() {
  late PokemonRepository pokemonRepository;
  late Uno uno;

  setUp(() {
    uno = MockUno();
    pokemonRepository = PokemonRepositoryImpl(uno: uno);
  });

  tearDown(() {});

  group('pokemon repository', () {
    group('getPokemons', () {
      test('should return a list<PokemonEntity>', () async {
        // ARRANGE
        when(() => uno.get(
                  '/pokemon',
                  params: {'offset': '0', 'limit': '20'},
                ))
            .thenAnswer((invocation) async =>
                MockResponse(data: HomeFixtures.jsonGetPokemons));
        when(() => uno.get(
                  '/pokemon/1/',
                ))
            .thenAnswer((invocation) async =>
                MockResponse(data: HomeFixtures.mockPokemonMap));
        // ACT
        var pokemons = await pokemonRepository.getPokemons(limit: 20, page: 1);

        // ASSERT
        expect(pokemons, isA<List<PokemonEntity>>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => uno.get(
                  '/pokemon',
                  params: {'offset': '0', 'limit': '20'},
                ))
            .thenThrow(Failure(
                message: 'Não foi possível carregar a lista de pokemons'));
        // when(() => uno.get(
        //           '/pokemon/1/',
        //         ))
        //     .thenAnswer((invocation) async =>
        //         MockResponse(data: HomeFixtures.mockPokemonMap));
        // ACT
        var pokemons = pokemonRepository.getPokemons(limit: 20, page: 1);

        // ASSERT
        await expectLater(
            pokemons,
            throwsA(predicate<Failure>((p0) =>
                p0.message ==
                'Não foi possível carregar a lista de pokemons')));
      });
    });

    group('getPokemonDetailsById', () {
      test('should return a PokemonEntity', () async {
        // ARRANGE
        when(() => uno.get('/pokemon/${1}')).thenAnswer((invocation) async =>
            MockResponse(data: DetailFixtures.jsonGetPokemonById));
        when(() => uno.get('/pokemon-species/${1}')).thenAnswer(
            (invocation) async =>
                MockResponse(data: DetailFixtures.jsonGetPokemonSpeciesId));

        // ACT
        var pokemon = await pokemonRepository.getPokemonDetailsById(index: 1);

        // ASSERT
        expect(pokemon, isA<PokemonDetailsEntity>());
        expect(pokemon.id, 1);
        expect(pokemon.genderRate, 1);
        expect(pokemon.growthRate, 'Medium-slow');
        expect(pokemon.height, 7);
        expect(pokemon.weight, 69);
        expect(pokemon.shape, 'Quadruped');
        expect(pokemon.abilities.first, 'Overgrow');
        expect(pokemon.eggGroups.first, 'Monster');
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => uno.get('/pokemon/${1}')).thenThrow(Failure(
            message: 'Não foi possível carregar os detalhes do pokemon'));

        // ACT
        var pokemon = pokemonRepository.getPokemonDetailsById(index: 1);

        // ASSERT
        await expectLater(
            pokemon,
            throwsA(predicate<Failure>((p0) =>
                p0.message ==
                'Não foi possível carregar os detalhes do pokemon')));
      });
    });

    group('getTypes', () {
      test('should return a List<TypeEntity>', () async {
        // ARRANGE
        when(() => uno.get(
                  '/type',
                  params: {'offset': '0', 'limit': '20'},
                ))
            .thenAnswer((invocation) async =>
                MockResponse(data: HomeFixtures.jsonGetTypes));

        // ACT
        var typesList = await pokemonRepository.getTypes(limit: 20, page: 1);

        // ASSERT
        expect(typesList, isA<List<TypeEntity>>());
      });
      test('should return a Failure when get error', () async {
        // ARRANGE
        when(() => uno.get(
                  '/type',
                  params: {'offset': '0', 'limit': '20'},
                ))
            .thenThrow(
                Failure(message: 'Não foi possível carregar a lista de tipos'));

        // ACT
        var typesList = pokemonRepository.getTypes(limit: 20, page: 1);

        // ASSERT
        await expectLater(
            typesList,
            throwsA(predicate<Failure>((p0) =>
                p0.message == 'Não foi possível carregar a lista de tipos')));
      });
    });

    group('getPokemonsByNameAndTypes', () {
      test('should return a List<PokemonEntity> when only the name is passed',
          () async {
        // ARRANGE
        when(() => uno.get(
                  '/pokemon',
                  params: {'offset': '0', 'limit': '10000'},
                ))
            .thenAnswer((invocation) async =>
                MockResponse(data: HomeFixtures.jsonGetPokemons));
        when(() => uno.get('/pokemon/1/')).thenAnswer((invocation) async =>
            MockResponse(data: HomeFixtures.mockPokemonMap));

        // ACT
        var pokemonList = await pokemonRepository
            .getPokemonsByNameAndTypes(name: 'bulba', types: []);

        // ASSERT
        expect(pokemonList, isA<List<PokemonEntity>>());
      });
      test('should return a List<PokemonEntity> when only the type is passed',
          () async {
        // ARRANGE
        when(() => uno.get(
                '/type/${HomeFixtures.typeEntitiesList.first.name.toLowerCase()}'))
            .thenAnswer((invocation) async =>
                MockResponse(data: HomeFixtures.jsonFightingPokemons));
        when(() => uno.get('/pokemon/1/')).thenAnswer((invocation) async =>
            MockResponse(data: HomeFixtures.mockPokemonMap));

        // ACT
        var pokemonList = await pokemonRepository.getPokemonsByNameAndTypes(
            name: '', types: [HomeFixtures.typeEntitiesList.first]);

        // ASSERT
        expect(pokemonList, isA<List<PokemonEntity>>());
      });
      test('should return a Failure when get UnoError', () async {
        // ARRANGE
        when(() => uno.get(
                '/type/${HomeFixtures.typeEntitiesList.first.name.toLowerCase()}'))
            .thenThrow(UnoError('Conection timeout'));

        // ACT
        var pokemonList = pokemonRepository.getPokemonsByNameAndTypes(
            name: '', types: [HomeFixtures.typeEntitiesList.first]);

        // ASSERT
        await expectLater(
            pokemonList,
            throwsA(
                predicate<Failure>((p0) => p0.message == 'Conection timeout')));
      });
      test('should return a Failure when get unknown error', () async {
        // ARRANGE
        when(() => uno.get(
                '/type/${HomeFixtures.typeEntitiesList.first.name.toLowerCase()}'))
            .thenThrow(Exception('certificate error'));

        // ACT
        var pokemonList = pokemonRepository.getPokemonsByNameAndTypes(
            name: '', types: [HomeFixtures.typeEntitiesList.first]);

        // ASSERT
        await expectLater(
            pokemonList,
            throwsA(predicate<Failure>((p0) =>
                p0.message ==
                'Não foi possível carregar a lista de pokemons')));
      });
    });
  });
}
