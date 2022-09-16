import 'package:fitness_copilot/components/workout/workout_performed_card.dart';
import 'package:fitness_copilot/models/workout/workouts_performed_collection.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutsPerformedCollection workoutsPerformedCollection =
        context.watch<WorkoutsPerformedCollection>();

    return ListView.builder(
      padding: kScreenPadding,
      itemCount: workoutsPerformedCollection.workoutsPerformed.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: workoutsPerformedCollection.workoutsPerformed[index],
          child: const WorkoutPerformedCard(),
        );
      },
    );
  }
}
