import 'package:flutter/material.dart';

class SearchPokemonByNameWidget extends StatelessWidget {
  const SearchPokemonByNameWidget({
    super.key,
    required this.textEditingController,
  });

  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 24,
      title: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
            hintText: 'digite o nome do pokemon',
            suffixIcon: Icon(Icons.search_rounded),
            contentPadding: EdgeInsets.only(left: 18),
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(24))),
      ),
    );
  }
}
