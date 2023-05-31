// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';

class PokemonModel extends Equatable {
  final int id;
  final String name;
  final Sprites sprites;
  final List<Types> types;

  PokemonModel({
    required this.id,
    required this.name,
    required this.sprites,
    required this.types,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) {
    return PokemonModel(
        id: json['id'],
        name: json['name'],
        sprites: Sprites.fromJson(json['sprites']),
        types: json['types'].map((v) => Types.fromJson(v)));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['sprites'] = this.sprites.toJson();
    data['types'] = this.types.map((v) => v.toJson()).toList();

    return data;
  }

  @override
  List<Object> get props => [id, name, sprites, types];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'sprites': sprites.toMap(),
      'types': types.map((x) => x.toMap()).toList(),
    };
  }

  factory PokemonModel.fromMap(Map<String, dynamic> map) {
    return PokemonModel(
        id: map['id'] as int,
        name: map['name'] as String,
        sprites: Sprites.fromMap(map['sprites'] as Map<String, dynamic>),
        types: (map['types'] as List)
            .map(
              (x) => Types.fromMap(x as Map<String, dynamic>),
            )
            .toList());
  }
}

class Sprites {
  Other? other;

  Sprites({this.other});

  Sprites.fromJson(Map<String, dynamic> json) {
    other = json['other'] != null ? new Other.fromJson(json['other']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.other != null) {
      data['other'] = this.other!.toJson();
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'other': other?.toMap(),
    };
  }

  factory Sprites.fromMap(Map<String, dynamic> map) {
    return Sprites(
      other: map['other'] != null
          ? Other.fromMap(map['other'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Other {
  DreamWorld? dreamWorld;
  Other({
    this.dreamWorld,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dreamWorld': dreamWorld?.toMap(),
    };
  }

  factory Other.fromMap(Map<String, dynamic> map) {
    return Other(
      dreamWorld: map['dream_world'] != null
          ? DreamWorld.fromMap(map['dream_world'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Other.fromJson(String source) =>
      Other.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DreamWorld {
  String? frontDefault;

  DreamWorld({
    this.frontDefault,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'front_default': frontDefault,
    };
  }

  factory DreamWorld.fromMap(Map<String, dynamic> map) {
    return DreamWorld(
      frontDefault:
          map['front_default'] != null ? map['front_default'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DreamWorld.fromJson(String source) =>
      DreamWorld.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Types {
  int? slot;
  Type? type;

  Types({this.slot, this.type});

  Types.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    type = json['type'] != null ? new Type.fromJson(json['type']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    if (this.type != null) {
      data['type'] = this.type!.toJson();
    }

    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slot': slot,
      'type': type?.toMap(),
    };
  }

  factory Types.fromMap(Map<String, dynamic> map) {
    return Types(
      slot: map['slot'] != null ? map['slot'] as int : null,
      type: map['type'] != null
          ? Type.fromMap(map['type'] as Map<String, dynamic>)
          : null,
    );
  }
}

class Type {
  String? name;
  String? url;

  Type({this.name, this.url});

  Type.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;

    return data;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'url': url,
    };
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      name: map['name'] != null ? map['name'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }
}
