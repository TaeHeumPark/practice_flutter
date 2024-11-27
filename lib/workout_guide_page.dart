import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/custom_app_bar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:workout_tracker/model/exercise.dart';
import 'model/exercise.dart';

class WorkoutGuidePage extends StatefulWidget {
  final int? id;

  WorkoutGuidePage({required this.id,super.key});

  @override
  State<WorkoutGuidePage> createState() => _WorkoutGuidePageState();
}

class _WorkoutGuidePageState extends State<WorkoutGuidePage> {
  final player = AudioPlayer();
  int state = 0;

  @override
  Widget build(BuildContext context) {
    // init
    final theme = Theme.of(context);
    int id = widget.id ?? 0;

    // 전달된 extra 데이터 가져오기
    // final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    // 이거 args?['id']만 쓰면 String 타입으로 받아와서 int로 변환하는 작업 필수
    // final id = (args?['id'] is int) ? args!['id'] : int.tryParse(args?['id'].toString() ?? '') ?? 0;

    // id에 해당하는 Exercise 객체 가져오기
    final exercise = exercises.firstWhere(
          (exercise) => exercise.id == id,
      orElse: () => Exercise(
        id: 0,
        name: 'Unknown',
        imagePath: '',
        durationInMinutes: 0,
        audioName: '',
        kcal: 0,
      ),
    );


    // 오디오 소스 설정
    player.setSource(AssetSource(exercise.audioName));

    return Scaffold(
      appBar: CustomAppBar(title: "WorkoutGuide"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(exercise.name, style: theme.textTheme.displaySmall),
          Flexible(
            child: Row(
              children: [
                IconButton(
                  onPressed: () async {
                    if(id > 0) {
                      await player.stop();
                      context.go(
                        '/workout_home/workout_list/guild/${id - 1}'
                      );
                    }
                    return;
                  }, icon: Icon(Icons.arrow_back_ios),
                  iconSize: theme.textTheme.displayLarge?.fontSize,
                ),
                Expanded(
                  child: Image.asset(exercise.imagePath
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    await player.stop();
                    if(id < exercises.length - 1) {
                      context.go(
                        '/workout_home/workout_list/guild/${id + 1}'
                      );
                    }
                    return;
                  }, icon: Icon(Icons.arrow_forward_ios),
                  iconSize: theme.textTheme.displayLarge?.fontSize,
                ),
              ],
            ),
          ),
          Text(
            '${exercise.durationInMinutes} 분',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.secondary,
            ),
          ),
          IconButton(
            onPressed: (){
              if(state == 0) {
                  state = 1;
                setState(() {
                  player.resume();
                });
              } else {
                  state = 0;
                setState(() {
                  player.pause();
                });
              }
              // player.play(AssetSource('audio/lunge.mp3'));
              // player.resume();
            },
            icon: Icon(state == 0 ? Icons.play_circle_fill : Icons.pause_circle),
            iconSize: theme.textTheme.headlineLarge?.fontSize,
            color: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
