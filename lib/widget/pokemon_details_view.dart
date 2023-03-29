import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/api/model/pokemon.dart';
import 'package:pokedex_async_redux/api/model/pokemon_details.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/utils/spacing.dart';
import 'package:pokedex_async_redux/widget/basic_stat_card.dart';
import 'package:pokedex_async_redux/widget/pokemon_ability.dart';
import 'package:pokedex_async_redux/widget/pokemon_moves.dart';

class PokemonDetailsView extends StatelessWidget {
  const PokemonDetailsView({
    required this.pokemonDetails,
    required this.pokemon,
    Key? key,
  }) : super(key: key);

  final PokemonDetails pokemonDetails;
  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    final pokemonId = pokemon.url.split('/')[6];
    final pokemonImageUrl = imageLink.replaceFirst(indexKey, pokemonId);
    return Card(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const VerticalSpace(height: 20.0),
              ClipRRect(child: Image.network(pokemonImageUrl, height: 200)),
              const VerticalSpace(height: 20.0),
              Text(pokemon.name, style: textStyle),
              const VerticalSpace(height: 20.0),
              const Text(basicStatsText, style: textStyle),
              const VerticalSpace(height: 10.0),
              BasicStatCard(
                weight: pokemonDetails.weight,
                height: pokemonDetails.height,
                baseExperience: pokemonDetails.baseExperience,
              ),
              const VerticalSpace(height: 20.0),
              const Text(statsText, style: textStyle),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: pokemonDetails.stats.length,
                itemBuilder: (_, index) {
                  final stat = pokemonDetails.stats[index];
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            stat.stat.name,
                            style: const TextStyle(fontSize: 16.0),
                          ),
                          Text(
                            stat.baseStat.toString(),
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              const VerticalSpace(height: 20.0),
              const Text(abilitiesText, style: textStyle),
              const VerticalSpace(height: 20.0),
              PokemonAbilities(ability: pokemonDetails.abilities),
              const VerticalSpace(height: 20.0),
              const Text(movesText, style: textStyle),
              const VerticalSpace(height: 20.0),
              PokemonMoves(moves: pokemonDetails.moves),
            ],
          ),
        ),
      ),
    );
  }
}
