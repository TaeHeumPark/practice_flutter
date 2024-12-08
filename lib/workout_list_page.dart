import 'package:flutter/material.dart';
import 'package:workout_tracker/model/exercise.dart';
import 'custom_app_bar.dart';
import 'data/workout_manager.dart';
import 'package:go_router/go_router.dart';

class WorkoutListPage extends StatelessWidget {
  final int groupIndex;

  WorkoutListPage({super.key, required this.groupIndex}) {
    WorkoutManager.currentWorkoutGroupIndex = groupIndex;
    WorkoutManager.increaseMonthlyWorkoutCount();
  }
  late List<Exercise> exercises;

  @override
  Widget build(BuildContext context) {
    if(groupIndex == -1) {
      exercises = WorkoutManager.exercises;
    }
    else {
      exercises = WorkoutManager.workoutGroups[groupIndex].exercises;
    }

    return Scaffold(
      appBar: CustomAppBar(title: 'WorkoutList',),
      body: Column(
        children: [
          Hero(
            tag: 'group_$groupIndex', // WorkoutHome의 Hero tag와 동일하게 설정
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/group${groupIndex+1}.jpg'), // 해당 그룹의 이미지
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return GestureDetector(
                  onTap: () {
                    context.go(
                      '/workout_home/workout_list/$groupIndex/guild/$index'
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 3.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Image.asset(
                              exercise.imagePath,
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              '${index + 1}. ${exercise.name}',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            child: Text(
                              '${exercise.durationInMinutes}분',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
