import 'dart:async';
import 'package:flutter/material.dart';
import 'data/wise_saying.dart';

class AnimatedTextCarousel extends StatefulWidget {
  const AnimatedTextCarousel({super.key});

  @override
  State<AnimatedTextCarousel> createState() => _AnimatedTextCarouselState();
}

class _AnimatedTextCarouselState extends State<AnimatedTextCarousel> {
  late final List<String> _quotes;
  late final PageController _pageController;
  late Timer _timer;
  late int nextPage;

  @override
  void initState() {
    super.initState();
    _quotes = wiseSayings.keys.toList(); // 명언 리스트
    _pageController = PageController(initialPage: 0);
    _startAutoSlide();
  }

  @override
  void dispose() {
    _pageController.dispose(); // PageController 정리
    _timer.cancel(); // Timer 정리
    super.dispose();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= _quotes.length) {
          nextPage = 0; // 마지막 페이지면 처음으로
        }
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 100, // PageView 높이 설정
        child: PageView.builder(
          controller: _pageController,
          itemCount: _quotes.length,
          onPageChanged: (int index) {
            setState(() {
              nextPage = index + 1;
            });
          },
          itemBuilder: (context, index) {
            final String currentQuote = _quotes[index];
            final String author = wiseSayings[currentQuote]!;

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: SingleChildScrollView(
                      child: Text(
                        currentQuote,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "- $author",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}