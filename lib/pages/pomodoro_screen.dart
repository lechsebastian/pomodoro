import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:pomodoro/widgets/progress.dart';
import 'package:pomodoro/widgets/time_controller.dart';
import 'package:pomodoro/widgets/time_options.dart';
import 'package:pomodoro/widgets/timer_card.dart';
import 'package:provider/provider.dart';

class PomodoroScreen extends StatelessWidget {
  const PomodoroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Scaffold(
      backgroundColor: renderPrimaryColor(provider.currentState),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: renderPrimaryColor(provider.currentState),
        title: Text(
          'POMOTIMER',
          style: myTextStyle(25, Colors.white, FontWeight.w700),
        ),
        actions: [
          IconButton(
            onPressed: () =>
                Provider.of<TimerService>(context, listen: false).resetTimer(),
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              TimerCard(),
              SizedBox(height: 60),
              TimeOptions(),
              SizedBox(height: 120),
              TimeController(),
              SizedBox(height: 60),
              Progress(),
            ],
          ),
        ),
      ),
    );
  }
}
