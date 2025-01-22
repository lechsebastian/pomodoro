// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:pomodoro/timer_service.dart';
import 'package:pomodoro/utils/utils.dart';
import 'package:provider/provider.dart';

class MyCard extends StatelessWidget {
  String text;

  MyCard({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TimerService>(context);

    return Container(
      width: MediaQuery.of(context).size.width / 3.2,
      height: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            spreadRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: myTextStyle(
              70, renderPrimaryColor(provider.currentState), FontWeight.bold),
        ),
      ),
    );
  }
}
