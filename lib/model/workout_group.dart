import 'package:workout_tracker/model/exercise.dart';

class WorkoutGroup {
  String groupDescription;

  List<Exercise> exercises;
  WorkoutGroup({required this.groupDescription, required this.exercises});
}