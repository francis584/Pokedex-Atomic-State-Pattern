import 'package:flutter/material.dart';

class Intro1Widget extends StatelessWidget {
  const Intro1Widget({super.key});

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
                'assets/images/pokedex_intro.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
