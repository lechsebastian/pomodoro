import 'package:flutter/material.dart';
import 'package:pomodoro/utils/utils.dart';

class TimeOptions extends StatelessWidget {
  TimeOptions({super.key});

  final int selectedTime = 1500;

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = selectableTimes.indexOf(selectedTime.toString());
    final double screenWidth = MediaQuery.of(context).size.width;
    final double initialScrollOffset =
        (selectedIndex * (70 + 20)) - (screenWidth / 2) + (70 / 2) + 10;

    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: initialScrollOffset),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return Container(
            margin: const EdgeInsets.only(left: 10, right: 10),
            width: 70,
            height: 50,
            decoration: int.parse(time) == selectedTime
                ? BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  )
                : BoxDecoration(
                    border: Border.all(color: Colors.white30, width: 3),
                    borderRadius: BorderRadius.circular(5),
                  ),
            child: Center(
              child: Text(
                (int.parse(time) ~/ 60).toString(),
                style: int.parse(time) == selectedTime
                    ? myTextStyle(25, Colors.redAccent, FontWeight.w700)
                    : myTextStyle(25, Colors.white, FontWeight.w700),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
