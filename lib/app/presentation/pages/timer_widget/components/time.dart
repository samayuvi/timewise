import 'package:flutter/material.dart';

import '../../../providers/timer_provider.dart';

class Time extends StatelessWidget {
  const Time({
    super.key,
    required this.timerService,
  });

  final TimerService timerService;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        '${timerService.digitHours}:${timerService.digitMinutes}:${timerService.digitSeconds}',
        style: const  TextStyle(
          fontSize: 70,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}