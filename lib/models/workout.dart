import 'dart:collection';

import 'package:fitness_copilot/models/exercise.dart';
import 'package:fitness_copilot/models/sample_data.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Workout {
  @JsonKey(required: true)
  final String name;

  List<Exercise> exercises;

  // Unix timestamp in UTC
  int? lastPerformed;

  Workout({required this.name, this.exercises = const []});

  factory Workout.fromJson(Map<String, dynamic> json) =>
      _$WorkoutFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutToJson(this);
}

class WorkoutChangeNotifier extends ChangeNotifier {
  final List<Workout> _workouts = sampleWorkouts;

  UnmodifiableListView<Workout> get workouts => UnmodifiableListView(_workouts);

  void removeWorkout(Workout workout) {
    _workouts.remove(workout);
    notifyListeners();
  }
}
