// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PokemonsByType {
  final int id;
  final List<PokemonElement> pokemon;

  PokemonsByType({
    required this.id,
    required this.pokemon,
  });

  PokemonsByType copyWith({
    int? id,
    List<PokemonElement>? pokemon,
  }) =>
      PokemonsByType(
        id: id ?? this.id,
        pokemon: pokemon ?? this.pokemon,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pokemon': pokemon.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonsByType.fromMap(Map<String, dynamic> map) {
    return PokemonsByType(
      id: map['id'] as int,
      pokemon: (map['pokemon'] as List)
          .map<PokemonElement>(
            (x) => PokemonElement.fromMap(x as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonsByType.fromJson(String source) =>
      PokemonsByType.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PokemonElement {
  final PokemonPokemon pokemon;

  PokemonElement({
    required this.pokemon,
  });

  PokemonElement copyWith({
    PokemonPokemon? pokemon,
  }) =>
      PokemonElement(
        pokemon: pokemon ?? this.pokemon,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pokemon': pokemon.toMap(),
    };
  }

  factory PokemonElement.fromMap(Map<String, dynamic> map) {
    return PokemonElement(
      pokemon: PokemonPokemon.fromMap(map['pokemon'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonElement.fromJson(String source) =>
      PokemonElement.fromMap(json.decode(source) as Map<String, dynamic>);
}

class PokemonPokemon {
  final String name;
  final String url;

  PokemonPokemon({
    required this.name,
    required this.url,
  });

  PokemonPokemon copyWith({
    String? name,
    String? url,
  }) =>
      PokemonPokemon(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory PokemonPokemon.fromMap(Map<String, dynamic> map) {
    return PokemonPokemon(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonPokemon.fromJson(String source) =>
      PokemonPokemon.fromMap(json.decode(source) as Map<String, dynamic>);
}
