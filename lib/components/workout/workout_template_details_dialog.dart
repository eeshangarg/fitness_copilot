import 'package:fitness_copilot/components/workout/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:fitness_copilot/screens/workout_started.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutTemplateDetailsDialog extends StatelessWidget {
  const WorkoutTemplateDetailsDialog({Key? key}) : super(key: key);

  List<ListTile> _getExerciseTiles(List<ExerciseTemplate> exercises) {
    List<ListTile> tiles = [];

    for (final exercise in exercises) {
      ListTile tile = ListTile(
        visualDensity: kMinimumVerticalVisualDensity,
        contentPadding: kZeroSymmetricPadding,
        title: Text('${exercise.sets.length} x ${exercise.name}'),
        subtitle: Text(exercise.bodyPart),
      );
      tiles.add(tile);
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();

    return AlertDialog(
      scrollable: true,
      insetPadding: kComponentPadding,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(workoutTemplate.name),
              IconButton(
                onPressed: () {
                  // TODO: Add the ability to edit a workout.
                },
                icon: const Icon(Icons.edit),
                iconSize: 21.0,
              )
            ],
          ),
          const SizedBox(height: 4.0),
          const WorkoutLastPerformedIndicator(),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: _getExerciseTiles(workoutTemplate.exercises),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return ChangeNotifierProvider.value(
                    value: workoutTemplate,
                    child: const WorkoutStarted(),
                  );
                },
              ),
            );
          },
          child: const Text('Start workout'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
