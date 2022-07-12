import 'package:fitness_copilot/models/workout/exercise/exercise.dart';
import 'package:fitness_copilot/models/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutExercisesSummary extends StatelessWidget {
  const WorkoutExercisesSummary({Key? key}) : super(key: key);

  String _getWorkoutSummary(List<Exercise> exercises) {
    List<String> exerciseNames = [];
    for (final exercise in exercises) {
      exerciseNames.add(exercise.name);
    }
    return exerciseNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    Workout workout = context.watch<Workout>();

    return Flexible(
      child: Text(
        _getWorkoutSummary(workout.exercises),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
        maxLines: 2,
      ),
    );
  }
}
