import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_template.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class WorkoutTemplate extends ChangeNotifier {
  @JsonKey(required: true)
  final String name;

  @JsonKey(defaultValue: [])
  List<ExerciseTemplate> exercises;

  // Unix timestamp in UTC
  int? lastPerformed;

  WorkoutTemplate({required this.name, this.exercises = const []});

  factory WorkoutTemplate.fromJson(Map<String, dynamic> json) =>
      _$WorkoutTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$WorkoutTemplateToJson(this);
}
