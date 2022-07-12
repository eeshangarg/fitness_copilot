import 'dart:async';

import 'package:flutter/material.dart';

// The code below was taken verbatim from this StackOverflow post:
// https://stackoverflow.com/questions/53228993/how-to-implement-persistent-stopwatch-in-flutter
class TimerService extends ChangeNotifier {
  final Stopwatch _watch = Stopwatch();
  Timer? _timer;

  Duration get currentDuration => _currentDuration;
  Duration _currentDuration = Duration.zero;

  bool get isRunning => _timer != null;

  TimerService();

  void _onTick(Timer timer) {
    _currentDuration = _watch.elapsed;
    notifyListeners();
  }

  void start() {
    if (_timer != null) return;

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      _onTick,
    );
    _watch.start();

    notifyListeners();
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
    _watch.stop();
    _currentDuration = _watch.elapsed;

    notifyListeners();
  }

  void reset() {
    stop();
    _watch.reset();
    _currentDuration = Duration.zero;

    notifyListeners();
  }

  static TimerService of(BuildContext context) {
    var provider =
        context.dependOnInheritedWidgetOfExactType<TimerServiceProvider>()
            as TimerServiceProvider;
    return provider.service;
  }
}

class TimerServiceProvider extends InheritedWidget {
  const TimerServiceProvider({
    Key? key,
    required this.service,
    required Widget child,
  }) : super(key: key, child: child);

  final TimerService service;

  @override
  bool updateShouldNotify(TimerServiceProvider oldWidget) =>
      service != oldWidget.service;
}
