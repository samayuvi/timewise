
import 'package:flutter/material.dart';

class AddTaskFormInput extends StatelessWidget {
  const AddTaskFormInput(
      {Key? key, required this.onChanged, required this.hintText})
      : super(key: key);
  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.bodyMedium,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        hintStyle: TextStyle(
            color: Theme.of(context)
                .textTheme
                .bodyMedium!
                .color!
                .withOpacity(0.7)),
        hintText: hintText,
        fillColor: Theme.of(context).cardTheme.color,
        contentPadding: const EdgeInsets.all(12.0),
      ),
    );
  }
}

