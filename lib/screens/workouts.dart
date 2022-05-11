import 'package:fitness_copilot/components/workout_card.dart';
import 'package:fitness_copilot/models/notifiers/workout_list_change_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutListChangeNotifier notifier =
        context.watch<WorkoutListChangeNotifier>();

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: notifier.workouts.length,
      itemBuilder: (context, index) {
        return WorkoutCard(
          workout: notifier.workouts[index],
        );
      },
    );
  }
}
