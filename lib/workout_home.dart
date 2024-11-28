import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/dashboard_card.dart';
import 'package:workout_tracker/data/workout_manager.dart';
import 'package:workout_tracker/landing_page.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({super.key});

  @override
  State<WorkoutHome> createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    int cnt = 0;

    // 랜덤 색상을 반환하는 메서드
    Color getRandomColor() {
      final colors = [
        Colors.red.shade200,
        Colors.green.shade200,
        Colors.blue.shade200,
        Colors.orange.shade200,
        Colors.purple.shade200,
        Colors.pink.shade200,
        Colors.yellow.shade600,
        Colors.cyan.shade200,
      ];
      return colors[Random().nextInt(colors.length)];
    }

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Just Do It'),
                      Text('간단하다. 흔들리면 그것은 '),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/profile.jfif'))),
                )
              ],
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: DashboardCard(
                      cardIcon: Icons.fitness_center,
                      cardTitle: 'Monthly',
                      cardContext: '12회',
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 50,
                    child: Column(
                      children: [
                        Expanded(
                          child: DashboardCard(
                            cardIcon: Icons.update,
                            cardTitle: '오늘운동시간',
                            cardContext: '10분',
                          ),
                        ),
                        Expanded(
                          child: DashboardCard(
                            cardIcon: Icons.fitness_center,
                            cardTitle: '소모칼로리',
                            cardContext: '100Kcal',
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      // theme.colorScheme.onPrimary
                      SizedBox(
                        width: 250,
                        child: DashboardCard(
                          cardBackgroundColor: getRandomColor(),
                          cardIcon: Icons.run_circle_outlined,
                          cardIconColor: theme.colorScheme.onPrimary,
                          cardTitleColor: theme.colorScheme.onPrimary,
                          cardContentColor: theme.colorScheme.onPrimary,
                          cardTitle: '그룹1',
                          cardContext: WorkoutManager.workoutGroups[0].groupDescription,
                          cardImageAsset: 'assets/group1.jpg',
                          customOnTap: () {
                            context.go('/workout_home/workout_list/0');
                          },
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: DashboardCard(
                          cardBackgroundColor: getRandomColor(),
                          cardIcon: Icons.rowing_outlined,
                          cardIconColor: theme.colorScheme.onPrimary,
                          cardTitleColor: theme.colorScheme.onPrimary,
                          cardContentColor: theme.colorScheme.onPrimary,
                          cardTitle: '그룹2',
                          cardContext: WorkoutManager.workoutGroups[1].groupDescription,
                          cardImageAsset: 'assets/group2.jpg',
                          customOnTap: () {
                            context.go('/workout_home/workout_list/1');
                          },
                        ),
                      ),
                      SizedBox(
                        width: 250,
                        child: DashboardCard(
                          cardBackgroundColor: getRandomColor(),
                          cardIcon: Icons.fitness_center,
                          cardIconColor: theme.colorScheme.onPrimary,
                          cardTitleColor: theme.colorScheme.onPrimary,
                          cardContentColor: theme.colorScheme.onPrimary,
                          cardTitle: '그룹3',
                          cardContext: WorkoutManager.workoutGroups[2].groupDescription,
                          cardImageAsset: 'assets/group3.jpg',
                          customOnTap: () {
                            context.go('/workout_home/workout_list/2');
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
                flex: 3,
                child: DashboardCard(
                  cardBackgroundColor: getRandomColor(),
                  cardIcon: Icons.list,
                  cardIconColor: theme.colorScheme.onPrimary,
                  cardTitleColor: theme.colorScheme.onPrimary,
                  cardContentColor: theme.colorScheme.onPrimary,
                  cardTitle: '운동 이어서 하기',
                  cardContext: '당신의 몸은 해낼 수 있다. 당신의 마음만 설득하면 된다.',
                  customOnTap: () {
                    if(WorkoutManager.currentWorkoutGroupIndex == null) return;
                    context.go('/workout_home/workout_list/${WorkoutManager.currentWorkoutGroupIndex}');
                  },
                ))
          ],
        ),
      )),
    );
  }
}
