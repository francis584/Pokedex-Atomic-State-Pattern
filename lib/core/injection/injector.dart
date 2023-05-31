import 'package:auto_injector/auto_injector.dart';
import 'package:uno/uno.dart';

import 'package:pokedex_egsys/core/constants/api_constants.dart';
import 'package:pokedex_egsys/features/pokedex/infra/repositories/pokemon_repository_impl.dart';

final autoInjector = AutoInjector();
setupInjector() {
  autoInjector.add(() => Uno(baseURL: apiURL));
  autoInjector.add(PokemonRepositoryImpl.new);

  autoInjector.commit();
}
