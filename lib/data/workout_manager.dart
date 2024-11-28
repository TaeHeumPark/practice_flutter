import 'package:workout_tracker/model/exercise.dart';
import 'package:workout_tracker/model/workout_group.dart';

class WorkoutManager {
  static int? currentWorkoutGroupIndex;
  static final List<Exercise> exercises = [
    Exercise(
      id: 0,
      name: '스쿼트',
      imagePath: 'assets/exercise/squat.jpeg',
      durationInMinutes: 30,
      audioName: 'audio/squat.mp3',
      kcal: 200,
    ),
    Exercise(
      id: 1,
      name: '사이드런지',
      imagePath: 'assets/exercise/side_lunge.jpeg',
      durationInMinutes: 20,
      audioName: 'audio/side_lunge.mp3',
      kcal: 100,
    ),
    Exercise(
      id: 2,
      name: '푸쉬업',
      imagePath: 'assets/exercise/pushup.jpeg',
      durationInMinutes: 15,
      audioName: 'audio/pushup.mp3',
      kcal: 100,
    ),
    Exercise(
      id: 3,
      name: '마운틴 클림버',
      imagePath: 'assets/exercise/mountain_climber.jpeg',
      durationInMinutes: 15,
      audioName: 'audio/mountain_climber.mp3',
      kcal: 50,
    ),
    Exercise(
      id: 4,
      name: '런지',
      imagePath: 'assets/exercise/lunge.jpeg',
      durationInMinutes: 20,
      audioName: 'audio/lunge.mp3',
      kcal: 100,
    ),
    Exercise(
      id: 5,
      name: '덤벨컬',
      imagePath: 'assets/exercise/dumbell_curl.jpeg',
      durationInMinutes: 40,
      audioName: 'audio/dumbell_curl.mp3',
      kcal: 200,
    ),
    Exercise(
      id: 6,
      name: '덩커킥',
      imagePath: 'assets/exercise/donkey_kick.jpeg',
      durationInMinutes: 30,
      audioName: 'audio/donkey_kick.mp3',
      kcal: 50,
    ),
    Exercise(
      id: 7,
      name: '친업',
      imagePath: 'assets/exercise/chinup.jpeg',
      durationInMinutes: 20,
      audioName: 'audio/chinup.mp3',
      kcal: 300,
    ),
    Exercise(
      id: 8,
      name: '벤치프레스',
      imagePath: 'assets/exercise/benchpress.jpeg',
      durationInMinutes: 10,
      audioName: 'audio/benchpress.mp3',
      kcal: 250,
    ),
  ];

  static List<WorkoutGroup> workoutGroups = [
    WorkoutGroup(
        groupDescription: '아침을 여는 5가지 운동프로그램',
        exercises: [
          exercises[0],
          exercises[1],
          exercises[3],
          exercises[4],
          exercises[5],
        ]
    ),
    WorkoutGroup(
        groupDescription: '근력을 키우는 7가지 프로그램',
        exercises: [
          exercises[0],
          exercises[2],
          exercises[3],
          exercises[4],
          exercises[5],
          exercises[7],
          exercises[8],
        ]
    ),
    WorkoutGroup(
        groupDescription: '하루를 마무리하는 상쾌한 운동',
        exercises: [
          exercises[1],
          exercises[4],
        ]
    )

  ];
}