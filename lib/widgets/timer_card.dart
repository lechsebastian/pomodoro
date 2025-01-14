import 'package:flutter/material.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:pomodoro/widgets/my_card.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          'FOCUS',
          style: myTextStyle(35, Colors.white, FontWeight.w700),
        ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCard(
              text: '2',
            ),
            const SizedBox(width: 10),
            Text(
              ':',
              style: myTextStyle(60, Colors.red.shade200, FontWeight.bold),
            ),
            const SizedBox(width: 10),
            MyCard(
              text: '59',
            ),
          ],
        ),
      ],
    );
  }
}
