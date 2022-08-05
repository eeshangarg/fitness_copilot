import 'package:fitness_copilot/components/workout/workout_popup_menu_tile.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:fitness_copilot/models/workout/workout_template_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum WorkoutTemplateOption {
  edit,
  delete,
}

class WorkoutTemplatePopupMenuButton extends StatelessWidget {
  const WorkoutTemplatePopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutTemplate workoutTemplate = context.watch<WorkoutTemplate>();
    WorkoutTemplateCollection workoutTemplateCollection =
        context.watch<WorkoutTemplateCollection>();

    return PopupMenuButton<WorkoutTemplateOption>(
      icon: const Icon(Icons.more_horiz_rounded),
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<WorkoutTemplateOption>>[
        const PopupMenuItem<WorkoutTemplateOption>(
          value: WorkoutTemplateOption.edit,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem<WorkoutTemplateOption>(
          value: WorkoutTemplateOption.delete,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
      onSelected: (WorkoutTemplateOption option) {
        if (option == WorkoutTemplateOption.edit) {
          // TODO: Implement the ability to edit a workout.
        } else if (option == WorkoutTemplateOption.delete) {
          workoutTemplateCollection.remove(workoutTemplate);
        }
      },
    );
  }
}
