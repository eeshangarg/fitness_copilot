import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_template.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SetTemplate extends ChangeNotifier {
  @JsonKey(defaultValue: 0)
  int repGoal;

  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  // Unix timestamp in UTC
  int? lastPerformed;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  SetTemplate({required this.repGoal, required this.weight}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  void update({required int repGoal, required double weight}) {
    this.repGoal = repGoal;
    this.weight = weight;
    notifyListeners();
  }

  void setRepGoal(int repGoal) {
    this.repGoal = repGoal;
    notifyListeners();
  }

  factory SetTemplate.fromJson(Map<String, dynamic> json) =>
      _$SetTemplateFromJson(json);

  Map<String, dynamic> toJson() => _$SetTemplateToJson(this);
}
