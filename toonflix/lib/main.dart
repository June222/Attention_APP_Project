import 'package:flutter/material.dart';
import 'package:toonflix/toonScreens/toon_screens.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ToonScreen();
  }
}
