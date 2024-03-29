import 'package:fitness_copilot/models/workout/exercise/exercise_performed.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_performed.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class WorkoutPerformed extends ChangeNotifier {
  @JsonKey(ignore: true)
  late final String id;

  @JsonKey(required: true)
  late String name;

  @JsonKey(defaultValue: [])
  List<ExercisePerformed> exercises = [];

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? performedDate;

  WorkoutPerformed({required this.name, this.exercises = const []}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  WorkoutPerformed.fromTemplate(WorkoutTemplate template) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
    name = template.name;
    for (final exerciseTemplate in template.exercises) {
      exercises.add(ExercisePerformed.fromTemplate(exerciseTemplate));
    }
  }

  factory WorkoutPerformed.fromJson(String id, Map<String, dynamic> json) {
    return _$WorkoutPerformedFromJson(json)..id = id;
  }

  Map<String, dynamic> toJson() => _$WorkoutPerformedToJson(this);
}
