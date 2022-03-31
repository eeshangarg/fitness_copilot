import 'package:fitness_copilot/components/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsDialog extends StatelessWidget {
  const WorkoutDetailsDialog({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  List<ListTile> _getExerciseTiles() {
    List<ListTile> tiles = [];
    for (final exercise in workout.exercises) {
      ListTile tile = ListTile(
        visualDensity: const VisualDensity(vertical: -4),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
        title: Text('${exercise.sets.length} x ${exercise.name}'),
        subtitle: Text(exercise.bodyPart),
      );
      tiles.add(tile);
    }
    return tiles;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      WorkoutLastPerformedIndicator(
        lastPerformed: workout.lastPerformed,
      ),
    ];
    children.addAll(_getExerciseTiles());

    return AlertDialog(
      scrollable: true,
      insetPadding: const EdgeInsets.all(16.0),
      title: Text(workout.name),
      content: Column(
        children: children,
        mainAxisSize: MainAxisSize.min,
      ),
      actions: [
        TextButton(
          onPressed: () {},
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
