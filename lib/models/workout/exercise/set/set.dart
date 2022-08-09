import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Set extends ChangeNotifier {
  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  @JsonKey(defaultValue: 0)
  int repsPerformed = 0;

  Set({required this.weight, this.repsPerformed = 0});

  void update({required double weight, required int repsPerformed}) {
    this.weight = weight;
    this.repsPerformed = repsPerformed;
    notifyListeners();
  }

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);

  Map<String, dynamic> toJson() => _$SetToJson(this);
}
