import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_template.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SetTemplate extends ChangeNotifier {
  @JsonKey(defaultValue: 0)
  int repGoal;

  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  @JsonKey(defaultValue: 0)
  int repsPerformed = 0;

  SetTemplate({
    required this.repGoal,
    required this.weight,
    this.repsPerformed = 0,
  });

  void update({
    required int repGoal,
    required double weight,
    required int repsPerformed,
  }) {
    this.repGoal = repGoal;
    this.weight = weight;
    this.repsPerformed = repsPerformed;
    notifyListeners();
  }

  factory SetTemplate.fromJson(Map<String, dynamic> json) =>
      _$SetTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SetTemplateToJson(this);
}
