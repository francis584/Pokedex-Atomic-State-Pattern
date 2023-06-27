import 'package:flutter/material.dart';

import 'package:asp/asp.dart';

import 'package:pokedex_egsys/core/utils/mappers/color_to_type_mapper.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/atoms/home_atom.dart';
import 'package:doc_widget/doc_widget.dart';

@docWidget
class TypesChoiceChipsWidget extends StatelessWidget {
  const TypesChoiceChipsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final typeToColorMapper = TypeToColorMapper();
    context.select(() => [homeTypesMap]);

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        runAlignment: WrapAlignment.spaceEvenly,
        alignment: WrapAlignment.spaceEvenly,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: homeTypesMap.value.entries
            .map((entity) => ChoiceChip(
                label: Text(
                  entity.key.name,
                  style: TextStyle(
                      color: entity.value ? Colors.white : Colors.black,
                      fontWeight:
                          entity.value ? FontWeight.bold : FontWeight.normal),
                ),
                selectedColor: typeToColorMapper(entity.key.name),
                selected: entity.value,
                onSelected: (val) {
                  homeTypesMap.update(entity.key, (value) => val);
                }))
            .toList(),
      ),
    );
  }
}
