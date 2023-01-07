import 'package:flutter/material.dart';

class MyLargeTitle extends StatelessWidget {
  const MyLargeTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "My Large Title",
      style: TextStyle(
        color: Theme.of(context).textTheme.titleLarge?.color,
        fontSize: 30,
      ),
    );
  }
}
