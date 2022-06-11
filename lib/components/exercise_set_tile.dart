import 'package:fitness_copilot/components/edit_set_bottom_sheet.dart';
import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/exercise_set.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseSetTile extends StatelessWidget {
  const ExerciseSetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;
    TextStyle? titleMediumBold = titleMedium?.copyWith(
      fontWeight: FontWeight.bold,
    );

    ExerciseSet set = context.watch<ExerciseSet>();
    Exercise exercise = context.watch<Exercise>();
    int setNumber = exercise.sets.indexOf(set) + 1;

    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: exercise),
                ChangeNotifierProvider.value(value: set),
              ],
              child: const EditSetBottomSheet(),
            );
          },
        );
      },
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
              text: '${set.repsPerformed} / ${set.repGoal} ',
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
