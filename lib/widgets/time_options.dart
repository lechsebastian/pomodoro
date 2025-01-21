import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:provider/provider.dart';

class TimeOptions extends StatelessWidget {
  const TimeOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = selectableTimes.indexOf('1500');
    final double screenWidth = MediaQuery.of(context).size.width;
    final double initialScrollOffset =
        (selectedIndex * (70 + 20)) - (screenWidth / 2) + (70 / 2) + 10;

    final provider = Provider.of<TimerService>(context);

    return SingleChildScrollView(
      controller: ScrollController(initialScrollOffset: initialScrollOffset),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: selectableTimes.map((time) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
              onTap: () => provider.selectTime(double.parse(time)),
              child: Container(
                width: 70,
                height: 50,
                decoration: int.parse(time) == provider.selectedTime
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
                    style: int.parse(time) == provider.selectedTime
                        ? myTextStyle(25, Colors.redAccent, FontWeight.w700)
                        : myTextStyle(25, Colors.white, FontWeight.w700),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
