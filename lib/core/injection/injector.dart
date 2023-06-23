import 'package:auto_injector/auto_injector.dart';
import 'package:uno/uno.dart';

import 'package:pokedex_egsys/core/constants/api_constants.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_all_pokemons_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_pokemon_details_by_id_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/infra/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/reducers/details_reducer.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/reducers/home_reducer.dart';

final autoInjector = AutoInjector();
setupInjector() {
  autoInjector.addInstance(Uno(baseURL: apiURL));
  autoInjector.add(PokemonRepositoryImpl.new);
  autoInjector.add(() => GetAllPokemonsUsecase(
      pokemonRepository: autoInjector<PokemonRepositoryImpl>()));
  autoInjector.add(() => GetPokemonDetailsByIdUsecase(
      pokemonRepository: autoInjector<PokemonRepositoryImpl>()));
  autoInjector.addSingleton(HomeReducer.new);
  autoInjector.addSingleton(DetailsReducer.new);

  autoInjector.commit();
}
