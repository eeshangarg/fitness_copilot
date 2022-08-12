import 'package:fitness_copilot/components/workout/exercise/set/edit_set_bottom_sheet.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_performed.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/models/workout/exercise/set/set_performed.dart';
import 'package:fitness_copilot/models/workout/exercise/set/set_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExerciseSetTile extends StatelessWidget {
  const ExerciseSetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? titleMedium = Theme.of(context).textTheme.titleMedium;

    SetTemplate setTemplate = context.watch<SetTemplate>();
    ExerciseTemplate exerciseTemplate = context.watch<ExerciseTemplate>();
    int setNumber = exerciseTemplate.sets.indexOf(setTemplate) + 1;
    ExercisePerformed exercisePerformed = context.watch<ExercisePerformed>();
    SetPerformed setPerformed = context.watch<SetPerformed>();

    return ListTile(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: exerciseTemplate),
                ChangeNotifierProvider.value(value: setTemplate),
                ChangeNotifierProvider.value(value: exercisePerformed),
                ChangeNotifierProvider.value(value: setPerformed),
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
              text: '${setTemplate.weight} ',
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
              text: '${setPerformed.repsPerformed} / ${setTemplate.repGoal} ',
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
