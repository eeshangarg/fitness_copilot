import 'package:fitness_copilot/models/workout/exercise/exercise_performed.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_performed.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class WorkoutPerformed extends ChangeNotifier {
  @JsonKey(required: true)
  final String name;

  @JsonKey(defaultValue: [])
  List<ExercisePerformed> exercises;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  WorkoutPerformed({required this.name, this.exercises = const []}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  factory WorkoutPerformed.fromJson(Map<String, dynamic> json) =>
      _$WorkoutPerformedFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutPerformedToJson(this);
}
