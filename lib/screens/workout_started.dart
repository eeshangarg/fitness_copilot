import 'package:fitness_copilot/components/exercise_expansion_panel.dart';
import 'package:fitness_copilot/components/workout_timer.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutStarted extends StatelessWidget {
  const WorkoutStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Workout workout = context.watch<Workout>();

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
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ExerciseExpansionPanel(),
        ),
      ),
    );
  }
}
