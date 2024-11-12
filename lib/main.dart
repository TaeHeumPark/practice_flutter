import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:workout_tracker/workout_guide_page.dart';
import 'landing_page.dart';
import 'package:flutter/services.dart';
import 'workout_list_page.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: FlexThemeData.light(scheme: FlexScheme.redWine),
      home: WorkoutGuidePage(),
    );
  }
}

