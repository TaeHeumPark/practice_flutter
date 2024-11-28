import 'package:flutter/material.dart';
import 'package:workout_tracker/custom_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Login',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Login',style: Theme.of(context).textTheme.bodyLarge,),
            OutlinedButton(
              onPressed: () {},
              child: Text('go to Register page'),
            ),
          ],
        ),
      ),
    );
  }
}