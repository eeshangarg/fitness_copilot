import 'package:fitness_copilot/components/confirmation_alert_dialog.dart';
import 'package:fitness_copilot/components/workout/workout_popup_menu_tile.dart';
import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:fitness_copilot/models/workout/workouts_performed_collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum WorkoutPerformedOption {
  edit,
  delete,
}

class WorkoutPerformedPopupMenuButton extends StatelessWidget {
  const WorkoutPerformedPopupMenuButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WorkoutPerformed workoutPerformed = context.watch<WorkoutPerformed>();
    WorkoutsPerformedCollection workoutPerformedCollection =
        context.watch<WorkoutsPerformedCollection>();

    return PopupMenuButton<WorkoutPerformedOption>(
      icon: const Icon(Icons.more_horiz_rounded),
      itemBuilder: (BuildContext context) =>
          <PopupMenuEntry<WorkoutPerformedOption>>[
        const PopupMenuItem<WorkoutPerformedOption>(
          value: WorkoutPerformedOption.edit,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.edit),
            title: Text('Edit'),
          ),
        ),
        const PopupMenuItem<WorkoutPerformedOption>(
          value: WorkoutPerformedOption.delete,
          child: WorkoutPopupMenuTile(
            icon: Icon(Icons.delete),
            title: Text('Delete'),
          ),
        ),
      ],
      onSelected: (WorkoutPerformedOption option) {
        if (option == WorkoutPerformedOption.edit) {
          // TODO: Implement the ability to edit a workout.
        } else if (option == WorkoutPerformedOption.delete) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmationAlertDialog(
                title: 'Delete workout?',
                contentMessage: 'Are you sure you want to delete this workout?',
                confirmationButtonText: 'Delete',
                onPressedConfirmation: () => workoutPerformedCollection.remove(
                  workoutPerformed,
                ),
              );
            },
          );
        }
      },
    );
  }
}
