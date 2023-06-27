// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';

class HomeError extends StatelessWidget {
  final String error;
  const HomeError({
    Key? key,
    required this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/svg/not-found.svg',
            semanticsLabel: 'server error',
            width: 110,
            height: 110,
            fit: BoxFit.contain,
            // ignore: deprecated_member_use
            color: Colors.black,
          ),
          Wrap(children: [
            Text(
              error,
              style: TextStyle(color: Colors.black, fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ]),
        ],
      ),
    );
  }
}
