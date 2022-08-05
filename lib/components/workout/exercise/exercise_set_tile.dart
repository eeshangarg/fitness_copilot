import 'package:fitness_copilot/components/workout/exercise/set/edit_set_bottom_sheet.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_set.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseSetTile extends StatelessWidget {
  const ExerciseSetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;

    ExerciseSet set = context.watch<ExerciseSet>();
    ExerciseTemplate exerciseTemplate = context.watch<ExerciseTemplate>();
    int setNumber = exerciseTemplate.sets.indexOf(set) + 1;

    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: exerciseTemplate),
                ChangeNotifierProvider.value(value: set),
              ],
              child: const EditSetBottomSheet(),
            );
          },
        );
      },
      title: Text('Set $setNumber'),
      // TODO: Figure out a way to calculate the previous set stats
      subtitle: const Text('Previous: 25 lbs x 15'),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              text: '${set.weight} ',
              style: titleMedium,
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
              style: titleMedium,
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
