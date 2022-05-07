import 'package:fitness_copilot/models/exercise_set.dart';
import 'package:flutter/material.dart';

class ExerciseSetTile extends StatelessWidget {
  const ExerciseSetTile({
    Key? key,
    required this.set,
    required this.setNumber,
  }) : super(key: key);

  final ExerciseSet set;
  final int setNumber;

  @override
  Widget build(BuildContext context) {
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    TextStyle? titleMediumBold = titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );

    return ListTile(
      title: Text(
        'Set $setNumber',
        style: titleMediumBold,
      ),
      // TODO: Figure out a way to calculate the previous set stats
      subtitle: const Text('Previous: 25 lbs x 15'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: '${set.weight} ',
              style: titleMediumBold,
              children: [
                TextSpan(
                  text: 'lb ',
                  style: titleMedium,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
            child: VerticalDivider(),
          ),
          RichText(
            text: TextSpan(
              text: '${set.numberOfReps} ',
              style: titleMediumBold,
              children: [
                TextSpan(
                  text: 'reps',
                  style: titleMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
