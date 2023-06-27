// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:asp/asp.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_pokemons_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_types_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_pokemons_by_name_&_types_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';

class HomeReducer extends Reducer {
  final GetAllPokemonsUsecase getAllPokemonsUsecase;
  final GetAllTypesUsecase getAllTypesUsecase;
  final GetPokemonsByNameAndTypesUsecase getPokemonsByNameAndTypesUsecase;

  HomeReducer(
    this.getAllPokemonsUsecase,
    this.getAllTypesUsecase,
    this.getPokemonsByNameAndTypesUsecase,
  ) {
    on(() => [initialfetch], _initialfetch);
    on(() => [fetchMore], _fetchMore);
    on(() => [fetchTypes], _fetchTypes);
    on(() => [filterPokemons], _filterPokemons);
    on(() => [clearSearch], _clearSearch);
  }

  _initialfetch() async {
    homeLoading.value = true;
    homePokemonsList.clear();
    homePageNumber.value = 1;
    homePokemonsListFinished.value = false;

    try {
      final result = await getAllPokemonsUsecase(
        GetPokemonsParams(
          page: homePageNumber.value,
        ),
      );

      homePokemonsList.addAll(result);
    } catch (e) {
      homeError.value = e.toString();
    }

    homeLoading.value = false;
  }

  _fetchMore() async {
    homeLoading.value = true;
    homePageNumber.value++;
    try {
      final result = await getAllPokemonsUsecase(
        GetPokemonsParams(
          page: homePageNumber.value,
        ),
      );

      if (result.isEmpty) {
        homePokemonsListFinished.value = true;
      } else {
        homePokemonsList.addAll(result);
      }
      homeLoading.value = false;
    } catch (e) {
      homeError.value = e.toString();
    }
  }

  _fetchTypes() async {
    homeLoading.value = true;

    try {
      final result = await getAllTypesUsecase(
        GetTypesParams(
          page: homePageNumber.value,
        ),
      );
      homeTypesMap.addAll(Map.fromIterable(
        result,
        key: (element) => element,
        value: (element) => false,
      ));
      // homeTypesList.addAll(result);
    } catch (e) {
      homeError.value = e.toString();
    }

    homeLoading.value = false;
  }

  _filterPokemons() async {
    homeLoading.value = true;
    homeSearchActive.value = true;
    homePokemonsList.clear();

    try {
      final List<TypeEntity> typesSelectedList = [];
      homeTypesMap.value.forEach((key, value) {
        if (value) typesSelectedList.add(key);
      });

      final result = await getPokemonsByNameAndTypesUsecase(
        GetPokemonsByNameAndTypesParams(
          name: homeSearchtextEditingController.value.text,
          types: typesSelectedList,
        ),
      );

      homePokemonsList.addAll(result);
      homePokemonsListFinished.value = true;
    } on Failure catch (e) {
      homeError.value = e.message!;
    } catch (e) {
      homeError.value = e.toString();
    }

    homeLoading.value = false;
  }

  void _clearSearch() {
    homeSearchtextEditingController.value.clear();
    homeTypesMap.values.forEach((element) => element = false);
    homeSearchActive.value = false;
    _initialfetch();
  }
}
