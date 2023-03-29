import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/move.dart';
import 'package:pokedex_async_redux/utils/constants.dart';

class PokemonMoves extends StatelessWidget {
  const PokemonMoves({required this.moves, Key? key}) : super(key: key);

  final List<Move> moves;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 10.0,
          children: [for (var move in moves) Chip(label: Text(move.move.name, style: textStyle))]),
    );
  }
}
