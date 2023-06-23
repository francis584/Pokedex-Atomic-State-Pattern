// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:asp/asp.dart';

import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_pokemons_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_types_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';

class HomeReducer extends Reducer {
  final GetAllPokemonsUsecase getAllPokemonsUsecase;
  final GetAllTypesUsecase getAllTypesUsecase;

  HomeReducer(
    this.getAllPokemonsUsecase,
    this.getAllTypesUsecase,
  ) {
    on(() => [initialfetch], _initialfetch);
    on(() => [fetchMore], _fetchMore);
    on(() => [fetchTypes], _fetchTypes);
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
}
