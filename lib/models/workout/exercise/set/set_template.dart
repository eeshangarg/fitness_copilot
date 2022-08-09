import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_template.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SetTemplate extends ChangeNotifier {
  @JsonKey(defaultValue: 0)
  int repGoal;

  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  SetTemplate({required this.repGoal, required this.weight});

  void update({required int repGoal, required double weight}) {
    this.repGoal = repGoal;
    this.weight = weight;
    notifyListeners();
  }

  factory SetTemplate.fromJson(Map<String, dynamic> json) =>
      _$SetTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SetTemplateToJson(this);
}
