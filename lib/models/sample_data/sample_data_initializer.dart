import 'dart:developer' as developer;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitness_copilot/models/sample_data/workout_templates.dart';

final _db = FirebaseFirestore.instance;
const String _logSource = 'models.sample_data.sample_data_initializer';

class SampleDataInitializer {
  static Future<void> initialize() async {
    developer.log('Initializing sample data...', name: _logSource);
    QuerySnapshot<Map<String, dynamic>> workoutTemplates =
        await _db.collection("workoutTemplates").get();

    if (workoutTemplates.docs.isEmpty) {
      for (final workoutTemplate in sampleWorkoutTemplates) {
        developer.log('Adding workout templates...', name: _logSource);
        DocumentReference template = await _db
            .collection('workoutTemplates')
            .add(workoutTemplate.toJson());
        developer.log('Added workout template with ID: ${template.id}');
      }
    }
  }
}
