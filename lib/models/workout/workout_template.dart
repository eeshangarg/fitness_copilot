import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_template.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class WorkoutTemplate extends ChangeNotifier {
  @JsonKey(ignore: true)
  late final String id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(defaultValue: [])
  List<ExerciseTemplate> exercises;

  // Unix timestamp in UTC
  int? lastPerformed;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  WorkoutTemplate({required this.name, this.exercises = const []}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  factory WorkoutTemplate.fromJson(String id, Map<String, dynamic> json) {
    return _$WorkoutTemplateFromJson(json)..id = id;
  }

  Map<String, dynamic> toJson() => _$WorkoutTemplateToJson(this);
}
