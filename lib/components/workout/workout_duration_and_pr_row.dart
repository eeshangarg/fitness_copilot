import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class WorkoutDurationAndPRRow extends StatelessWidget {
  const WorkoutDurationAndPRRow({Key? key}) : super(key: key);

  String _getWorkoutDurationLabel(WorkoutPerformed workoutPerformed) {
    DateTime performedDate = DateTime.fromMillisecondsSinceEpoch(
      workoutPerformed.performedDate!,
    );
    DateTime creationDate = DateTime.fromMillisecondsSinceEpoch(
      workoutPerformed.creationDate!,
    );
    Duration duration = performedDate.difference(creationDate);
    return '${duration.inHours}h ${duration.inMinutes}min';
  }

  @override
  Widget build(BuildContext context) {
    WorkoutPerformed workoutPerformed = context.watch<WorkoutPerformed>();

    return Row(
      children: [
        Icon(
          Icons.access_time_filled,
          size: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        const SizedBox(width: 6.0),
        Text(
          _getWorkoutDurationLabel(workoutPerformed),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 6.0),
        Icon(
          FontAwesomeIcons.trophy,
          size: Theme.of(context).textTheme.bodyMedium?.fontSize,
          color: Theme.of(context).textTheme.bodyMedium?.color,
        ),
        const SizedBox(width: 6.0),
        Text(
          '8 PRs', // TODO: Add PR calculation feature
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
