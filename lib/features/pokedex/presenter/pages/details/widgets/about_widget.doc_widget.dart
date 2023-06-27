// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: prefer_single_quotes

// **************************************************************************
// DocWidgetGenerator
// **************************************************************************

import 'package:doc_widget/doc_widget.dart';

class AboutWidgetDocWidget implements Documentation {
  @override
  String get name => 'AboutWidget';
  @override
  bool get hasState => false;
  @override
  String? get deprecation => null;
  @override
  List<PropertyDoc> get properties => [
        PropertyDoc(
          name: 'key',
          isRequired: false,
          isNamed: true,
          type: 'Key?',
        ),
        PropertyDoc(
          name: 'pokemonDetailsEntity',
          isRequired: true,
          isNamed: true,
          type: 'PokemonDetailsEntity?',
        ),
        PropertyDoc(
          name: 'loading',
          isRequired: true,
          isNamed: true,
          type: 'bool',
        ),
      ];
  @override
  String get snippet => '''
''';
}
