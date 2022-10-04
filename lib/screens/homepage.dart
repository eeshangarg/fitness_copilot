import 'package:fitness_copilot/models/data_capsule.dart';
import 'package:fitness_copilot/screens/history.dart';
import 'package:fitness_copilot/screens/workouts.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String kDashboardLabel = 'Dashboard';
  static const String kWorkoutsLabel = 'Workouts';
  static const String kHistoryLabel = 'History';
  static const String kMeasureLabel = 'Measure';

  late final Future<DataCapsule> _fetchDataCapsule =
      DataCapsule.fromFirestore();

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          [
            kDashboardLabel,
            kWorkoutsLabel,
            kHistoryLabel,
            kMeasureLabel,
          ][_selectedIndex],
        ),
      ),
      body: FutureBuilder<DataCapsule>(
        future: _fetchDataCapsule,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            var dataCapsule = snapshot.data!;
            return Center(
              child: MultiProvider(
                providers: [
                  ChangeNotifierProvider.value(
                    value: dataCapsule.workoutTemplates,
                  ),
                  ChangeNotifierProvider.value(
                    value: dataCapsule.workoutsPerformed,
                  ),
                ],
                child: [
                  const Text(
                    kDashboardLabel,
                    style: kNotImplementedPlaceholderTextStyle,
                  ),
                  const Workouts(),
                  const History(),
                  const Text(
                    kMeasureLabel,
                    style: kNotImplementedPlaceholderTextStyle,
                  ),
                ][_selectedIndex],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.dashboard_rounded),
            label: kDashboardLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.fitness_center_rounded),
            label: kWorkoutsLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            label: kHistoryLabel,
          ),
          NavigationDestination(
            icon: Icon(Icons.straighten_rounded),
            label: kMeasureLabel,
          ),
        ],
      ),
    );
  }
}
