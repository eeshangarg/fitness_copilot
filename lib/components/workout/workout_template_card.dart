import 'package:fitness_copilot/components/workout/workout_last_performed_indicator.dart';
import 'package:fitness_copilot/components/workout/workout_template_details_dialog.dart';
import 'package:fitness_copilot/components/workout/workout_template_exercises_summary.dart';
import 'package:fitness_copilot/components/workout/workout_template_popup_menu_button.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:fitness_copilot/models/workout/workouts_performed_collection.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutTemplateCard extends StatelessWidget {
  const WorkoutTemplateCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();
    WorkoutsPerformedCollection workoutsPerformedCollection =
        context.watch<WorkoutsPerformedCollection>();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return MultiProvider(
              providers: [
                ChangeNotifierProvider.value(value: workoutTemplate),
                ChangeNotifierProvider.value(
                  value: workoutsPerformedCollection,
                ),
              ],
              child: const WorkoutTemplateDetailsDialog(),
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
                    workoutTemplate.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const WorkoutTemplatePopupMenuButton(),
                ],
              ),
              const SizedBox(height: 8.0),
              const WorkoutTemplateExercisesSummary(),
              const SizedBox(height: 8.0),
              const WorkoutLastPerformedIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
