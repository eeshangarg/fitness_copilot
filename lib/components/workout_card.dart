import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';

class WorkoutCard extends StatelessWidget {
  final Workout workout;

  const WorkoutCard({
    Key? key,
    required this.workout,
  }) : super(key: key);

  String _getWorkoutSummary() {
    List<String> exerciseNames = [];
    for (final exercise in workout.exercises) {
      exerciseNames.add(exercise.name);
    }
    return exerciseNames.join(', ');
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              workout.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Flexible(
              child: Text(
                _getWorkoutSummary(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
                maxLines: 2,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  Icons.access_time_filled,
                  size: 14.0,
                  color: Theme.of(context).textTheme.caption?.color,
                ),
                const SizedBox(width: 6.0),
                Text(
                  '2 days ago',
                  style: Theme.of(context).textTheme.caption?.copyWith(
                        fontSize: 14.0,
                      ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
