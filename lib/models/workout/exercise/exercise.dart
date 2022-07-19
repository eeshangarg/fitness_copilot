import 'package:fitness_copilot/models/workout/exercise/exercise_set.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Exercise extends ChangeNotifier {
  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String bodyPart;

  @JsonKey(defaultValue: [])
  List<ExerciseSet> sets = [];

  Exercise({
    required this.name,
    required this.bodyPart,
    this.sets = const [],
  });

  factory Exercise.fromJson(Map<String, dynamic> json) =>
      _$ExerciseFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseToJson(this);
}