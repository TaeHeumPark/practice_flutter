import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:workout_tracker/main.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    Function? goHome() {
      context.go(
          '/workout_home'
      );
      return null;
    }
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Center(
        child: Container(
          child: Column(
            children: [
              Spacer(flex: 1),
              Flexible(
                child: Container(
                  child: Center(child: Text('남들이 그만둘때, 난 계속한다.')),
                ),
                flex: 1,
              ),
              Flexible(child:
              FadeTransition(
                opacity: _animation,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('assets/runner.png'), opacity: 0.3)
                  ),
                ),
              ),
                flex: 7,
              ),
              Flexible(child:
              Container(
                child: Center(child: Text('환영합니다', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))
                ,
              ),
                flex: 1,
              ),
              Flexible(child:
              Container(
                child: Center(child: ElevatedButton(onPressed: () {
                  goHome();
                }, child: Text('Start')))
                ,
              ),
                flex: 1,
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}