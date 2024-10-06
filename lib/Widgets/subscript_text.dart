import 'package:flutter/material.dart';

class SubscriptText extends StatelessWidget {
  const SubscriptText({super.key, required this.text, required this.subscription, required this.color, required this.subscriptionColor});

  final String text;
  final String subscription;
  final Color color;
  final Color subscriptionColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: TextStyle(color: color, fontSize: 40, fontWeight: FontWeight.w400),
        ),
        Text(
          subscription,
          style: TextStyle(color: subscriptionColor, fontSize: 18, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}
