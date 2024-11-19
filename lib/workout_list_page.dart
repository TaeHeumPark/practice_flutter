import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'model/exercise.dart';
import 'package:go_router/go_router.dart';

class WorkoutListPage extends StatelessWidget {
  const WorkoutListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'WorkoutList',),
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
          itemCount: exercises.length,
          itemBuilder: (context, index) {
            final exercise = exercises[index];
            return GestureDetector(
              onTap: () {
                context.go(
                  '/guild/${index + 1}',
                  extra: {"id" : (index + 1)},
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
    );
  }
}
