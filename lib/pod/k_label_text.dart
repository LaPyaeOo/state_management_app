import 'package:flutter/material.dart';

class KLabelText extends StatelessWidget {
  final String text;

  const KLabelText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
