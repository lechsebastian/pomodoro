import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:provider/provider.dart';

class Progress extends StatelessWidget {
  const Progress({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              '${provider.rounds}/4',
              style: myTextStyle(35, Colors.grey[350]!, FontWeight.bold),
            ),
            const SizedBox(width: 20),
            Text(
              '${provider.goals}/12',
              style: myTextStyle(35, Colors.grey[350]!, FontWeight.bold),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'ROUND',
              style: myTextStyle(20, Colors.white, FontWeight.bold),
            ),
            const SizedBox(width: 20),
            Text(
              'GOAL',
              style: myTextStyle(20, Colors.white, FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}
