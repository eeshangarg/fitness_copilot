import 'dart:collection';

import 'package:fitness_copilot/models/workout/sample_data.dart';
import 'package:fitness_copilot/models/workout/workout.dart';
import 'package:flutter/material.dart';

class WorkoutList extends ChangeNotifier {
  final List<Workout> _workouts = sampleWorkouts;

  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  void removeWorkout(Workout workout) {
    _workouts.remove(workout);
    notifyListeners();
  }
}
