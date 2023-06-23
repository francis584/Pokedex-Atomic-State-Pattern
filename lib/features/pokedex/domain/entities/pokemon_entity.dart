import 'package:pokedex_egsys/features/pokedex/domain/entities/type_entity.dart';

class PokemonEntity {
  final int id;
  final String name;
  final String image;
  final List<TypeEntity> types;
  PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.types,
  });
}
