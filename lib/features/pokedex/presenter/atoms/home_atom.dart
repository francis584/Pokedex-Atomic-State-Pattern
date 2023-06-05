import 'package:asp/asp.dart';

import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';

// Atoms
final homeLoading = Atom(false);
final homePokemonsListFinished = Atom(false);
final homeError = Atom<String>('');
final homePageNumber = Atom(1);
final homePokemonsList = RxList<PokemonEntity>([]);

// Actions
final initialfetch = Atom.action();
final fetchMore = Atom.action();
