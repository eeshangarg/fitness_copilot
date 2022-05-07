import 'package:fitness_copilot/components/workout_timer.dart';
import 'package:fitness_copilot/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    TimerServiceProvider(
      service: TimerService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Copilot',
      theme: ThemeData(useMaterial3: true),
      home: const HomePage(),
    );
  }
}
