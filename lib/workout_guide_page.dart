import 'package:flutter/material.dart';
import 'package:workout_tracker/custom_app_bar.dart';

class WorkoutGuidePage extends StatelessWidget {
  const WorkoutGuidePage({super.key});

  @override
  Widget build(BuildContext context) {

    // init
    final theme = Theme.of(context);

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
            onPressed: (){},
            icon: Icon(Icons.play_circle_fill),
            iconSize: theme.textTheme.headlineLarge?.fontSize,
            color: theme.colorScheme.primary,
          )
        ],
      ),
    );
  }
}
