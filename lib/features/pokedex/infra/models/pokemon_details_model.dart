import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PokemonDetailsModel extends Equatable {
  final int? id;
  final String? name;
  final int? height;
  final int? weight;
  final List<Ability>? abilities;
  final List<Stat>? stats;
  final int? genderRate;
  final GrowthRate? growthRate;
  final List<GrowthRate>? eggGroups;
  final Shape? shape;

  PokemonDetailsModel({
    required this.id,
    required this.name,
    required this.height,
    required this.weight,
    required this.abilities,
    required this.stats,
    required this.genderRate,
    required this.growthRate,
    required this.eggGroups,
    required this.shape,
  });

  PokemonDetailsModel copyWith({
    int? id,
    String? name,
    int? height,
    int? weight,
    List<Ability>? abilities,
    List<Stat>? stats,
    int? genderRate,
    GrowthRate? growthRate,
    List<GrowthRate>? eggGroups,
    Shape? shape,
  }) {
    return PokemonDetailsModel(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      abilities: abilities ?? this.abilities,
      stats: stats ?? this.stats,
      genderRate: genderRate ?? this.genderRate,
      growthRate: growthRate ?? this.growthRate,
      eggGroups: eggGroups ?? this.eggGroups,
      shape: shape ?? this.shape,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      height,
      weight,
      abilities,
      stats,
      genderRate,
      growthRate,
      eggGroups,
      shape,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'height': height,
      'weight': weight,
      'abilities': abilities?.map((x) => x.toMap()).toList(),
      'stats': stats?.map((x) => x.toMap()).toList(),
      'genderRate': genderRate,
      'growthRate': growthRate?.toMap(),
      'eggGroups': eggGroups?.map((x) => x.toMap()).toList(),
      'shape': shape?.toMap(),
    };
  }

  factory PokemonDetailsModel.fromMap(Map<String, dynamic> map) {
    return PokemonDetailsModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      height: map['height'] != null ? map['height'] as int : null,
      weight: map['weight'] != null ? map['weight'] as int : null,
      abilities: map['abilities'] != null
          ? List<Ability>.from(
              (map['abilities'] as List<dynamic>).map<Ability?>(
                (x) => Ability.fromMap(x),
              ),
            )
          : null,
      stats: map['stats'] != null
          ? List<Stat>.from(
              (map['stats'] as List<dynamic>).map<Stat?>(
                (x) => Stat.fromMap(x),
              ),
            )
          : null,
      genderRate: map['gender_rate'] != null ? map['gender_rate'] as int : null,
      growthRate: map['growth_rate'] != null
          ? GrowthRate.fromMap(map['growth_rate'] as Map<String, dynamic>)
          : null,
      eggGroups: map['egg_groups'] != null
          ? List<GrowthRate>.from(
              (map['egg_groups'] as List<dynamic>).map<GrowthRate?>(
                (x) => GrowthRate.fromMap(x),
              ),
            )
          : null,
      shape: map['shape'] != null
          ? Shape.fromMap(map['shape'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PokemonDetailsModel.fromJson(String source) =>
      PokemonDetailsModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Ability {
  final Species ability;

  Ability({
    required this.ability,
  });

  Ability copyWith({
    bool? isHidden,
    int? slot,
    Species? ability,
  }) =>
      Ability(
        ability: ability ?? this.ability,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ability': ability.toMap(),
    };
  }

  factory Ability.fromMap(Map<String, dynamic> map) {
    return Ability(
      ability: Species.fromMap(map['ability'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Ability.fromJson(String source) =>
      Ability.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Species {
  final String name;

  Species({
    required this.name,
  });

  Species copyWith({
    String? name,
    String? url,
  }) =>
      Species(
        name: name ?? this.name,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Species.fromMap(Map<String, dynamic> map) {
    return Species(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Species.fromJson(String source) =>
      Species.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Stat {
  final int baseStat;
  final Species stat;

  Stat({
    required this.baseStat,
    required this.stat,
  });

  Stat copyWith({
    int? baseStat,
    Species? stat,
  }) =>
      Stat(
        baseStat: baseStat ?? this.baseStat,
        stat: stat ?? this.stat,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'baseStat': baseStat,
      'stat': stat.toMap(),
    };
  }

  factory Stat.fromMap(Map<String, dynamic> map) {
    return Stat(
      baseStat: map['base_stat'] as int,
      stat: Species.fromMap(map['stat'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stat.fromJson(String source) =>
      Stat.fromMap(json.decode(source) as Map<String, dynamic>);
}

class GrowthRate {
  final String name;
  final String url;

  GrowthRate({
    required this.name,
    required this.url,
  });

  GrowthRate copyWith({
    String? name,
    String? url,
  }) =>
      GrowthRate(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory GrowthRate.fromMap(Map<String, dynamic> map) {
    return GrowthRate(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GrowthRate.fromJson(String source) =>
      GrowthRate.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Shape {
  final String name;
  final String url;

  Shape({
    required this.name,
    required this.url,
  });

  Shape copyWith({
    String? name,
    String? url,
  }) =>
      Shape(
        name: name ?? this.name,
        url: url ?? this.url,
      );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Shape.fromMap(Map<String, dynamic> map) {
    return Shape(
      name: map['name'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Shape.fromJson(String source) =>
      Shape.fromMap(json.decode(source) as Map<String, dynamic>);
}
