import 'package:fitness_copilot/components/exercise_expansion_panel.dart';
import 'package:fitness_copilot/components/workout_timer.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutStarted extends StatelessWidget {
  const WorkoutStarted({
    Key? key,
    required this.workout,
  }) : super(key: key);

  final Workout workout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(workout.name),
            const WorkoutTimer(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ExerciseExpansionPanel(exercises: workout.exercises),
        ),
      ),
    );
  }
}
