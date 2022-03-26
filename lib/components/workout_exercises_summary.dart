import 'package:fitness_copilot/models/exercise.dart';
import 'package:flutter/material.dart';

class WorkoutExercisesSummary extends StatelessWidget {
  const WorkoutExercisesSummary({
    Key? key,
    required List<Exercise> exercises,
  })  : _exercises = exercises,
        super(key: key);

  final List<Exercise> _exercises;

  String _getWorkoutSummary() {
    List<String> exerciseNames = [];
    for (final exercise in _exercises) {
      exerciseNames.add(exercise.name);
    }
    return exerciseNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Text(
        _getWorkoutSummary(),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
        maxLines: 2,
      ),
    );
  }
}
