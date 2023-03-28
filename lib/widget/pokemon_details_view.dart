import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/utils/spacing.dart';
import 'package:pokedex_async_redux/widget/basic_stat_card.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    required this.data,
    Key? key,
  }) : super(key: key);

  final PokemonDetails data;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(defaultTwenty),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace(space: defaultTwenty),
              const Text(
                basicStatsText,
                style: textStyle,
              ),
              const VerticalSpace(space: defaultTen),
              BasicStatCard(
                weight: data.weight,
                height: data.height,
                baseExperience: data.baseExperience,
              ),
              const VerticalSpace(space: defaultTwenty),
              const Text(statsText, style: textStyle),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.stats.length,
                itemBuilder: (context, index) {
                  final stat = data.stats[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(defaultTen),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            stat.stat.name,
                            style: const TextStyle(fontSize: defaultSixTeen),
                          ),
                          Text(
                            stat.baseStat.toString(),
                            style: const TextStyle(
                              fontSize: defaultSixTeen,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const VerticalSpace(space: defaultTwenty),
              const Text(
                abilitiesText,
                style: textStyle,
              ),
              const VerticalSpace(space: defaultTwenty),
              Wrap(
                spacing: defaultTen,
                children: data.abilities
                    .map((ability) => Chip(
                          label: Text(
                            ability.ability.name,
                            style: textStyle,
                          ),
                        ))
                    .toList(),
              ),
              const VerticalSpace(space: defaultTwenty),
              const Text(
                movesText,
                style: textStyle,
              ),
              const VerticalSpace(space: defaultTwenty),
              SizedBox(
                child: Wrap(
                  spacing: defaultTen,
                  children: data.moves
                      .map(
                        (move) => Chip(
                          label: Text(
                            move.move.name,
                            style: textStyle,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
