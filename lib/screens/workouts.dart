import 'package:fitness_copilot/components/workout_card.dart';
import 'package:fitness_copilot/models/workout.dart';
import 'package:flutter/material.dart';

class Workouts extends StatelessWidget {
  const Workouts({
    Key? key,
    required List<Workout> workouts,
  })  : _workouts = workouts,
        super(key: key);

  final List<Workout> _workouts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: _workouts.length,
      itemBuilder: (context, index) {
        return WorkoutCard(workout: _workouts[index]);
      },
    );
  }
}
