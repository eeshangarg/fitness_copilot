import 'dart:collection';

import 'package:fitness_copilot/models/sample_data/workout_templates.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:flutter/material.dart';

class WorkoutTemplateCollection extends ChangeNotifier {
  final List<WorkoutTemplate> _workouts = sampleWorkoutTemplates;

  UnmodifiableListView<WorkoutTemplate> get workouts =>
      UnmodifiableListView(_workouts);

  void remove(WorkoutTemplate workout) {
    _workouts.remove(workout);
    notifyListeners();
  }
}
