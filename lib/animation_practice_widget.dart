import 'package:flutter/material.dart';

class AnimationPracticeWidget extends StatefulWidget {
  const AnimationPracticeWidget({super.key});

  @override
  State<AnimationPracticeWidget> createState() => _AnimationPracticeWidgetState();
}

class _AnimationPracticeWidgetState extends State<AnimationPracticeWidget> with SingleTickerProviderStateMixin{
  
  late AnimationController _controller;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
        duration: Duration(seconds: 4),
        vsync: this
    );

    final Animation<double> _curvedAnimation = CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _animation = Tween<double>(
      begin: 50,
      end: 200
    ).animate(_curvedAnimation)..addListener(() {
      setState(() {});
    });

    // 자동으로 toggle 호출
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.toggle();
      }
    });

    // _animation.addListener(() {
    //   setState(() {});
    // });
    _controller.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: _animation.value,
          height: _animation.value,
          color: Colors.blue,
        ),
      ),
    );
  }
}
