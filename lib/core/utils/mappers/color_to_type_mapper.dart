import 'package:flutter/material.dart';

class TypeToColorMapper {
  Color call(String type) => switch (type) {
        'Normal' => Colors.brown.shade400,
        'Fire' => Colors.red,
        'Water' => Colors.blue,
        'Grass' => Colors.green,
        'Electric' => Colors.amber,
        'Ice' => Colors.cyanAccent.shade400,
        'Fighting' => Colors.orange,
        'Poison' => Colors.purple,
        'Ground' => Colors.orange.shade300,
        'Flying' => Colors.indigo.shade200,
        'Psychic' => Colors.pink,
        'Bug' => Colors.lightGreen.shade500,
        'Rock' => Colors.grey,
        'Ghost' => Colors.indigo.shade400,
        'Dark' => Colors.brown,
        'Dragon' => Colors.indigo.shade800,
        'Steel' => Colors.blueGrey,
        'Fairy' => Colors.pinkAccent.shade100,
        _ => Colors.grey,
      };
}
