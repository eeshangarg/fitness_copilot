import 'package:fitness_copilot/components/workout/workout_card.dart';
import 'package:fitness_copilot/models/workout/workout_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutList workoutList = context.watch<WorkoutList>();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
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
