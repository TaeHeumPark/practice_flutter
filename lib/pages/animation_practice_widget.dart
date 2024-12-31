import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() =>
      _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> {
  // late AnimationController _controller;
  // late Animation _animation;
  Alignment _alignment = Alignment.bottomRight;

  @override
  void initState() {
    super.initState();

    // _controller = AnimationController(
    //     duration: Duration(seconds: 4),
    //     vsync: this
    // );
    //
    // final Animation<double> _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);
    //
    // _animation = Tween<double>(
    //   begin: 50,
    //   end: 200
    // ).animate(_curvedAnimation)..addListener(() {
    //   setState(() {});
    // });
    //
    // // 자동으로 toggle 호출
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed ||
    //       status == AnimationStatus.dismissed) {
    //     _controller.toggle();
    //   }
    // });
    //
    // _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 3),
            builder: (context, value, child) {
          return Opacity(child: child, opacity: value);
        },
        child: Text(
          'Hello world!',
          style: TextStyle(fontSize: 24),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
