import 'package:fitness_copilot/models/workout/exercise/set/set_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_performed.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class SetPerformed extends ChangeNotifier {
  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  @JsonKey(defaultValue: 0)
  int repsPerformed = 0;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  SetPerformed({required this.weight, this.repsPerformed = 0}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  SetPerformed.fromTemplate(SetTemplate template) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
    weight = template.weight;
  }

  void update({required double weight, required int repsPerformed}) {
    this.weight = weight;
    this.repsPerformed = repsPerformed;
    notifyListeners();
  }

  double oneRepMax() {
    // Uses the Epley formula for 1-RM calculation
    if (repsPerformed > 0) {
      return weight * (1 + repsPerformed / 30.0);
    }

    return 0.0;
  }

  factory SetPerformed.fromJson(Map<String, dynamic> json) =>
      _$SetPerformedFromJson(json);

  Map<String, dynamic> toJson() => _$SetPerformedToJson(this);
}
