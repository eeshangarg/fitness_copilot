import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_copilot/models/workout/workout_template.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;

class WorkoutTemplateCollection extends ChangeNotifier {
  static const String _firestoreCollectionName = "workoutTemplates";

  final List<WorkoutTemplate> _workouts;

  UnmodifiableListView<WorkoutTemplate> get workouts =>
      UnmodifiableListView(_workouts);

  WorkoutTemplateCollection(this._workouts);

  static Future<WorkoutTemplateCollection> fromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await _db.collection(_firestoreCollectionName).get();

    List<WorkoutTemplate> workouts = [];
    for (final workoutTemplate in snapshots.docs) {
      workouts.add(WorkoutTemplate.fromJson(
        workoutTemplate.id,
        workoutTemplate.data(),
      ));
    }

    return WorkoutTemplateCollection(workouts);
  }

  Future<void> remove(WorkoutTemplate workout) async {
    _workouts.remove(workout);
    notifyListeners();
    await _db.collection(_firestoreCollectionName).doc(workout.id).delete();
  }
}
