import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:pomodoro/widgets/my_card.dart';
import 'package:provider/provider.dart';

class TimerCard extends StatelessWidget {
  const TimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          provider.currentState,
          style: myTextStyle(35, Colors.white, FontWeight.w700),
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyCard(
              text: (provider.currentDuration ~/ 60).toString(),
            ),
            const SizedBox(width: 10),
            Text(
              ':',
              style: myTextStyle(60,
                  renderSecondaryColor(provider.currentState), FontWeight.bold),
            ),
            const SizedBox(width: 10),
            MyCard(
              text: ((provider.currentDuration).toInt() % 60 < 10 ? '0' : '') +
                  ((provider.currentDuration).toInt() % 60).toString(),
            ),
          ],
        ),
      ],
    );
  }
}
