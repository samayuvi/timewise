
import 'package:flutter/material.dart';

class UnderlinedTextButton extends StatelessWidget {
  const UnderlinedTextButton({Key? key, required this.onPressed, required this.thinText, required this.boldText}) : super(key: key);
  final Function() onPressed;
  final String thinText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text(
            thinText,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10.0),
          InkWell(
            onTap: onPressed,
            child: Text(
              boldText,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
