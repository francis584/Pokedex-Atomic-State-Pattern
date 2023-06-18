import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class Intro3Widget extends StatelessWidget {
  const Intro3Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff94a48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  SizedBox(height: 72),
                  Image.asset(
                    'assets/images/pokedex-1.png',
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedTextKit(
                    pause: Duration(milliseconds: 5000),
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Com sua Pokédex ao seu lado, você terá tudo o que precisa para se tornar um mestre Pokémon.',
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Pokemongb'),
                        speed: Duration(milliseconds: 60),
                      ),
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
