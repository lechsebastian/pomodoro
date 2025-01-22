import 'dart:async';

import 'package:flutter/material.dart';

class TimerService extends ChangeNotifier {
  late Timer timer;
  double currentDuration = 10;
  double selectedTime = 10;
  bool timerPlaying = false;
  int rounds = 0;
  int goals = 0;
  String currentState = 'FOCUS';

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void startTimer() {
    timerPlaying = true;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (currentDuration > 0) {
        currentDuration--;
        notifyListeners();
      } else {
        hanldeNextRound();
      }
    });
  }

  void pauseTimer() {
    timer.cancel();
    timerPlaying = false;
    notifyListeners();
  }

  void hanldeNextRound() {
    switch (currentState) {
      case "FOCUS":
        if (rounds != 3) {
          currentState = 'BREAK';
          currentDuration = 5;
          selectedTime = 5;
          rounds++;
          goals++;
        } else {
          currentState = 'LONGBREAK';
          currentDuration = 10;
          selectedTime = 10;
          rounds++;
          goals++;
        }
        break;
      case "BREAK":
        currentState = 'FOCUS';
        currentDuration = 10;
        selectedTime = 10;
        break;
      case "LONGBREAK":
        currentState = 'FOCUS';
        currentDuration = 10;
        selectedTime = 10;
        rounds = 0;
        break;
    }
    notifyListeners();
  }
}
