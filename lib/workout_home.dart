import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/animated_text_carousel.dart';
import 'package:workout_tracker/animation_practice_widget.dart';
import 'package:workout_tracker/dashboard_card.dart';
import 'package:workout_tracker/data/workout_manager.dart';
import 'package:workout_tracker/firebase_auth_service.dart';
import 'package:workout_tracker/landing_page.dart';

class WorkoutHome extends StatefulWidget {
  const WorkoutHome({super.key});

  @override
  State<WorkoutHome> createState() => _WorkoutHomeState();
}

class _WorkoutHomeState extends State<WorkoutHome> {
  late Future<int> montlyCountFuture;
  late Future<int> todayExerciseMinute;
  late Future<int> consumptionKcal;

  final FirebaseAuthService _auth = FirebaseAuthService();
  String? profileImageURL;


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

  @override
  void initState() {
    montlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    todayExerciseMinute = WorkoutManager.getTodayExerciseMinute();
    consumptionKcal = WorkoutManager.getConsumptionKcal();
    profileImageURL = _auth.user?.photoURL;
    // 유저 정보 변경시 수정된 이미지 URL 가져오기
    _auth.userChangesStream().listen(
        (user){
          setState(() {
            profileImageURL = user?.photoURL;
          });
        }
    );
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WorkoutHome oldWidget) {
    super.didUpdateWidget(oldWidget);
    montlyCountFuture = WorkoutManager.getMonthlyWorkoutCount();
    todayExerciseMinute = WorkoutManager.getTodayExerciseMinute();
    consumptionKcal = WorkoutManager.getConsumptionKcal();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);



    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AnimatedTextCarousel(),
                ),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    border: Border.all(width: 4, color: Colors.orange),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: profileImageURL != null
                            ? NetworkImage(profileImageURL!)
                            : AssetImage('assets/me.jpg'),
                        onError: (_,__){
                          setState(() {
                            profileImageURL = null;
                          });
                        },
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 4,
              child: Row(
                children: [
                  Expanded(
                    flex: 50,
                    child: FutureBuilder(
                      // 빌드가 되는 과정에서 30번 호출이 될 수도 있음
                      // 그래서 함수를 future타입에 넣으면 안됨
                      // 함수로 리턴된 future타입을 넣을 것
                      future: montlyCountFuture,
                      builder: (context, snapshot) {
                        if(snapshot.connectionState == ConnectionState.waiting) {
                          return CircularProgressIndicator();
                        }
                        if(snapshot.hasError) {
                          return Text('Error : ${snapshot.error}');
                        }
                        final monthlyWorkoutCount = snapshot.data ?? 0;
                        return DashboardCard(
                          cardIcon: Icons.fitness_center,
                          cardTitle: 'Monthly',
                          cardContext: '${monthlyWorkoutCount}회',
                        );
                      }
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
                          child: FutureBuilder(
                            future: todayExerciseMinute,
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if(snapshot.hasError) {
                                return Text('Error : ${snapshot.error}');
                              }
                              final todayExerciseMinute = snapshot.data ?? 0;
                              return DashboardCard(
                                cardIcon: Icons.update,
                                cardTitle: '오늘운동시간',
                                cardContext: '${todayExerciseMinute}분',
                              );
                            }
                          ),
                        ),
                        Expanded(
                          child: FutureBuilder(
                            future: consumptionKcal,
                            builder: (context, snapshot) {
                              if(snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              }
                              if(snapshot.hasError) {
                                return Text('Error : ${snapshot.error}');
                              }
                              final consumptionKcal = snapshot.data ?? 0;
                              return DashboardCard(
                                cardIcon: Icons.fitness_center,
                                cardTitle: '소모칼로리',
                                cardContext: '${consumptionKcal}Kcal',
                              );
                            }
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
                          child: Hero(
                            tag: 'group_1',
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
                        ),
                      SizedBox(
                        width: 250,
                        child: Hero(
                          tag: 'group_2',
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
                      ),
                      SizedBox(
                        width: 250,
                        child: Hero(
                          tag: 'group_3',
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
