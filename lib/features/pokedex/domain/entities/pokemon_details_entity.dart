class PokemonDetailsEntity {
  final int id;
  final String shape;
  final int height;
  final int weight;
  final List<String> abilities;

  final int genderRate;
  final List<String> eggGroups;
  final String growthRate;

  final Map<String, int> stats;

  PokemonDetailsEntity({
    required this.id,
    required this.shape,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.genderRate,
    required this.eggGroups,
    required this.growthRate,
    required this.stats,
  });
}
