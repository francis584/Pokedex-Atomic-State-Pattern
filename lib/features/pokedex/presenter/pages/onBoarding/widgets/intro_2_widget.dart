import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';

class Intro2Widget extends StatefulWidget {
  const Intro2Widget({super.key});

  @override
  State<Intro2Widget> createState() => _Intro2WidgetState();
}

class _Intro2WidgetState extends State<Intro2Widget> {
  bool step2 = false, step3 = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xfff94a48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Image.asset(
                'assets/images/pokedex-2.png',
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: AnimatedTextKit(
                        pause: Duration(milliseconds: 1000),
                        isRepeatingAnimation: false,
                        onFinished: () => setState(() {
                              step2 = true;
                            }),
                        animatedTexts: [
                          TypewriterAnimatedText(
                            'Prepare-se para explorar um mundo cheio de criaturas fascinantes conhecidas como Pokémon.',
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Pokemongb'),
                            speed: Duration(milliseconds: 60),
                          ),
                        ]),
                  ),
                  SizedBox(height: 24),
                  if (step2)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AnimatedTextKit(
                          pause: Duration(milliseconds: 1000),
                          isRepeatingAnimation: false,
                          onFinished: () => setState(() {
                                step3 = true;
                              }),
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Sua Pokédex é sua melhor companheira nesta aventura.',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pokemongb'),
                              speed: Duration(milliseconds: 60),
                            ),
                          ]),
                    ),
                  SizedBox(height: 24),
                  if (step3)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: AnimatedTextKit(
                          pause: Duration(milliseconds: 1000),
                          isRepeatingAnimation: false,
                          animatedTexts: [
                            TypewriterAnimatedText(
                              'Ela fornece informações detalhadas sobre diferentes espécies de Pokémon, suas características, habilidades e até mesmo suas evoluções.',
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pokemongb'),
                              speed: Duration(milliseconds: 60),
                            ),
                          ]),
                    ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
