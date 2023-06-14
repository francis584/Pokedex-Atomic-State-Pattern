import 'package:asp/asp.dart';

import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_details_entity.dart';
import 'package:pokedex_egsys/features/pokedex/domain/entities/pokemon_entity.dart';

// Atoms
final detailsPokemonSelected = Atom<PokemonEntity?>(null);
final detailsError = Atom<String>('');
final detailsLoading = Atom<bool>(false);
final detailsPokemonDetailsSelected = Atom<PokemonDetailsEntity?>(null);

// Actions
final fetchDetailsById = Atom<int?>(null);
