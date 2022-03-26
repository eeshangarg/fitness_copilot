import 'package:fitness_copilot/components/workout_exercises_summary.dart';
import 'package:fitness_copilot/components/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              workout.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            WorkoutExercisesSummary(exercises: workout.exercises),
            const SizedBox(height: 8.0),
            WorkoutLastPerformedIndicator(lastPerformed: workout.lastPerformed),
          ],
        ),
      ),
    );
  }
}
