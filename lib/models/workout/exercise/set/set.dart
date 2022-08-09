import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Set extends ChangeNotifier {
  @JsonKey(defaultValue: 0.0)
  double weight = 0.0; // in lbs

  @JsonKey(defaultValue: 0)
  int repsPerformed = 0;

  // Unix timestamp in UTC
  // Note that creationDate is also the date that the given set was
  // last performed. SetTemplate.lastPerformed == Set.creationDate
  @JsonKey(required: true)
  int? creationDate;

  Set({required this.weight, this.repsPerformed = 0}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  void update({required double weight, required int repsPerformed}) {
    this.weight = weight;
    this.repsPerformed = repsPerformed;
    notifyListeners();
  }

  factory Set.fromJson(Map<String, dynamic> json) => _$SetFromJson(json);

  Map<String, dynamic> toJson() => _$SetToJson(this);
}