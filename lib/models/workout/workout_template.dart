import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_copilot/models/workout/exercise/exercise_template.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'workout_template.g.dart';

final _db = FirebaseFirestore.instance;

@JsonSerializable(
  explicitToJson: true,
  fieldRename: FieldRename.snake,
)
class WorkoutTemplate extends ChangeNotifier {
  static const String _firestoreCollectionName = "workoutTemplates";

  @JsonKey(ignore: true)
  late final String id;

  @JsonKey(required: true)
  final String name;

  @JsonKey(defaultValue: [])
  List<ExerciseTemplate> exercises;

  // Unix timestamp in UTC
  int? lastPerformed;

  // Unix timestamp in UTC
  @JsonKey(required: true)
  int? creationDate;

  WorkoutTemplate({required this.name, this.exercises = const []}) {
    creationDate = DateTime.now().millisecondsSinceEpoch;
  }

  void setLastPerformed(int lastPerformed) {
    this.lastPerformed = lastPerformed;
    notifyListeners();
  }

  Future<void> update() async {
    await _db.collection(_firestoreCollectionName).doc(id).set(toJson());
    notifyListeners();
  }

  factory WorkoutTemplate.fromJson(String id, Map<String, dynamic> json) {
    return _$WorkoutTemplateFromJson(json)..id = id;
  }

  Map<String, dynamic> toJson() => _$WorkoutTemplateToJson(this);
}
