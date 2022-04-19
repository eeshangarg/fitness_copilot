import 'package:fitness_copilot/components/workout_popup_menu_tile.dart';
import 'package:flutter/material.dart';

enum WorkoutDetailsOption {
  edit,
  delete,
}

class WorkoutPopupMenuButton extends StatelessWidget {
  const WorkoutPopupMenuButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<WorkoutDetailsOption>(
      icon: const Icon(Icons.more_horiz_rounded),
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<WorkoutDetailsOption>>[
        const PopupMenuItem<WorkoutDetailsOption>(
          value: WorkoutDetailsOption.edit,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem<WorkoutDetailsOption>(
          value: WorkoutDetailsOption.delete,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
      onSelected: (WorkoutDetailsOption option) {
        if (option == WorkoutDetailsOption.edit) {
          // TODO: Implement the ability to edit a workout.
        } else if (option == WorkoutDetailsOption.delete) {
          // TODO: Implement the ability to delete a workout.
        }
      },
    );
  }
}
