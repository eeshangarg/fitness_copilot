import 'package:fitness_copilot/components/workout/workout_duration_and_pr_row.dart';
import 'package:fitness_copilot/components/workout/workout_performed_details_dialog.dart';
import 'package:fitness_copilot/components/workout/workout_performed_popup_menu_button.dart';
import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkoutPerformedCard extends StatelessWidget {
  const WorkoutPerformedCard({Key? key}) : super(key: key);

  String _getPerformedDateLabel(WorkoutPerformed workoutPerformed) {
    DateTime performedDate = DateTime.fromMillisecondsSinceEpoch(
      workoutPerformed.performedDate!,
    );
    return DateFormat.MMMMEEEEd().format(performedDate);
  }

  List<TableRow> _getTableRows(
    BuildContext context,
    WorkoutPerformed workoutPerformed,
  ) {
    List<TableRow> tableRows = [
      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              'Exercise',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              'Best set',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    ];

    for (final exercise in workoutPerformed.exercises) {
      exercise.sets.sort((set1, set2) {
        return -set1.oneRepMax().compareTo(set2.oneRepMax());
      });

      var bestSet = exercise.sets[0];
      TableRow tableRow = TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              exercise.name,
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              '${bestSet.weight} lb x ${bestSet.repsPerformed}',
              style: Theme.of(context).textTheme.bodyMedium,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      );

      tableRows.add(tableRow);
    }

    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    WorkoutPerformed workoutPerformed = context.watch<WorkoutPerformed>();

    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ChangeNotifierProvider.value(
              value: workoutPerformed,
              child: const WorkoutPerformedDetailsDialog(),
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
                    workoutPerformed.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const WorkoutPerformedPopupMenuButton(),
                ],
              ),
              Text(
                _getPerformedDateLabel(workoutPerformed),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 12.0),
              const WorkoutDurationAndPRRow(),
              const SizedBox(height: 12.0),
              Table(children: _getTableRows(context, workoutPerformed)),
            ],
          ),
        ),
      ),
    );
  }
}
