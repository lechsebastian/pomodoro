import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pomodoro/utils/utils.dart';

class TimerService extends ChangeNotifier {
  Timer? timer;
  double currentDuration = 1500;
  double selectedTime = 1500;
  bool timerPlaying = false;
  int rounds = 0;
  int goals = 0;
  String currentState = 'FOCUS';

  double setInitialOffset(double screenWidth) {
    final int selectedIndex = selectableTimes.indexOf('1500');
    return (selectedIndex * (70 + 20)) - (screenWidth / 2) + (70 / 2) + 10;
  }

  void selectTime(double seconds) {
    selectedTime = seconds;
    currentDuration = seconds;
    notifyListeners();
  }

  void resetTimer() {
    if (timer?.isActive ?? false) timer!.cancel();
    timerPlaying = false;
    currentState = 'FOCUS';
    currentDuration = selectedTime = 1500;
    rounds = 0;
    goals = 0;
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
    if (timer?.isActive ?? false) {
      timer!.cancel();
      timerPlaying = false;
      notifyListeners();
    }
  }

  void hanldeNextRound() {
    switch (currentState) {
      case "FOCUS":
        if (rounds != 3) {
          currentState = 'BREAK';
          currentDuration = 300;
          selectedTime = 300;
          rounds++;
          goals++;
        } else {
          currentState = 'LONGBREAK';
          currentDuration = 1500;
          selectedTime = 1500;
          rounds++;
          goals++;
        }
        break;
      case "BREAK":
        currentState = 'FOCUS';
        currentDuration = 1500;
        selectedTime = 1500;
        break;
      case "LONGBREAK":
        currentState = 'FOCUS';
        currentDuration = 1500;
        selectedTime = 1500;
        rounds = 0;
        break;
    }
    notifyListeners();
  }
}
