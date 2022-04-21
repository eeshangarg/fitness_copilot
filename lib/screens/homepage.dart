import 'package:fitness_copilot/models/workout.dart';
import 'package:fitness_copilot/screens/workouts.dart';
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

  int _selectedIndex = 0;
  final List<String> _tabNames = [
    kDashboardLabel,
    kWorkoutsLabel,
    kHistoryLabel,
    kMeasureLabel,
  ];

  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _widgetOptions = <Widget>[
      const Text(
        kDashboardLabel,
        style: optionStyle,
      ),
      ChangeNotifierProvider(
        create: (context) => WorkoutChangeNotifier(),
        child: const Workouts(),
      ),
      const Text(
        kHistoryLabel,
        style: optionStyle,
      ),
      const Text(
        kMeasureLabel,
        style: optionStyle,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(_tabNames[_selectedIndex]),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
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
