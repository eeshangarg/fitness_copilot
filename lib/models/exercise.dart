import 'package:fitness_copilot/models/exercise_set.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exercise.g.dart';

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class Exercise {
  @JsonKey(required: true)
  final String name;

  @JsonKey(required: true)
  final String bodyPart;

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
