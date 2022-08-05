import 'package:fitness_copilot/components/workout/workout_template_card.dart';
import 'package:fitness_copilot/models/workout/workout_template_collection.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  const Workouts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutTemplateCollection workoutTemplateCollection =
        context.watch<WorkoutTemplateCollection>();

    return ListView.builder(
      padding: kScreenPadding,
      itemCount: workoutTemplateCollection.workouts.length,
      itemBuilder: (context, index) {
        return ChangeNotifierProvider.value(
          value: workoutTemplateCollection.workouts[index],
          child: const WorkoutTemplateCard(),
        );
      },
    );
  }
}
