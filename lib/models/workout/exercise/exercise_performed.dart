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
  final String name;

  @JsonKey(required: true)
  final String bodyPart;

  @JsonKey(defaultValue: [])
  List<SetPerformed> sets = [];

  // Unix timestamp in UTC
  // Note that creationDate is also the date that the given exercise was
  // last performed. SetTemplate.lastPerformed == the Set with the latest
  // Set.creationDate
  @JsonKey(required: true)
  int? creationDate;

  ExercisePerformed({
    required this.name,
    required this.bodyPart,
    this.sets = const [],
  }) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  factory ExercisePerformed.fromJson(Map<String, dynamic> json) =>
      _$ExercisePerformedFromJson(json);

  Map<String, dynamic> toJson() => _$ExercisePerformedToJson(this);
}
