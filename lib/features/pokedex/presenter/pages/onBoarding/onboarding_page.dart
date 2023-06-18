import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:pokedex_egsys/features/pokedex/presenter/pages/onBoarding/widgets/intro_1_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/onBoarding/widgets/intro_2_widget.dart';
import 'package:pokedex_egsys/features/pokedex/presenter/pages/onBoarding/widgets/intro_3_widget.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  late final _pageController;
  bool onLastPage = false;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) => setState(() {
            onLastPage = (value == 2);
          }),
          children: [
            Intro1Widget(),
            Intro2Widget(),
            Intro3Widget(),
          ],
        ),
        Container(
          alignment: Alignment(0, 0.8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: Text(
                  onLastPage ? '     ' : 'Pular'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 12,
                      fontFamily: 'Pokemongb'),
                ),
                onTap: () => _pageController.jumpToPage(2),
              ),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.white,
                ),
              ),
              onLastPage
                  ? GestureDetector(
                      child: Text(
                        'Vamos lá'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Pokemongb'),
                      ),
                      onTap: () => context.pushReplacement('/home'))
                  : GestureDetector(
                      child: Text(
                        'Próximo'.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            fontFamily: 'Pokemongb'),
                      ),
                      onTap: () => _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeIn,
                      ),
                    ),
            ],
          ),
        )
      ],
    ));
  }
}
