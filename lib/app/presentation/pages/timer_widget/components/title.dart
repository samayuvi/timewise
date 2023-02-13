
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../generated/locale_keys.g.dart';

class TextTitle extends StatelessWidget {
  const TextTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.time_tracker.tr(),
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

