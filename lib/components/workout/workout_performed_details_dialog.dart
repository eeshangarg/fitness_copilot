import 'package:fitness_copilot/components/workout/workout_duration_and_pr_row.dart';
import 'package:fitness_copilot/models/workout/exercise/set/set_performed.dart';
import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class WorkoutPerformedDetailsDialog extends StatelessWidget {
  const WorkoutPerformedDetailsDialog({Key? key}) : super(key: key);

  String _getPerformedDateLabel(WorkoutPerformed workoutPerformed) {
    DateTime performedDate = DateTime.fromMillisecondsSinceEpoch(
      workoutPerformed.performedDate!,
    );
    String time = DateFormat.jm().format(performedDate);
    String date = DateFormat.yMMMMEEEEd().format(performedDate);
    return '$time, $date';
  }

  List<TableRow> _getTableRows(
    BuildContext context,
    WorkoutPerformed workoutPerformed,
  ) {
    List<TableRow> tableRows = [];

    for (final exercise in workoutPerformed.exercises) {
      TableRow header = TableRow(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              exercise.name,
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
            child: Text(
              '1 RM',
              style: Theme.of(context).textTheme.bodyLarge,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      );

      tableRows.add(header);

      for (var i = 0; i < exercise.sets.length; i++) {
        SetPerformed set = exercise.sets[i];
        int setNumber = i + 1;

        TableRow row = TableRow(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
              child: Text(
                '$setNumber  ${set.weight} lb x ${set.repsPerformed}',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 12.0, 6.0),
              child: Text(
                '${set.oneRepMax()}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        );

        tableRows.add(row);
      }
    }

    return tableRows;
  }

  @override
  Widget build(BuildContext context) {
    WorkoutPerformed workoutPerformed = context.watch<WorkoutPerformed>();

    return AlertDialog(
      scrollable: false,
      insetPadding: kComponentPadding,
      title: Column(
        children: [
          Text(workoutPerformed.name),
          const SizedBox(height: 16.0),
          Text(
            _getPerformedDateLabel(workoutPerformed),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 16.0),
          const WorkoutDurationAndPRRow(),
        ],
      ),
      contentPadding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
      content: SingleChildScrollView(
        child: Table(
          columnWidths: const {0: FlexColumnWidth(8), 1: FlexColumnWidth(2)},
          children: _getTableRows(context, workoutPerformed),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // TODO: Add the ability to edit a performed workout.
          },
          child: const Text('Edit'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close'),
        ),
      ],
    );
  }
}
