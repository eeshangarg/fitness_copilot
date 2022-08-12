import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:fitness_copilot/models/workout/exercise/set/set_performed.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise_performed.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class ExercisePerformed extends ChangeNotifier {
  @JsonKey(required: true)
  late String name;

  @JsonKey(required: true)
  late String bodyPart;

  @JsonKey(defaultValue: [])
  List<SetPerformed> sets = [];

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  ExercisePerformed({
    required this.name,
    required this.bodyPart,
    this.sets = const [],
  }) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  ExercisePerformed.fromTemplate(ExerciseTemplate template) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
    bodyPart = template.bodyPart;
    name = template.name;
    for (final setTemplate in template.sets) {
      sets.add(SetPerformed.fromTemplate(setTemplate));
    }
  }

  factory ExercisePerformed.fromJson(Map<String, dynamic> json) =>
      _$ExercisePerformedFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisePerformedToJson(this);
}
