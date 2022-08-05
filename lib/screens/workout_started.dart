import 'package:fitness_copilot/components/workout/exercise/exercise_expansion_panel.dart';
import 'package:fitness_copilot/components/workout/workout_timer.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutStarted extends StatelessWidget {
  const WorkoutStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(workoutTemplate.name),
            const WorkoutTimer(),
          ],
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: kScreenPadding,
          child: ExerciseExpansionPanel(),
        ),
      ),
    );
  }
}
