import 'package:flutter/material.dart';
import 'package:workout_tracker/custom_app_bar.dart';
import 'package:audioplayers/audioplayers.dart';

class WorkoutGuidePage extends StatefulWidget {
  final String? id;

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
    player.setSource(AssetSource('audio/lunge.mp3'));

    return Scaffold(
      appBar: CustomAppBar(title: "WorkoutGuide"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text('스쿼트', style: theme.textTheme.displaySmall),
          Flexible(
            child: Row(
              children: [
                IconButton(
                  onPressed: (){}, icon: Icon(Icons.arrow_back_ios),
                  iconSize: theme.textTheme.displayLarge?.fontSize,
                ),
                Expanded(
                  child: Image.asset('assets/exercise/squat.jpeg'
                  ),
                ),
                IconButton(
                  onPressed: (){}, icon: Icon(Icons.arrow_forward_ios),
                  iconSize: theme.textTheme.displayLarge?.fontSize,
                ),
              ],
            ),
          ),
          Text(
            '30분',
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
            icon: Icon(state == 0 ? Icons.play_circle_fill : Icons.stop_circle),
            iconSize: theme.textTheme.headlineLarge?.fontSize,
            color: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }
}
