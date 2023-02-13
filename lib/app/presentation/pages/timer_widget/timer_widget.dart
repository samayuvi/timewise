import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_wise/app/presentation/providers/timer_provider.dart';

import 'components/start_stop_buttons.dart';
import 'components/time.dart';
import 'components/title.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final timerService = context.watch<TimerService>();

    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TextTitle(),
                Time(timerService: timerService),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                StartStopButtons(timerService: timerService)
              ],
            ),
          )),
    );
  }
}




