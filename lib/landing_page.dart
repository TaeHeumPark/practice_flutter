import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
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
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage('assets/runner.png'), opacity: 0.3)
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
                child: Center(child: ElevatedButton(onPressed: () {}, child: Text('Start')))
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