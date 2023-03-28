import 'package:flutter/material.dart';
import 'package:pokedex_async_redux/utils/constants.dart';
import 'package:pokedex_async_redux/utils/spacing.dart';

class BasicStatCard extends StatelessWidget {
  const BasicStatCard({
    required this.weight,
    required this.height,
    required this.baseExperience,
    Key? key,
  }) : super(key: key);

  final int weight;
  final int height;
  final int baseExperience;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(weightText, style: TextStyle(fontSize: 16)),
                Text(
                  '${weight / 10} $kgText',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const VerticalSpace(space: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(heightText, style: TextStyle(fontSize: 16)),
                Text(
                  '${height / 10} $metersText',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const VerticalSpace(space: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(baseExperienceText, style: TextStyle(fontSize: 16)),
                Text(
                  '$baseExperience',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
