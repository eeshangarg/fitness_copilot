import 'package:fitness_copilot/components/workout/workout_card.dart';
import 'package:fitness_copilot/models/workout/workout_collection.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutCollection workoutList = context.watch<WorkoutCollection>();

    return ListView.builder(
      padding: kScreenPadding,
      itemCount: workoutList.workouts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: workoutList.workouts[index],
          child: const WorkoutCard(),
        );
      },
    );
  }
}
