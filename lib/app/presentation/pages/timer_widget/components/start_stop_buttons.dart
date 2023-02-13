import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/app/presentation/providers/timer_provider.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class StartStopButtons extends StatelessWidget {
  const StartStopButtons({
    super.key,
    required this.timerService,
  });

  final TimerService timerService;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: RawMaterialButton(
            onPressed: () {
              (!timerService.started) ? timerService.startTimer() : timerService.stopTimer();
            },
            shape: const StadiumBorder(
              side: BorderSide(
                color: Colors.blue,
              ),
            ),
            child: Text(
              (!timerService.started) ?LocaleKeys.start.tr() : LocaleKeys.stop.tr(),
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(width: 10,),

        Expanded(
          child: RawMaterialButton(
            fillColor: Colors.blue,
            onPressed: () {
              timerService.resetTimer();
            },
            shape: const StadiumBorder(
              side: BorderSide(
                color: Colors.blue,
              ),
            ),
            child: const Text(
              'Reset',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}