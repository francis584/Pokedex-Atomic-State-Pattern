// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonEntity {
  final int id;
  final String name;
  final String image;
  final List<String> type;
  // final String num;
  PokemonEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    // required this.num,
  });
}
