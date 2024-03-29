import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutTemplateExercisesSummary extends StatelessWidget {
  const WorkoutTemplateExercisesSummary({Key? key}) : super(key: key);

  String _getWorkoutSummary(List<ExerciseTemplate> exercises) {
    List<String> exerciseNames = [];
    for (final exercise in exercises) {
      exerciseNames.add(exercise.name);
    }
    return exerciseNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();

    return Flexible(
      child: Text(
        _getWorkoutSummary(workoutTemplate.exercises),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
        maxLines: 2,
      ),
    );
  }
}
