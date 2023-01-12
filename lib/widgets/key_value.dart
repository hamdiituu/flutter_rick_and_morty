import 'package:flutter/material.dart';

class KeyValue extends StatelessWidget {
  final String displayValue;
  final String displayKey;
  const KeyValue(
      {Key? key, required this.displayKey, required this.displayValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text(
            '$displayKey :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
          ),
          Text(
            displayValue,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
