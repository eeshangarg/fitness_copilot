import 'package:fitness_copilot/components/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:fitness_copilot/screens/workout_started.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutDetailsDialog extends StatelessWidget {
  const WorkoutDetailsDialog({Key? key}) : super(key: key);

  List<ListTile> _getExerciseTiles(List<Exercise> exercises) {
    List<ListTile> tiles = [];

    for (final exercise in exercises) {
      ListTile tile = ListTile(
        visualDensity: const VisualDensity(
          vertical: VisualDensity.minimumDensity,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 0.0,
          vertical: 0.0,
        ),
        title: Text('${exercise.sets.length} x ${exercise.name}'),
        subtitle: Text(exercise.bodyPart),
      );
      tiles.add(tile);
    }

    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    Workout workout = context.watch<Workout>();

    return AlertDialog(
      scrollable: true,
      insetPadding: const EdgeInsets.all(16.0),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(workout.name),
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
        children: _getExerciseTiles(workout.exercises),
        mainAxisSize: MainAxisSize.min,
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
                    value: workout,
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
