import 'package:fitness_copilot/components/workout/workout_details_dialog.dart';
import 'package:fitness_copilot/components/workout/workout_exercises_summary.dart';
import 'package:fitness_copilot/components/workout/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/components/workout/workout_popup_menu_button.dart';
import 'package:fitness_copilot/models/workout/workout.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutCard extends StatelessWidget {
  const WorkoutCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Workout workout = context.watch<Workout>();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: workout,
              child: const WorkoutDetailsDialog(),
            );
          },
        );
      },
      child: Card(
        child: Padding(
          padding: kComponentPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    workout.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const WorkoutPopupMenuButton(),
                ],
              ),
              const SizedBox(height: 8.0),
              const WorkoutExercisesSummary(),
              const SizedBox(height: 8.0),
              const WorkoutLastPerformedIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
