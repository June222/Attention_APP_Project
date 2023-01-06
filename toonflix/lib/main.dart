import "package:flutter/material.dart";

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int counter = 0;

  void onClicked() {
    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: const Color(0xFFF4E9D6),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Click Counter",
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            Text(
              "$counter",
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
            IconButton(
              onPressed: onClicked,
              icon: const Icon(
                Icons.add_box_rounded,
                size: 30,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    ));
  }
}
