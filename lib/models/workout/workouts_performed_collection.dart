import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_copilot/models/workout/workout_performed.dart';
import 'package:flutter/material.dart';

final _db = FirebaseFirestore.instance;

class WorkoutsPerformedCollection extends ChangeNotifier {
  static const String _firestoreCollectionName = "workoutsPerformed";

  final List<WorkoutPerformed> _workoutsPerformed;

  UnmodifiableListView<WorkoutPerformed> get workoutsPerformed =>
      UnmodifiableListView(_workoutsPerformed);

  WorkoutsPerformedCollection(this._workoutsPerformed);

  static Future<WorkoutsPerformedCollection> fromFirestore() async {
    QuerySnapshot<Map<String, dynamic>> snapshots =
        await _db.collection(_firestoreCollectionName).get();

    List<WorkoutPerformed> workoutsPerformed = [];
    for (final workoutPerformed in snapshots.docs) {
      workoutsPerformed.add(WorkoutPerformed.fromJson(
        workoutPerformed.id,
        workoutPerformed.data(),
      ));
    }

    return WorkoutsPerformedCollection(workoutsPerformed);
  }

  Future<void> add(WorkoutPerformed workoutPerformed) async {
    _workoutsPerformed.add(workoutPerformed);
    notifyListeners();
    _db
        .collection(_firestoreCollectionName)
        .add(workoutPerformed.toJson())
        .then((documentSnapshot) {
      workoutPerformed.id = documentSnapshot.id;
    });
  }

  Future<void> remove(WorkoutPerformed workoutPerformed) async {
    _workoutsPerformed.remove(workoutPerformed);
    notifyListeners();
    await _db
        .collection(_firestoreCollectionName)
        .doc(workoutPerformed.id)
        .delete();
  }
}
