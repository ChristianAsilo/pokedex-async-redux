import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/ability.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonAbilities extends StatelessWidget {
  const PokemonAbilities({required this.ability, Key? key}) : super(key: key);

  final List<Ability> ability;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: [
        for (var ability in ability) Chip(label: Text(ability.ability.name, style: textStyle)),
      ],
    );
  }
}
