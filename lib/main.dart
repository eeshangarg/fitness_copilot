import 'package:dynamic_color/dynamic_color.dart';
import 'package:fitness_copilot/screens/homepage.dart';
import 'package:fitness_copilot/shared/providers/theme.dart';
import 'package:fitness_copilot/shared/providers/timer_service.dart';
import 'package:fitness_copilot/shared/style_constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    TimerServiceProvider(
      service: TimerService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(
    ThemeSettings(
      sourceColor: kMaterialThemeSourceColor,
      themeMode: ThemeMode.system,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(builder: (lightDynamic, darkDynamic) {
      return ThemeProvider(
        lightDynamic: lightDynamic,
        darkDynamic: darkDynamic,
        settings: settings,
        child: NotificationListener<ThemeSettingChange>(
          onNotification: (notification) {
            settings.value = notification.settings;
            return true;
          },
          child: ValueListenableBuilder(
            valueListenable: settings,
            builder: (context, value, _) {
              final theme = ThemeProvider.of(context);

              return MaterialApp(
                title: 'Fitness Copilot',
                theme: theme.light(settings.value.sourceColor),
                home: const HomePage(),
              );
            },
          ),
        ),
      );
    });
  }
}
