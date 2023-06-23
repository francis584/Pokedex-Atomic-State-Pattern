// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:asp/asp.dart';

import 'package:pokedex_egsys/core/error/failure.dart';
import 'package:pokedex_egsys/features/pokedex/domain/usecases/get_pokemon_details_by_id_usecase.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/details_atom.dart';

class DetailsReducer extends Reducer {
  final GetPokemonDetailsByIdUsecase getPokemonDetailsByIdUsecase;

  DetailsReducer(
    this.getPokemonDetailsByIdUsecase,
  ) {
    on(() => [fetchDetailsById], _fetchDetailsById);
  }

  _fetchDetailsById() async {
    try {
      detailsLoading.setValue(true);
      detailsError.setValue('');
      final result =
          await getPokemonDetailsByIdUsecase(fetchDetailsById.value!);

      detailsPokemonDetailsSelected.setValue(result);
      detailsLoading.setValue(false);
    } on Failure catch (e) {
      detailsError.value = e.message!;
    }
  }
}
