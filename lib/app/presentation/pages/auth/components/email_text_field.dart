import 'package:flutter/material.dart';


class EmailTextField extends StatelessWidget {
  const EmailTextField({Key? key, required this.onChanged}) : super(key: key);

  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'OpenSans',
          ),
        ),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          height: 60.0,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(
              color: Colors.black87,
              fontFamily: 'OpenSans',
            ),
            onChanged: onChanged,
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 14.0),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.black,
              ),
              hintText: 'Enter your Email',
              hintStyle: TextStyle(
                color: Colors.black38,
                fontFamily: 'OpenSans',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
