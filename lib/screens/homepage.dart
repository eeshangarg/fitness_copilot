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
  late final Future<DataCapsule> _fetchDataCapsule =
      DataCapsule.fromFirestore();

  static const String kDashboardLabel = 'Dashboard';
  static const String kWorkoutsLabel = 'Workouts';
  static const String kHistoryLabel = 'History';
  static const String kMeasureLabel = 'Measure';

  int _selectedIndex = 0;
  final List<String> _tabNames = [
    kDashboardLabel,
    kWorkoutsLabel,
    kHistoryLabel,
    kMeasureLabel,
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
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
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabNames[_selectedIndex]),
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
                child: widgetOptions.elementAt(_selectedIndex),
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_rounded),
            label: kDashboardLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: kWorkoutsLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_rounded),
            label: kHistoryLabel,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.straighten_rounded),
            label: kMeasureLabel,
          ),
        ],
      ),
    );
  }
}
