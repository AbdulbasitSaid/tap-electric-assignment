import 'package:flutter/material.dart';

class AppReachText extends StatelessWidget {
  const AppReachText({
    super.key,
    required this.title,
    required this.value,
    required this.unit,
  });

  final String? title;
  final String? value;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: title,
        style: const TextStyle(
          color: Colors.black38,
          fontSize: 20,
        ),
        children: [
          TextSpan(
            text: ' $value $unit',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
