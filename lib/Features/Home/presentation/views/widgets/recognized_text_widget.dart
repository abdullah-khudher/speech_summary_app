import 'package:flutter/cupertino.dart';

class RecognizedTextWidget extends StatelessWidget {
  final String text;
  const RecognizedTextWidget({required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  const TextStyle(fontSize: 12),
    );
  }
}