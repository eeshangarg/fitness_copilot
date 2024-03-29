import 'package:fitness_copilot/models/workout/exercise/set/set_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_template.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class ExerciseTemplate extends ChangeNotifier {
  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String bodyPart;

  @JsonKey(defaultValue: [])
  List<SetTemplate> sets = [];

  // Unix timestamp in UTC
  int? lastPerformed;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  ExerciseTemplate({
    required this.name,
    required this.bodyPart,
    this.sets = const [],
  }) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  factory ExerciseTemplate.fromJson(Map<String, dynamic> json) =>
      _$ExerciseTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$ExerciseTemplateToJson(this);
}
