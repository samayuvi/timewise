
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:time_wise/generated/locale_keys.g.dart';

class AddTaskButton extends StatelessWidget {
  const AddTaskButton({
    super.key,
    required this.onPressed

  });

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Text(
        LocaleKeys.add_item.tr(),
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}