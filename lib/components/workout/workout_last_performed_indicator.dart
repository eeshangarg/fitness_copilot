import 'package:fitness_copilot/models/workout/workout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutLastPerformedIndicator extends StatelessWidget {
  const WorkoutLastPerformedIndicator({Key? key}) : super(key: key);

  String _getLastPerformedLabel(int? lastPerformed) {
    if (lastPerformed == null) {
      return 'Never';
    }

    DateTime lastPerformedDate = DateTime.fromMillisecondsSinceEpoch(
      lastPerformed,
      isUtc: true,
    );
    int daysAgo = DateTime.now().difference(lastPerformedDate).inDays;
    if (daysAgo == 1) {
      return 'Yesterday';
    }
    return '$daysAgo days ago';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.access_time_filled,
          size: 14.0,
          color: Theme.of(context).textTheme.caption?.color,
        ),
        const SizedBox(width: 6.0),
        Text(
          _getLastPerformedLabel(context.watch<Workout>().lastPerformed),
          style: Theme.of(context).textTheme.caption?.copyWith(fontSize: 14.0),
        )
      ],
    );
  }
}
