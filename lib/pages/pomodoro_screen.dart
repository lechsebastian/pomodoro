import 'package:flutter/material.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:pomodoro/widgets/progress.dart';
import 'package:pomodoro/widgets/time_controller.dart';
import 'package:pomodoro/widgets/time_options.dart';
import 'package:pomodoro/widgets/timer_card.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.redAccent,
        title: Text(
          'POMOTIMER',
          style: myTextStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const TimerCard(),
              const SizedBox(height: 60),
              TimeOptions(),
              const SizedBox(height: 120),
              const TimeController(),
              const SizedBox(height: 60),
              Progress(),
            ],
          ),
        ),
      ),
    );
  }
}
